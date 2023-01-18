#!/usr/bin/env bash

SESSION="ansible-rulebook-environment"

echo "Creating tmux session"

tmux new-session -d -s ${SESSION}
tmux rename-window ansible-rulebook-environment
tmux select-pane -T ansible-rulebook
tmux split-window -v
tmux select-pane -T cli
echo "Starting ansible-rulebook webhook server"
tmux send-keys -t %0 'ansible-rulebook --rulebook rulebooks/1-test.yaml -i inventory.yaml --verbose' ^M
sleep 3
echo "Sending JSON to webhook server"
tmux send-keys -t %1 'curl -H "Content-Type: application/json" -d '\''{"state":"provisioning","host":"localhost"}'\'' http://localhost:5000/endpoint' ^M
echo "Entering tmux session"
tmux a -t ${SESSION}:0