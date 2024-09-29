# "mo_hopper_v2 mo_swimmer_v2"
tasks=('mo_hopper_v2' 'mo_swimmer_v2')
path="/home/admin1/Documents/GFMO-Guided-Flow-Matching-for-Offline-Multi-Objective-Optimization"

for task in "${tasks[@]}";
do
    echo "Task: $task"
    # nohup /home/admin1/anaconda3/envs/off-moo/bin/python3 ${path}/gfmo.py --task_name=$task --mode="train_proxies" --seed=0 > ${path}/log/task${task}_proxies_training.log 2>&1
    # nohup /home/admin1/anaconda3/envs/off-moo/bin/python3 ${path}/gfmo.py --task_name=$task --mode="train_flow_matching" --seed=0 > ${path}/log/task${task}_fm_training.log 2>&1
    for seed in {0..9};
    do
        nohup /home/admin1/anaconda3/envs/off-moo/bin/python3 ${path}/gfmo.py --task_name=$task --mode="sampling" --seed=$seed > ${path}/log/task${task}_seed${seed}.log 2>&1
    done
done
