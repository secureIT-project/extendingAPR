import pathlib
import argparse

import lizard

if __name__ == "__main__":
    argparser = argparse.ArgumentParser()
    argparser.add_argument(
        "source_file",
        type=lambda x: pathlib.Path(x).absolute(),
        help="Source code file.",
    )
    args = argparser.parse_args()

    assert args.source_file.is_file()

    functions = lizard.analyze_file(str(args.source_file)).function_list

    for function in functions:
        if function.name == "loop":
            print(function.end_line)
            break
