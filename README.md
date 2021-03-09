# CodingTest

Skill set necessary for a role in Chip Design Engineering are:

1. **Self learning** Each day you will be working on something new, You should have the ability to conduct a literature survey (aka google search) and fill the gaps in your understanding. This includes,regularly learning new languages and frameworks, Reading and understanding Standards's, Existing code, Papers etc.
2. **Coding**
1. Writing, testing and debugging 
   * Firmware
   * RTL Code
   * Testcases
2. **Effectively using Version Coontrol system**

In most cases the academic coursework teaches less than 10% of these skills, Self learning is an important aspect in a Research and Design oriented Job Role as everyday you work on "something out of syllabus"

If you can complete the steps listed below, We will be interested in discussing a career at Dyumnin Semiconductors with you.

# Dyumnin Semiconductors, Take home Design and verification coding test for new college graduates.

Take home coding test.

* This test mimic's the workflow for an NCG at Dyumnin Semiconductors.
* There is a high probability that your first assignment at work will be on similar lines to the steps listed below.
* There are some aspects of tools and techniques which may not be a part of your regular engineering course work, tutorials for most are available online. While some may require research on your part.

**Assumption** 
1. The candidate know's verilog/VHDL, Algorithms, Verification(UVM,VUnit,CocoTB etc.), Digital logic and has worked with FPGA's

**Problem Statement**

![SystemDiagram](codingtest.png)

1. A system is being built which, on one end communicates with a server via UART, and on the other is connected to an I2C based peripheral.
2. The Server API defines two functions `write(unsigned address,unsigned data);` and `unsigned read(unsigned address);` which will be used to access different address spaces in the I2C peripheral.
3. Use any FPGA that you are comfortable with to build and test this system.

**Note:** 
1. Buiding the IP's from scratch will take a very long time, Explore the IP library of your FPGA Vendor and instantiate the required IP's in your design.
2. Ensure that your code has zero simulation/synthesis warnings/errors before generating the pull request.

# Instructions:

## Step 1:

1. Fork/Clone this repository.
2. Create a branch with "candidate/{your name} as the branch name.
3. Write the RTL code for the FPGA and implement the server API to communicate with the FPGA

Checkin the files and tag it as Step 1

## Step 2:

Create a testplan and testcase list for this design.
Checkin the testplan and tag it as Step2
**Ref:** https://verificationacademy.com/cookbook/coverage 

## Step 3:

Implement the verification env and verify atleast 2 test
You can implement the verification code in either Verilog/VHDL/SystemVerilog or Python (We use cocotb internally for all our verification).

**Ref:** https://cocotb.readthedocs.io/

## Step 4.

Create a pull request on the original repo with your code submission.

Once the pull request is created we will schedule the next round of interview.

## Use the Issue tracker.

If you need any clarity on the steps above, raise a ticket on the issue tracker.
