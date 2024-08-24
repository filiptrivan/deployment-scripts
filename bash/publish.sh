#!/bin/bash

PROJECT_PATH="$1"
PROJECT_OUTPUT_PATH="$2"

if [ -z "$PROJECT_PATH" ]; then
    echo "Error: The PROJECT_PATH parameter must be provided."
    exit 1
fi

if [ -z "$PROJECT_OUTPUT_PATH" ]; then
    echo "Error: The PROJECT_OUTPUT_PATH parameter must be provided."
    exit 1
fi

if [ ! -f "$PROJECT_PATH" ] || { [[ "$PROJECT_PATH" != *.csproj ]] && [[ "$PROJECT_PATH" != *.sln ]]; }; then
    echo "Error: The provided project path '$PROJECT_PATH' is not a valid .csproj or .sln file."
    exit 1
fi

# Build
dotnet build "$PROJECT_PATH" --configuration Release
if [ $? -ne 0 ]; then
    echo "Error: Build failed."
    exit 1
fi

# Publish
dotnet publish "$PROJECT_PATH" --configuration Release --output "$PROJECT_OUTPUT_PATH/data"
if [ $? -ne 0 ]; then
    echo "Error: Publish failed."
    exit 1
fi

zip -r "$PROJECT_OUTPUT_PATH/publish.zip" "$PROJECT_OUTPUT_PATH/data"
if [ $? -ne 0 ]; then
    echo "Error: Zip creation failed."
    exit 1
fi

echo "Publishing completed. Please manually copy the files from '$PROJECT_OUTPUT_PATH' to the server."
