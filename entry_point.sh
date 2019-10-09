PROCESS_PID=''

handle_sig_term() {
    echo "SIGTERM received, informing the process and killing the pid ${WORKER_PID}"
    kill -TERM ${WORKER_PID}
    wait ${WORKER_PID}
}

handle_sig_int() {
    echo "SIGINT received, informing the process and killing the pid ${WORKER_PID}"
    kill -INT ${WORKER_PID}
    wait ${WORKER_PID}
}

trap 'handle_sig_term' TERM
trap 'handle_sig_int' INT

python my_process.py & PROCESS_PID=$!
wait ${WORKER_PID}
