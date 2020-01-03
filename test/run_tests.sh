#!/usr/bin/env bash

# Unit tests
cur_dir=$PWD

echo "Current directory: '$cur_dir' ..."
export PYTHONPATH=$PWD
#export PYTHONPATH=$PYTHONPATH:$PWD/test/tmp/shinken # we also need shinken test/modules...
#export PYTHONPATH=$PYTHONPATH:$PWD/test/tmp/shinken/test # we also need shinken test/modules...
#export PYTHONPATH=$PYTHONPATH:$PWD/test/tmp/shinken/test/modules # we also need mock_livestatus from mod-livestatus..
echo "Python path: '$PYTHONPATH' ..."

cd "$cur_dir"/test
export ALIGNAK_DAEMON="test_broker"
pytest -vv --durations=0 --no-print-logs --cov="$cur_dir"/alignak_webui_graphite --cov-report=xml --cov-config "$cur_dir"/test/.coveragerc "$cur_dir"/test/test.py

cd "$cur_dir"
