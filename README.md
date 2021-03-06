# BitThunder 

A Reliable Real-Time Operating System & Application Framework

(c) 2012 James Walmsley <james@fullfat-fs.co.uk>

Currently released under a permissive 3-clause BSD license.
See LICENSE for more information.

## Directory Tree

    .dbuild                 - Dark Builder build system. (BitThunder edition).
    arch                    - Contains architecture specific code & bootstrapping for the OS.
    + $(ARCH)               - Contains common architecture components, e.g. NVIC/GIC drivers for ARM.
      + mach/$(SUBARCH)     - Machine sub-architectures, e.g. zynq, or cortex-m3/stm32 etc etc.
    bsp                     - All board-support packages found here, this is where you build from!
    doc                     - Documentation...
    drivers                 - Architecture independent drivers, e.g. I2C/USB/PCIe devices etc.
    kernel                  - Contains the RTOS scheduler (FreeRTOS).
    lib                     - Contains all BitThunder library code, i.e. the stuff not implementing the OS. Useful structures etc.
    os                      - Contains all of the BitThunder platform independent OS code.

## Development Process

From now on the master branch is locked into a stable development cycle. All work must be carried
out on feature branches in the form:

    feature/{username|shortcode}[.branchname]

Feature branches may only enter the master branch through a rebase, to keep the project history linear,
during which the commit history of the feature branch should be cleaned up (or squashed if appropriate).

In order for a feature branch to be accepted into the master, it must:

 * Easily rebase onto the latest master with no conflicts.
 * Cleanly compile -- NO ERRORS, NO WARNINGS, output should be "pretty".
 * PASS all unit tests (when we have a test system in place!).

In order to initiate the merging process, you must make a merge request. This is easily done on GitHUB
using the pull request feature. For those working with me on GitLab, simply make a merge request.

## Stable Master Branch

As a consequence the master branch should remain relatively stable. By stable, it is meant that the build
process is not broken, and that a kernel image can be generated without much effort.

Even though the master branch can be considered stable in this respect, if you really need a stable
kernel, then you should use the last marked stable tag, e.g:

stable-v1.0.0
