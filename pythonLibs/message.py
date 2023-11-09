class AnotherLib:
    def __init__(self, environment='default'):
        self.environment = environment

    def do_something(self):
        if self.environment == 'test':
            print("Doing something in the test environment")
        else:
            print("Doing something in other environments")
