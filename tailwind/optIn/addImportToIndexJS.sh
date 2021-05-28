#!/usr/bin/env bash

echo "Adding Tailwind import statement to index.js..."
sed -i "1s/^/import 'tailwindcss\/tailwind.css'\n/" "${rootPath}/src/index.js"
