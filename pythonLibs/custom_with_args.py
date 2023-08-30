from example import Connection


class CustomWithArgs:
    def __init__(self, host=None, port=80):
        if host is None:
            host = "10.0.0.1"
        self._host = host
        self._port = port
        self._conn = None

    def _connect(self):
        self._conn = Connection()  # Instantiate the Connection object
        self._conn.connect(self._host, self._port)  # Use a connect method

    def send_message(self, message):
        if self._conn is None:
            self._connect()  # Establish connection if not already done
        self._conn.send_message(message)  # Use a send_message method of Connection

# class CustomWithArgs:
#     def __init__(self, arg1, arg2):
#         self._arg1 = arg1
#         self._arg2 = arg2
#
#     def send_message(self, message):
#         print(f"Sending message: {message}")
#         print(f"Using arg1: {self._arg1}")
#         print(f"Using arg2: {self._arg2}")
#
