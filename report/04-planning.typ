#pagebreak()
//#import "@preview/merman:0.3.0": mermaid
#import "@preview/mmdr:0.2.2": mermaid
= Planning <section:planning>

== Methodology

The tasks have beed divided into workpackages:

=== WP1: Interfaces mapping and requirements analysis

- read collar documentation
- list the interfaces and features to test
- understand the requirements

=== WP2: State of the art and testing framework evaluation

- state of the art in automated testing for embedded systems with hardware in the loop
- state of the art in embedded systems power profiling
- state of the art in BLE testing
- evaluate the most suitable testing framework for the smart collar, especially pytest and Robot Framework

=== WP3: Experimentation

- learn how to use the testing framework
- learn and explore the Nordic nRF Connect SDK and Zephyr RTOS
- implement a first version of the testbench on a development kit, with a simple test firmware that enable GPIO toggling over BLE

=== WP4: Monkey collar testbench implementation

  - Implement the testbench on the monkey collar firmware for bluetooth and power consumption
  - Define the final architecture of the testbench, with a modular and scalable design
  - If time allows, integrate the testbench in a CI pipeline

=== WP5: Documentation, delivrables

Write the project report and submit the requested deliverables.