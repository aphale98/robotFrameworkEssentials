from robot.api import logger
from robot.api.deco import keyword


def keyword_1(arg1, arg2='default'):
    logger.info(f"Running Keyword 1 with arguments: arg1={arg1}, arg2={arg2}")
    return arg1 + " " + arg2


def keyword_2(value):
    logger.info(f"Running Keyword 2 with argument: value={value}")
    return value.upper()


class DynamicLibraryExample:

    @keyword
    def run_keyword(self, name, args, kwargs):
        if name == 'Keyword 1':
            return keyword_1(*args, **kwargs)
        elif name == 'Keyword 2':
            return keyword_2(*args, **kwargs)
        else:
            raise ValueError(f"Unknown keyword: {name}")
