# CodingTest

# Dyumnin Semiconductors, Take home ASIC/FPGA Design and verification coding test for new college graduates.

Take home coding test.

* This test mimic's the workflow for an NCG at Dyumnin Semiconductors.
* There is a high probability that your first assignment at work will be on similar lines to the 5 steps listed below.
* The steps below should normally take 1-2 man day's effort. 
* There are some aspects of tools and techniques which may not be a part of your regular engineering course work, tutorials for most are available online. While some may require research on your part.

**Assumption** 
1. The candidate know's verilog/VHDL, Algorithms, Verification(UVM,VUnit,CocoTB etc.), Digital logic and has worked with FPGA's

**Problem Statement**

![SystemDiagram](codingtest.png)

1. We have are building a system which on one end communicates with a server via UART, and on the other is connected to an I2C based peripheral.
2. The Server API defines two functions `write(unsigned address,unsigned data);` and `read(unsigned address);` which will be used to access different address spaces in the I2C peripheral.
3. Use any FPGA that you are comfortable with to build and test this system.


Instructions:
## Step 1:
1. Fork/Clone this repository.
2. Create a branch with "candidate/{your name} as the branch name.
3. Write the RTL code for the FPGA and implement the server API to communicate with the FPGA

Checkin the files and tag it as Step1

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


In case of any issues, raise an issue in the github issue tracking system for this repo..
