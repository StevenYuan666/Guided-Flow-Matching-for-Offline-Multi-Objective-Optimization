echo "Running all experiments"
path="/home/admin1/Documents/GFMO-Guided-Flow-Matching-for-Offline-Multi-Objective-Optimization/scripts"
echo "Running synthetic functions experiments"
bash ${path}/gfmo_exps_syn_functions.sh
echo "Running NAS experiments"
bash ${path}/gfmo_exps_NAS.sh
echo "Running RE experiments"
bash ${path}/gfmo_exps_RE.sh
echo "Running RL experiments"
bash ${path}/gfmo_exps_RL.sh
echo "Running scientific designs experiments"
bash ${path}/gfmo_exps_sci_designs.sh
echo "All main experiments completed"
# echo "Running Hyperparameter Sensitivity Analysis"
# bash ${path}/gfmo_hyperparam_sensitivity.sh