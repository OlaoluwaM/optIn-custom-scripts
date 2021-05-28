#!/usr/bin/env bash

echo "Removing TailwindCSS import statement from index.js"
tailwindImportLineNumber=$(grep -Rn "import 'tailwindcss/tailwind.css'" "${rootPath}/src/index.js" | grep -oE '[0-9]+')
sed -i "${tailwindImportLineNumber}d" "${rootPath}/src/index.js"
