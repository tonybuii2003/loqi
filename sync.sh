if git submodule status | grep --quiet '^-'; then
    git submodule update --init
fi

git pull
git submodule foreach git switch main
git submodule foreach git pull

proj_home=$PWD

cd $proj_home/activity && yarn &
cd $proj_home/ai && yarn &
cd $proj_home/deck && yarn &
cd $proj_home/neo_client && yarn &
cd $proj_home/payment && yarn &
cd $proj_home/repository && yarn &
cd $proj_home/session && yarn &

wait