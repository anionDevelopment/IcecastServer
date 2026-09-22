---
name: product-knowledge
description: What IcecastServer is, how this repository is structured and which mechanisms exist for building and testing it. Use this before fixing a defect or developing a feature in this repository, to know where things belong and how to verify a change.
---

# IcecastServer

IcecastServer is a docker-image for running an [Icecast](https://icecast.org)-server in a container. The
product is the image, not Icecast: the server itself is installed from the package-repository of the
base-image and is not modified.

## Structure of the repository

The repository follows the "common project structure": all sourcecode lives in code-units, and every code-unit
has its own `Other`-folder with its build-, quality-check- and reference-files. Use the
`work-with-common-project-structure`-skill when you need the details of that structure.

There is one code-unit, `IcecastServer`, and it is an image-definition. The PaperServer- and the
PHPBB-repository have the same shape; when something here looks unclear, compare it with those two.

## The image

The base-image is alpine, and it is not written into the dockerfile as a literal: the dockerfile takes it as
the build-argument `image_alpine`, and `Other/Build/Build.py` fills that argument with the address from
`.ScriptCollection/OCIImages/ImageDefinition.csv`. That is what makes the used base-image (and its tag)
maintainable in one place for all code-units of the repository.

The image creates the log-folder of Icecast and its two log-files and declares that folder as volume, so the
logs survive the container. The configuration of Icecast comes from the deployment, not from the image.

## The renaming

This product was called `GRYVAIcecastServer` before. The prefix `GRYVA` is obsolete and must not appear
anywhere anymore. It was left in several places at once (the `COPY`-path of the dockerfile, the
example-task, the workspace-file, both readmes, the reference and the `security.txt`), and the wrong
`COPY`-path is what broke the build - so when a further leftover shows up, expect more than one.

## Building

`scbuildcodeunits` builds everything: image-build, security-checks and the artifacts. The task `task bb`
(`BaseBuildAllCodeunits`) does the same.
