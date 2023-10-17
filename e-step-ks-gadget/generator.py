import string
from collections import OrderedDict
from argparse import ArgumentParser, Namespace
from tempfile import NamedTemporaryFile

instance_template = """
(define (problem prob-$num_widgets-$num_ranks)
    (:domain e-step-gadget)
    (:objects
        $rank_list - rank
        $widget_list - widget
    )
    (:init

        ;; (before r0 r1) (before r1 r2) (before r2 r3) 
        $rank_ordering

        ;; rank0
        (foo4 r0 w1)
        (foo5 r0 w1)
        (foo6 r0 w1)
            
        ;; (foo1 r1 w1) (foo2 r1 w1) ... (foo2 r2 w1) (foo3 r2 w1) ...
        $rank_initial_lits
    )
    (:goal
        (and
            ;; (foo4 r3 w1) (foo5 r3 w1) (foo6 r3 w1)
            $goal_lits
        )
    )
)
"""

def process_command_line() -> Namespace:
    """
        Processes command line
    """
    parser = ArgumentParser(description="Exist-step gadget generator")
    parser.add_argument("--num-widgets", dest='num_widgets', type=int, default=1)
    parser.add_argument("--num-ranks", dest='num_ranks', type=int, default=10)

    opt = parser.parse_args()

    return opt


def main(opt: Namespace):

    print(f"# widgets: {opt.num_widgets} # ranks: {opt.num_ranks}")

    num_widgets = opt.num_widgets
    for rank in range(1, opt.num_ranks+1):
        filename = "prob-{:03d}-{:03d}.pddl".format(num_widgets, rank)
        rank_list = ['r0'] + [f'r{k}' for k in range(1, rank+1)]
        widget_list = [f'w{k}' for k in range(1, num_widgets+1)]
        rank_ordering = []
        rank_initial_lits = []
        for k in range(1, rank+1):
            rank_ordering += [f'(before r{k-1} r{k})']
            rank_initial_lits += [f'(foo1 r{k} w1)', f'(foo2 r{k} w1)', f'(foo3 r{k} w1)']
        goal_lits = [f'(foo4 r{rank} w1)', f'(foo5 r{rank} w1)', f'(foo6 r{rank} w1)']
        with open(filename, 'w') as output:
            template = string.Template(instance_template)
            output.write(template.substitute({
                'num_widgets': "{:03d}".format(num_widgets),
                'num_ranks': '{:03d}'.format(rank),
                'rank_list': ' '.join(rank_list),
                'widget_list': ' '.join(widget_list),
                'rank_ordering': ' '.join(rank_ordering),
                'rank_initial_lits': ' '.join(rank_initial_lits),
                'goal_lits': ' '.join(goal_lits)
            }))

if __name__ == '__main__':
    main(process_command_line())