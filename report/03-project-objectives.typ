
#pagebreak()

= Project Objectives <section:project-objectives>

It will investigate the state of the art in automated testing of embedded systems.

The project will evaluate two testing frameworks: pytest and robot framework and select the most suitable.

Based on these analysis, a first version of the testbench will be implemented and validated on a development kit. At least two features of the collar have to be tested:
- Power consumption
- Bluetooth communication

The architecture should be modular and scalable; it should be easy to add new tests for new features and interfaces. It should be cost effective and reproducible to be parallelised in a test farm. 

== Deliverables


@deliverables lists the project's requested deliverables:

#figure(
table(
  columns: (3fr, 1fr),
  align: (left, center),
  [*Title*], [*Status*],
  [Test Strategy Document: interfaces mapping, pass/fail criteria], [✓],
  [pytest vs. Robot Framework evaluation report], [✗], 
  [Initial Test Bench on Dev Kit (hardware setup and documentation)], [✗], 
  [Automated BLE & power tests], [✗],
  [Project report], [⧗],
), caption: [Project Deliverables]
)<deliverables>