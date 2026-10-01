#pagebreak()

= Technical Context <section:technical-context>

== Hardware in the loop principle

Hardware-in-the-loop (HIL) is a technique used in the development and testing of embedded systems.

The device under test (DUT) is installed in a deterministic, controllable environment. A simulator reproduces real-world conditions by emulating sensors, actuators, and communication. It runs multiple scenarios and measures the DUT’s behavior.

Unlike software-only simulation, HIL testing includes the real hardware and allows engineers to validate the interaction between the embedded software and its physical interfaces.

== Collar Description

The battery powered Bluetooth collar is installed on the neck of the monkey. A microphone records the animal sounds and stores them on an SD card. A remote controlled release mechanism allows user to trigger the collar drop at the end of the experiment. 

The remote control is done on a smartphone application that connects to the collar via bluetooth

*features:*

- Bluetooth connectivity
- Microphone
- SD card storage
- Remote release mechanism
- Battery powered

The first version had a battery life around 12 days.

The v2, currently under development extends the design with these hardware upgrades: 

- A wired usb data interface for file retrieval and firmware updates
- A TDK T5848 MEMS smart microphone that triggers recording only during sound events, reducing power consumption and storage needs
- Upgraded version of bluetooth microcontroller, a Nordic nRF54L15
- A dedicated power management circuit for battery health monitoring and data protection on power loss
- A pin-compatible microcontroller upgrade path to a neural processing unit for future species classification

It allows these additional features:

- robustness over data loss
- extended battery life, which allow to collect more data
- proximity detection between monkeys to study interractions more deeply

== Motivation

=== During development

When introducing new features or modifying existing functionality, it is important to ensure that they work as expected and do not introduce bugs into the system. The validation process must ensure that all existing features continue to function properly.

For example, we must ensure that firmware modifications do not increase power consumption, which is critical for the collar.

Performing this manually every time is time-consuming and error-prone. That is why we need a deterministic CI pipeline that runs these tests automatically.

An automated testbench can also collect a wide range of useful metrics and generate a performance report. The HES-SO developing team is especially interested in an automated power-profiling test that records the system's power consumption in different scenarios, such as Bluetooth advertising and sound recording. This will allow them to optimize both the firmware and the hardware.


=== During production

In production, the design is assumed to be good. But we still have to ensure that the produced unit is functioning properly.

Production testing allows to quickly detect:

- faulty components
- miscalibrated sensors
- short circuits and bad solder joints

Sending defect devices to the market can ruin a company reputation. In our case, installing a collar on a monkey is a complex operation, as you have to sedate the animal to reach it. And in the worst case, if the detach mechanism cannot be triggered or doesn't engage properly, you have to resedate the animal to remove it. This is why we want to detect the defects before deployment.

Automating these tests reduces the time and avoids human error.
