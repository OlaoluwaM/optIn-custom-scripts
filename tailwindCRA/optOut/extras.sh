#!/usr/bin/env bash

echo $(jq '.scripts.start = "react-scripts start"' "${rootPath}/package.json") >$rootPath/package.json
echo $(jq '.scripts.build = "react-scripts build"' "${rootPath}/package.json") >$rootPath/package.json
echo $(jq '.scripts.test = "react-scripts test"' "${rootPath}/package.json") >$rootPath/package.json

echo "Removing TailwindCSS import statement from index.js"
tailwindImportLineNumber=$(grep -Rn "import './tailwind.css'" "${rootPath}/src/index.js" | grep -oE '[0-9]+')
sed -i "${tailwindImportLineNumber}d" "${rootPath}/src/index.js"
