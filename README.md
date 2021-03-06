# Lab.js sqlite unpacking Singularity R image example

Singularity image definition for [R], forked from https://github.com/nickjer/singularity-r

It would be nice if this was quiet and did no STDOUT/STDERR unless there was a problem.

## About

`r.def` is a Singularity definition to build an image.

See `run_script.sh` for how to launch an example `RScript` process, in this 
case, the `sqlite_to_csv.R` from the labjs distribution.

## Build

You can build a local Singularity image named `r.sif`, but this requires root:

```sh
sudo singularity build r.sif r.def
```

Or, in a sandbox dir, still requires root:

```sh
sudo singularity build --sandbox rimage/ r.def
```

On the brain imaging environment, where you don't have root access, you can 
build an image file in the cloud by doing the following:

  1. Log in to https://cloud.sylabs.io/auth/tokens and create a token
  2. Copy that token to your clipboard (and save a copy locally just in case)
  3. Run `singularity remote login SylabsCloud` and paste the token in
  4. Now you can build in the cloud by running `singularity build --remote r.sif r.def`

## Run

### R

The `R` command is launched using the default run command:

```sh
singularity run r.sif
```

or as an explicit app:

```sh
singularity run --app R r.sif
```

### Rscript

The `Rscript` command is launched as an explicit app:

```sh
singularity run --app Rscript r.sif
```

Example:

```console
$ singularity run --app Rscript r.sif --version
R scripting front-end version 3.6.3 (2020-02-29)
```

## License

The code is available as open source under the terms of the [MIT License].

[R]: https://www.r-project.org/
[MIT License]: http://opensource.org/licenses/MIT
