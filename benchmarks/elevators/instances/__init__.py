# ----------------------------------------------------------------------------------------------------------------------
# benchmarks/blocksworld/instances/__init__.py
#
# Elevators  instances
# ----------------------------------------------------------------------------------------------------------------------

from collections import namedtuple
from typing import Tuple, List, Dict

from dataclasses import dataclass

import tarski

import tarski.model
from tarski.model import Model
from tarski.evaluators.simple import evaluate
from tarski import FirstOrderLanguage
from tarski.syntax import CompoundTerm, Constant, Predicate, symref
from tarski.theories import Theory
from tarski.sas import Schema, Action


factory = {}


@dataclass
class Domain(object):
    theory: FirstOrderLanguage
    constants: List[Constant]
    schemas: List[Schema]


@dataclass
class Instance(object):
    initial: List[Tuple[CompoundTerm, Constant]]
    goal: List[Tuple[CompoundTerm, Constant]]
    domains: Dict[str, List[Constant]]
    struct: Model


def define_domain() -> Domain:
    """
    Creates the domain
    :return:
    """
    theory = tarski.language("elevators", theories=[Theory.EQUALITY, Theory.ARITHMETIC])
    object_t = theory.Object
    int_t = theory.Integer

    # predicates/functions for schema constraints
    above = theory.predicate('above', object_t, object_t)
    reachable = theory.predicate('reachable-floor', object_t, object_t)
    can_hold = theory.function('can-hold', object_t, int_t)

    # state factors
    at_lift = theory.function('lift-at', object_t, object_t)
    at_passenger = theory.function('passenger-at', object_t, object_t)
    passengers = theory.function('passengers', object_t, int_t)

    # schema parameters
    l = theory.variable('l', object_t)
    f1 = theory.variable('f1', object_t)
    f2 = theory.variable('f2', object_t)
    v1 = theory.variable('v1', int_t)
    v2 = theory.variable('v2', int_t)
    p = theory.variable('p', object_t)

    move_up_slow = Schema(name='move-up-slow',
                          variables=[(l, 'slow-elevators'), (f1, 'floors'), (f2, 'floors')],
                          constraints=[reachable(l, f1), reachable(l, f2), above(f2, f1), f1 != f2],
                          transitions=[
                              (at_lift(l), f1, f2)
                          ])

    move_up_fast = Schema(name='move-up-fast',
                          variables=[(l, 'fast-elevators'), (f1, 'floors'), (f2, 'floors')],
                          constraints=[reachable(l, f1), reachable(l, f2), above(f2, f1), f1 != f2],
                          transitions=[
                              (at_lift(l), f1, f2)
                          ])

    move_down_slow = Schema(name='move-down-slow',
                          variables=[(l, 'slow-elevators'), (f1, 'floors'), (f2, 'floors')],
                          constraints=[reachable(l, f1), reachable(l, f2), above(f1, f2), f1 != f2],
                          transitions=[
                              (at_lift(l), f1, f2)
                          ])

    move_down_fast = Schema(name='move-down-fast',
                          variables=[(l, 'fast-elevators'), (f1, 'floors'), (f2, 'floors')],
                          constraints=[reachable(l, f1), reachable(l, f2), above(f1, f2), f1 != f2],
                          transitions=[
                              (at_lift(l), f1, f2)
                          ])

    board = Schema(name='board',
                   variables=[(l, 'lifts'), (f1, 'floors'), (p, 'passengers'), (v1, 'capacities'), (v2, 'capacities')],
                    constraints=[v1 + 1 == v2, can_hold(l) >= v2],
                    transitions=[
                        (at_lift(l), f1, f1),
                        (at_passenger(p), f1, l),
                        (passengers(l), v1, v2)
                    ])

    leave = Schema(name='leave',
                   variables=[(l, 'lifts'), (f1, 'floors'), (p, 'passengers'), (v1, 'capacities'), (v2, 'capacities')],
                    constraints=[v1 + 1 == v2],
                    transitions=[
                        (at_lift(l), f1, f1),
                        (at_passenger(p), l, f1),
                        (passengers(l), v2, v1)
                    ])

    return Domain(theory=theory,
                  constants=[],
                  schemas=[move_up_slow, move_up_fast, move_down_slow, move_down_fast, board, leave])


def create_p_01(domain: FirstOrderLanguage) -> Instance:
    """
    Creates the instance
    :param domain:
    :return:
    """
    floors = [domain.constant('f{}'.format(i), domain.Object) for i in range(9)]
    passengers = [domain.constant('p{}'.format(i), domain.Object) for i in range(3)]
    fast = [domain.constant('fast{}'.format(i), domain.Object) for i in range(1)]
    slow = [domain.constant('slow{}-0'.format(i), domain.Object) for i in range(2)]

    domains = {
        'floors': floors,
        'passengers': passengers,
        'fast-elevators': fast,
        'slow-elevators': slow,
        'lifts': fast + slow,
        'capacities': [domain.constant(v, domain.Integer) for v in range(9)]
    }

    above = domain.get('above')
    reachable_floor = domain.get('reachable-floor')
    can_hold = domain.get('can-hold')

    lift_at = domain.get('lift-at')
    passenger_at = domain.get('passenger-at')
    num_passengers = domain.get('passengers')

    domains[symref(num_passengers(fast[0]))] = (0, 8)
    domains[symref(num_passengers(slow[0]))] = (0, 8)
    domains[symref(num_passengers(slow[1]))] = (0, 8)

    # We define the initial state
    initial = [
        (lift_at(fast[0]), floors[0]),
        (num_passengers(fast[0]), 0),
        (lift_at(slow[0]), floors[2]),
        (num_passengers(slow[0]), 0),
        (lift_at(slow[1]), floors[4]),
        (num_passengers(slow[1]), 0),
        (passenger_at(passengers[0]), floors[8]),
        (passenger_at(passengers[1]), floors[3]),
        (passenger_at(passengers[2]), floors[2])
    ]

    # and the goal
    goal = [
        (passenger_at(passengers[0]), floors[4]),
        (passenger_at(passengers[1]), floors[6]),
        (passenger_at(passengers[2]), floors[1])
    ]


    struct = tarski.model.create(domain)
    struct.evaluator = evaluate

    # above predicates
    for i in range(len(floors)):
        for j in range(i+1, len(floors)):
            struct.add(above, floors[j], floors[i])
    # reachable
    fast_floors = [[0, 2, 4, 6, 8]]
    for lift_idx in range(1):
        can_reach = fast_floors[lift_idx]
        for idx in can_reach:
            struct.add(reachable_floor, fast[lift_idx], floors[idx])

    slow_floors = [[0, 1, 2, 3, 4],
                   [4, 5, 6, 7, 8]]
    for lift_idx in range(2):
        can_reach = slow_floors[lift_idx]
        for idx in can_reach:
            struct.add(reachable_floor, slow[lift_idx], floors[idx])

    # capacities
    struct.set(can_hold(fast[0]), 3)
    struct.set(can_hold(slow[0]), 2)
    struct.set(can_hold(slow[1]), 2)
    print(struct.as_atoms())

    return Instance(initial=initial, goal=goal, domains=domains, struct=struct)


factory['p01'] = create_p_01

