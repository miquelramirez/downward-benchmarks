# ----------------------------------------------------------------------------------------------------------------------
# benchmarks/blocksworld/__main__.py
#
# Blocksworld SAS instance manager
# ----------------------------------------------------------------------------------------------------------------------

import json
from argparse import ArgumentParser, Namespace
from collections import namedtuple
from itertools import product
from tarski.evaluators.simple import evaluate

import tarski
import tarski.model

from tarski.syntax import symref

from tarski.syntax.transform.substitutions import substitute_expression, create_substitution
from tarski.util import SymbolIndex

from benchmarks.blocksworld.instances import factory, define_domain

Action = namedtuple('Action', ['name', 'arguments', 'transitions'])


def process_command_line():
    parser = ArgumentParser(description="Example illustrating acquisition of instance data from PDDL")
    parser.add_argument("--instance", dest='instance', default='4-0')
    parser.add_argument("--verbose", dest='verbose', action='store_true')
    opt = parser.parse_args()
    return opt


def check_constraints(C, s, subst):
    """
    Returns true if s \models C[x/subst(x)], that is, the result of replacing every variable symbol x by
    subst(x) in C is satisfiable under s.
    :param C: A constraint (predicate)
    :param s: A semantic structure (model) object
    :param subst: A mapping of variable symbols in C to constants
    :return:
    """
    return all([s[substitute_expression(c, subst)] for c in C])


def ground_action_schemas(lang, schemas, domains):
    """
    Straightforward grounding by enumeration
    :param lang: domain theory
    :param schemas: action schemas to be enumerated
    :return:
    """

    actions = []
    s = tarski.model.create(lang)
    s.evaluator = evaluate

    for sch in schemas:
        sch_x = [entry[0] for entry in sch.variables]
        sch_D = [domains[entry[1]] for entry in sch.variables]

        for a in product(*sch_D):
            subst = create_substitution(sch_x, a)
            if not check_constraints(sch.constraints, s, subst):
                continue

            action_a = Action(name=sch.name,
                              arguments=a,
                              transitions=[(substitute_expression(x, subst),
                                            substitute_expression(pre, subst),
                                            substitute_expression(post, subst)) for x, pre, post in sch.transitions])
            actions += [action_a]

    return actions


def dump(lang, actions, initial, goal, objects, fp):
    """
    Serializes instance elements (domain theory, actions, initial state and goal condition) into a JSON
    formatted stream.

    :param lang: Domain theory
    :param actions: List of ground actions
    :param init: Initial state, a list of equality literals, given as pairs of terms
    (symbol of the form $x(\bar{a})$) and values v (constant symbols)
    :param goal: Goal state, a list of equality literals, given as pairs of term (as above) and values v (as above)
    :param fp:
    :return:
    """

    # `SymbolIndex` is a container class that allows to define a set of objects, where each element is indexed
    X = SymbolIndex()

    # We identify the set of terms by inspecting 1) action transition constraints, 2) the definition of the
    # initial state, and 3) the structure of the (conjunctive) goal formula.
    for act in actions:
        for x, _, _ in act.transitions:
            if symref(x) in X:
                continue
            X.add(symref(x))

    for x, _ in initial:
        if symref(x) in X:
            continue
        X.add(symref(x))

    for x, _ in goal:
        if symref(x) in X:
            continue
        X.add(symref(x))

    # We aggregate all "named" constants in a set (domain) D
    D = SymbolIndex()
    for obj in objects:
        D.add(symref(obj))

    # Depending on the planner, it may be convenient to have definitions of "types" subsets of D, the naturals,
    # integers or the reals even
    types_data = [
        {"name": "object",
         "domain": [str(o) for o in objects]}
    ]

    # Here we setup an index that defines the variables of the SAS instance. For each variable we give its
    # symbolic representation (a string of characters like "on(A)"), and a reference to its domain (set of
    # objects). Note that a domain does not need to be "tight" and may include many values that never appear
    # in the set of solutions of transition constraints.
    vars_data = [
        {"name": str(x.expr),
         "type": "object"} for x in X.objects
    ]

    # Now we provide the list of symbolic representations for each of the actions in the instance
    action_names = [
        "{}({})".format(a.name, ",".join([str(arg) for arg in a.arguments])) for a in actions
    ]


    # The transition function is factored as table constraints $Tr(a,x)$, and for each constraint
    # - indexed by action and variable - we give the pairs of values v and w s.t. for any tuple
    # (s,a,s') \in Tr, s \models v, s' \models w.
    trans_data = []

    for k, a in enumerate(actions):
        for x, v, w in a.transitions:
            trans_data += [
                {"a": k,
                 "x": X.get_index(symref(x)),
                 "v": D.get_index(symref(v)),
                 "w": D.get_index(symref(w))}
            ]

    # We provide the definitions of initial and goal states as lists of pairs of indices into the
    # set of variables and values in the domain D.
    init_data = [[X.get_index(symref(x)), D.get_index(symref(v))] for x, v in initial]

    goal_data = [[X.get_index(symref(x)), D.get_index(symref(v))] for x, v in goal]

    # Now we put all the instance data together and build the JSON document
    doc = {
        "metadata": {
            "domain": "blocksworld",
            "instance": "probBLOCKS-4-0"
        },
        "types": types_data,
        "vars": vars_data,
        "actions": action_names,
        "trans": trans_data,
        "init": init_data,
        "goal": goal_data
    }

    json.dump(doc, fp, indent=4)


def main(opt: Namespace):

    dom_theory, constants, schemas = define_domain()
    initial, goal, domains = factory['probBLOCKS-4-0'](dom_theory)

    # Once the schemas are defined, we ground them
    actions = ground_action_schemas(dom_theory, schemas, domains)

    print("Ground actions generated:", len(actions))

    # we group together all the instance objects
    objects = constants + [v for D in domains.values() for v in D]
    print(objects)

    # and we store the result in a JSON document
    with open("probBLOCKS-4-0.json", "w") as output:
        dump(dom_theory, actions, initial, goal, objects, output)


if __name__ == '__main__':
    opt = process_command_line()
    main(opt)