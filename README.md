# Guided-Flows-Matching-for-Offline-Multi-Objective-Optimization

## Install Dependencies

We refer most of following steps to the README of the [offline MOO benchmark](https://github.com/lamda-bbo/offline-moo?tab=readme-ov-file#evoxbench).

### Create a Virtual Environment
```bash
conda create -n gfmo python=3.8
conda activate gfmo
conda install gxx_linux-64 gcc_linux-64
conda install --channel=conda-forge libxcrypt
pip install -r requirements.txt
bash offline_moo/fix_contents.sh ${YOUR_PATH_TO_CONDA}/envs/gfmo/lib/python3.8/site-packages/sklearn/cross_decomposition/pls_.py "pinv2" "pinv"
```

### Data Download
Download the offline dataset provided by the offline MOO benchmark [here](https://drive.google.com/drive/folders/1SvU-p4Q5KAjPlHrDJ0VGiU2Te_v9g3rT).

Put all downloaded datasets into `offline_moo/data/`

### Download and Install FoldX
1. Download FoldX Emulator [here](https://foldxsuite.crg.eu/academic-license-info).
2. Copy the contents of the downloaded archive to `~/foldx`. 
3. `cd offline_moo/off_moo_bench/problem/lambo/` Go to the directory of lambo.
4. Run `pip install -e .`.
5. Run `python scripts/black_box_opt.py optimizer=mf_genetic optimizer/algorithm=nsga2 task=proxy_rfp tokenizer=protein` to generate an instance `proxy_rfp_problem.pkl` of RFP task.

### Download and Install EvoXBench
1. Download the database [here](https://drive.google.com/file/d/11bQ1paHEWHDnnTPtxs2OyVY_Re-38DiO/view) and the datasaet [here](https://drive.google.com/file/d/1r0iSCq1gLFs5xnmp1MDiqcqxNcY5q6Hp/view).
2. Save them and move the unziped files to `offline_moo/off_moo_bench/problem/mo_nas/database` and `offline_moo/off_moo_bench/problem/mo_nas/data`.
3. Run `pip install evoxbench`.
4. Run `python offline_moo/config_evoxbench.py`

### Download and Install Mujoco
```bash
sudo apt update
sudo apt install g++
sudo apt-get upgrade libstdc++6
sudo apt install libosmesa6-dev libgl1-mesa-glx libglfw3 libghc-x11-dev
sudo apt install libcairo2-dev pkg-config python3-dev
sudo apt-get install patchelf

wget https://github.com/google-deepmind/mujoco/releases/download/2.1.0/mujoco210-linux-x86_64.tar.gz -O mujoco210_linux.tar.gz
mkdir ~/.mujoco
tar -zxvf mujoco210_linux.tar.gz -C ~/.mujoco
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.mujoco/mujoco210/bin

conda deactivate
conda env config vars set LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.mujoco/mujoco210/bin:/usr/lib/nvidia
conda activate gfmo

mkdir ${YOUR_PATH_TO_CONDA}/envs/off-moo/include/X11
mkdir ${YOUR_PATH_TO_CONDA}/envs/off-moo/include/GL
sudo cp /usr/include/X11/*.h ${YOUR_PATH_TO_CONDA}/envs/off-moo/include/X11/
sudo cp /usr/include/GL/*.h ${YOUR_PATH_TO_CONDA}/envs/off-moo/include/GL 
```

## Run Experiments
```bash
conda activate gfmo
bash scripts/gfmo_all_exps.sh
```