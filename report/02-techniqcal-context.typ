#pagebreak()

= Technical Context <section:technical-context>

== Hardware-in-the-loop principle

Hardware-in-the-loop (HIL) is a technique used in the development and testing of embedded systems. The device under test (DUT) is installed in a deterministic, controllable environment, where a simulator reproduces real-world conditions by emulating sensors, actuators and communication. The simulator runs multiple scenarios and measures the DUT's behaviour.

Unlike software-only simulation, HIL testing includes the real hardware and therefore allows engineers to validate the interaction between the embedded software and its physical interfaces.

== The smart collar

The collar is a battery-powered Bluetooth device worn around the monkey's neck. It records the animal's vocalisations in the field and can be released remotely at the end of the experiment, without having to sedate the animal again.

=== First version

The deployed version is equipped with a microphone that records the animal's vocalisations, which are stored on an SD card for later analysis. A remotely controlled release mechanism allows the user to trigger the collar's release at the end of the experiment; it is controlled through a smartphone application that communicates with the collar via Bluetooth. This version has a battery life of around 12 days.

=== Second version

The second version, currently under development, keeps the same purpose but extends the design with the hardware upgrades listed in @collar-v2.

#figure(
table(
  columns: (1.3fr, 2fr),
  align: (left, left),
  [*Upgrade*], [*Purpose*],
  [Wired USB data interface], [File retrieval and firmware updates],
  [TDK T5848 MEMS smart microphone], [Triggers recording only during sound events, reducing power consumption and storage needs],
  [Nordic nRF54L15 microcontroller], [More advanced Bluetooth microcontroller, pin-compatible with a neural processing unit for future species classification],
  [Dedicated power management circuit], [Battery health monitoring and data protection on power loss],
), caption: [Hardware upgrades of the second collar version]
)<collar-v2>

Together, these upgrades bring robustness against data loss and an extended battery life, which allows more data to be collected. Developers also plan to add a new mechanism, proximity detection between collars, which will allow scientists to study group interactions more deeply.

The testbench must therefore be able to integrate tests for the second version features.

== Mechanisms to test

@mechanisms lists the collar mechanisms that have to be validated:
#figure(
table(
  columns: (1fr, 2fr),
  align: (left, left),
  [*Mechanism*], [*What must be validated*],
  [Bluetooth connectivity], [Advertising, connection, GATT service compliance],
  [Microphone], [Record sounds only when above a defined threshold],
  [Data storage], [Recorded data is correctly written and can be retrieved],
  [Power loss], [Data must not be corrupted in case of battery failure],
  [Power consumption], [Consumption must not go above a defined threshold],
  [Remote release mechanism], [Can be triggered via bluetooth],
), caption: [Mechanisms to test and their validation criteria]
)<mechanisms>
