#pagebreak()

= State of the art <section:state-of-the-art>

== Examples in the industry

*Smarphones farms* : Some companies maintain large farms of smartphones to run automated tests on different devices and OS versions. This allows them to ensure application compatibility and performance across a wide range of hardware. The most advanced farms even use robotic arms to physically interact with the devices, simulating user input and testing various scenarios.

*Automotive industry* : In the automotive sector, hardware in the loop testing is crucial for validating the performance and safety of embedded systems in vehicles. Companies use HIL setups to test electronic control units (ECUs), onboard computers, and other components under various conditions, such as different temperatures, voltages, and sensor inputs.

*Aerospace* : 

*IoT devices*: 



== Hardware in the loop in CI/CD pipelines


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

how parallelization is performed, technologies used, examples in the IOT industry

== Automated tests on production lines
