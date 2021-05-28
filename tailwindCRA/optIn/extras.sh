#!/usr/bin/env bash

echo "Editing package.json file"
echo $(jq '.scripts.start = "craco start"' "${rootPath}/package.json") >$rootPath/package.json
echo $(jq '.scripts.build = "craco build"' "${rootPath}/package.json") >$rootPath/package.json
echo $(jq '.scripts.test = "craco test"' "${rootPath}/package.json") >$rootPath/package.json

read -r -d '' tailwindComponents <<EOM
    @tailwind base;
    @tailwind components;
    @tailwind utilities;
EOM

echo $tailwindComponents >>"${rootPath}/src/tailwind.css"

echo "Adding Tailwind import statement to index.js..."
sed -i "1s/^/import '.\/tailwind.css'\n/" "${rootPath}/src/index.js"
