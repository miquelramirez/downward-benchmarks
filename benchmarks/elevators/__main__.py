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
from tarski.sas.util import ground_action_schemas, check_constraints
from tarski.io.sas.json import dump

from benchmarks.elevators.instances import factory, define_domain

Action = namedtuple('Action', ['name', 'arguments', 'transitions'])


def process_command_line():
    parser = ArgumentParser(description="Example illustrating acquisition of instance data from PDDL")
    parser.add_argument("--instance", dest='instance', default='p01')
    parser.add_argument("--verbose", dest='verbose', action='store_true')
    opt = parser.parse_args()
    return opt


def main(opt: Namespace):

    domain = define_domain()
    instance = factory[opt.instance](domain.theory)

    # Once the schemas are defined, we ground them
    actions = ground_action_schemas(domain.theory, domain.schemas, instance.domains, instance.struct)

    print("Ground actions generated:", len(actions))

    # we group together all the instance objects
    objects = domain.constants + [v for D in instance.domains.values() for v in D if not isinstance(v, int)]
    print(objects)

    # and we store the result in a JSON document
    with open("elevators-p01.json", "w") as output:
        dump(domain.theory, actions, instance.initial, instance.goal, objects, instance.domains, output)


if __name__ == '__main__':
    opt = process_command_line()
    main(opt)