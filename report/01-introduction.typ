= Introduction <section:introduction>

Ethology is a branch of zoology that studies animals behavior. To understand how animals behave in the wild, researchers collect data in their natural environment. Howerver, a key challenge they face is observing animals without disturbing them, as human presence can alter theire natural behaviour. Traditionally, researchers have addressed this issue using camera traps and wearable tracking devices such as GPS collars. However, these methods are limited in the amount and type of information they can capture.

Wearable sensing technologies have evolved significantely in recent years. Humans now use smartwatches, sleep trackers, and other wearable devices to monitor theire physical activity and physiological parameters. These advances raise the possibility of adapting the technology for animal research, providing scientists better behavioral and physiological data while minimising human disturbance.

In this context, the Industrial Systems Institute of the
Haute École d'Ingénierie of Sion has developed a smart collar for studying primates. A first version has already been deployed and tested on a real group of Vervet monkey in southern Africa and a second, improved version is currently under development. 

Testing this device during development is demanding. Every firmware modification requires re-testing all features to ensure that no bug or regression have been introduced. For example, we must ensure that firmware modifications do not increase power consumption, which is critical for the collar. Since this is an embedded system, the firmware is tighly coupled to the hardware which limit software-only testing solutions. Hardware emulation solutions, such as QEMU, provide a useful starting point, but is not accurate for testing aspects such as timing, power consumption, and wireless communication. These tests need to be done on the real device.

In addition, each collar must be tested and validated before being deployed in the field. Installing the device on a monkey is a complex operation, as it requires sedating the animal to access it. It is therefore essential to identify any defects before the installation.

Performing all these tests manually is time consuming and error-prone. Each feature and scenario must be repeatedly validated which becomes impossible as the number of devices and test cases grow. An automated testbench is needed to make testing more reliable, repeatable and scalable. It can also collect performance data and generate reports, helping engineers identify areas for optimisation, such as power consumption.

This project aims to establish the foundations of an automated test bench for the smart collar. The test bench should serve two main purposes: first, it should allow developers to run automated tests directly on the hardware as part of their CI pipeline; second, it should enable go/no-go testing before devices are deployed in the field.
