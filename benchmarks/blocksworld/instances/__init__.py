# ----------------------------------------------------------------------------------------------------------------------
# benchmarks/blocksworld/instances/__init__.py
#
# Blocksworld  instances
# ----------------------------------------------------------------------------------------------------------------------
from collections import namedtuple
from typing import Tuple, List, Dict

import tarski

from tarski import FirstOrderLanguage
from tarski.syntax import CompoundTerm, Constant
from tarski.theories import Theory
from tarski.sas import Schema, Action

factory = {}


def define_domain() -> Tuple[FirstOrderLanguage, List[Constant], List[Schema]]:

    lang = tarski.language("blocksworld", theories=[Theory.EQUALITY])
    object_type = lang.Object

    # domain constants
    table = lang.constant('table', object_type)
    nothing = lang.constant('nothing', object_type)


    # State factors
    on = lang.function('on', object_type, object_type)
    below = lang.function('below', object_type, object_type)
    holding = lang.function('holding', object_type)

    # Schema parameters
    target = lang.variable('x', object_type)
    target2 = lang.variable('y', object_type)

    pickup = Schema(name='pickup',
                    variables=[(target, 'blocks')],
                    constraints=[],
                    transitions=[
                        (holding(), nothing, target),
                        (on(target), nothing, nothing),
                        (below(target), table, nothing)
                    ])

    putdown = Schema(name='putdown',
                     variables=[(target, 'blocks')],
                     constraints=[],
                     transitions=[
                         (holding(), target, nothing),
                         (on(target), nothing, nothing),
                         (below(target), nothing, table)
                     ])

    stack = Schema(name='stack',
                   variables=[(target, 'blocks'), (target2, 'blocks')],
                   constraints=[target != target2],
                   transitions=[
                       (holding(), target, nothing),
                       (on(target2), nothing, target),
                       (below(target), nothing, target2)
                   ])

    unstack = Schema(name='unstack',
                     variables=[(target, 'blocks'), (target2, 'blocks')],
                     constraints=[target != target2],
                     transitions=[
                         (holding(), nothing, target),
                         (on(target2), target, nothing),
                         (below(target), target2, nothing)
                     ])

    return lang, [table, nothing], [pickup, putdown, stack, unstack]


# instance p-4-0

def create_p_4_0(domain: FirstOrderLanguage) -> Tuple[List[Tuple[CompoundTerm, Constant]],
                                                List[Tuple[CompoundTerm, Constant]],
                                                Dict[str, List[Constant]]]:
    """
    Creates the instance
    :param domain:
    :return:
    """
    table = domain.get('table')
    nothing = domain.get('nothing')

    on = domain.get('on')
    below = domain.get('below')
    holding = domain.get('holding')

    blocks = [domain.constant(b, domain.Object) for b in ['A', 'B', 'C', 'D']]
    A, B, C, D = blocks

    domains = {
        'blocks': blocks
    }

    # We define the initial state
    initial = [
        (on(C), nothing),
        (on(A), nothing),
        (on(B), nothing),
        (on(D), nothing),
        (below(C), table),
        (below(A), table),
        (below(B), table),
        (below(D), table),
        (holding(), nothing)
    ]

    # and the goal
    goal = [
        (on(C), D),
        (on(B), C),
        (on(A), B)
    ]

    return initial, goal, domains


factory['probBLOCKS-4-0'] = create_p_4_0


def create_p_4_1(domain: FirstOrderLanguage) -> Tuple[List[Tuple[CompoundTerm, Constant]],
                                                List[Tuple[CompoundTerm, Constant]],
                                                Dict[str, List[Constant]]]:
    """
    Creates the instance
    :param domain:
    :return:
    """
    table = domain.get('table')
    nothing = domain.get('nothing')

    on = domain.get('on')
    below = domain.get('below')
    holding = domain.get('holding')

    blocks = [domain.constant(b, domain.Object) for b in ['A', 'B', 'C', 'D']]
    A, B, C, D = blocks

    domains = {
        'blocks': blocks
    }

    # We define the initial state
    initial = [
        (on(B), nothing),
        (below(B), C),
        (on(C), B),
        (below(C), A),
        (on(A), C),
        (below(A), D),
        (on(D), A),
        (below(A), D),
        (below(D), table),
        (holding(), nothing)
    ]

    # and the goal
    goal = [
        (on(C), D),
        (on(A), C),
        (on(B), A)
    ]

    return initial, goal, domains


factory['probBLOCKS-4-1'] = create_p_4_1
