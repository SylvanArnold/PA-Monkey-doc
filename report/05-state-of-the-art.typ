#pagebreak()

= State of the art <section:state-of-the-art>

== State of the art in CI/CD

=== Smartphone Farms

Most of the HIL industry uses smartphone farms to test the behavior of applications on a wide range of devices. There are several companies that have built large-scale smartphone testing infrastructures.

=== Constraints

Hardware in the loop in a CI pipeline adds a layer of complexity to the testing process. Unlike traditional software testing, it must deal with:

    - physical device availability
    - long flashing and boot times
    - hardware failures
    - non deterministic behavior
    - limited parallelization

  
That's why modern development teams use an hybrid approach whith multiple testing layers.

*Layer 1*: static analysis

use linters (e.g., cargo clippy, cppcheck) and code formatting tools (e.g., rustfmt, clang-format) to catch common mistakes and enforce coding standards.

*Layer 2*: unit tests

*Layer 3*: integration tests

Developers can use emulators (e.g., QEMU) to run integration tests in a controlled environment, simulating the hardware behavior without needing physical devices. It allows to check the application core logic and interactions between components without the overhead of flashing and booting the hardware.

*Layer 4*: hardware in the loop tests

Finally, hardware in the loop tests are performed on actual devices to validate the system's behavior in real-world conditions. These tests are typically run less frequently due to their complexity and resource requirements.

=== Parallelization



== State of the art in production line testing
