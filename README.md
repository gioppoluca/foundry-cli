# foundry-cli

This is an image to use the foundry-cli
This image container 2 scripts to pack and unpack the LDB files in a module

Since the scripts are in the `/app` folder the module code HAS to be mounted in a volume as described in the commands in a subfolder named `mod`.

## pack
The packing command is as follows supposing that you are running the command from the root of the module:
``` sh
docker run -v .:/app/mod  gioppoluca/foundry-cli:1.0.0 pack.js
```

## unpack
The unpacking command is as follows supposing that you are running the command from the root of the module:
``` sh
docker run -v .:/app/mod  gioppoluca/foundry-cli:1.0.0 unpack.js
```

This approach allows you to manage your module as json files that are more manageable to diff and to use a pipeline in git when you have to release it.
