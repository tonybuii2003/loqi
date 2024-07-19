if git submodule status | grep --quiet '^-'; then
    git submodule update --init
fi

git pull
git submodule foreach git switch main
git submodule foreach git pull

proj_home=$PWD

cd $proj_home/activity &
cd $proj_home/ai &
cd $proj_home/deck &
cd $proj_home/neo_client &
cd $proj_home/payment &
cd $proj_home/repository &
cd $proj_home/session &

wait