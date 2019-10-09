import signal
import time

class GracefulKiller:
    kill_now = False

    def __init__(self):
        signal.signal(signal.SIGINT, self.exit_gracefully)
        signal.signal(signal.SIGTERM, self.exit_gracefully)

    def exit_gracefully(self, signum, frame):
        self.kill_now = True


def run_forever():
    killer = GracefulKiller()
    while not killer.kill_now:
        print("doing something in a loop ...")
        time.sleep(2)

    print("End of the program. I was killed gracefully. RIP")


if __name__ == "__main__":
    run_forever()
