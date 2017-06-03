#!/bin/bash
RUN_TEST=false;

while getopts ":t" opt; do
  case $opt in
    t)
    RUN_TEST=true;
    ;;
  \?)
    echo "Invalid option: -$OPTARG" >&2
      exit 1
    ;;
  esac
done

echo "🗑  - removing old copy of source files .."
rm -rf ./example/node_modules/react-native-select-input-ios/src

for data in *; do
  if [ -d "$data" ]; then
    if [ $data == "src" ]; then
      cp -R ./$data ./example/node_modules/react-native-select-input-ios/
      echo "🚚  - copied $data folder .."
    fi
  fi
done

if [ "$RUN_TEST" = true ]; then
  echo "☠️  - running tests .." && npm test
fi

echo "🔧  - done!"

exit 0