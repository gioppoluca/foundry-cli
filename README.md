# foundry-cli

This is an image to use the foundry-cli
This image container 2 scripts to pack and unpack the LDB files in a module

Since the scripts are in the `/app` folder the module code HAS to be mounted in a volume as described in the commands in a subfolder named `mod`.

## pack
The packing command is as follows supposing that you are running the command from the root of the module:
``` sh
docker run -v .:/app/mod  ghcr.io/gioppoluca/foundry-cli:main pack.js
```

## unpack
The unpacking command is as follows supposing that you are running the command from the root of the module:
``` sh
docker run -v .:/app/mod  ghcr.io/gioppoluca/foundry-cli:main unpack.js
```

This approach allows you to manage your module as json files that are more manageable to diff and to use a pipeline in git when you have to release it.



## Example of usage in github action

``` yaml
name: Unpack Foundry VTT Packs

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  unpack:
    runs-on: ubuntu-latest

    steps:
      # Step 1: Check out the repository
      - name: Check out repository
        uses: actions/checkout@v3

      # Step 2: Run the container image
      - name: Unpack packs with Foundry CLI
        run: |
          docker run --rm \
            -v ${{ github.workspace }}:/app/mod \
            ghcr.io/gioppoluca/foundry-cli:main
            
```