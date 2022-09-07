**README.md**

1)  **Install GIT repo (in a specific location)**

> mkdir /build/repo
>
> cd /build/repo
>
> git clone https://github.com/ead0601/mioc-verilog

2)  **Download ISE 14.7 **

The Xilinx tool needed for this project is:

<https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive-ise.html>

Select 14.7 and **Full Installer for Linux (TAR/GZIP - 6.09 GB), for
download**

3)  **Un-compress and execute:**

> mkdir /build/tools/Xilinx
>
> (un-tar into a temp location, NOT the directory above)
> tar -xvf Xilinx\_ISE\_DS\_Lin\_14.7\_1015\_1.tar  
>
> cd Xilinx\_ISE\_DS\_Lin\_14.7\_1015\_1
>
>./xsetup (run)

When prompted selected the install Xilinx ISE path into:

**/build/tools/Xilinx**

4)  **Create a Xilinx account and download a free license:**

    [**https://www.xilinx.com/support/licensing\_solution\_center.html**](https://www.xilinx.com/support/licensing_solution_center.html)

    Select "Obtain a license for Legacy IP Core Products", Xilinx
    Product Licensing Site

    Select ISE Embedded Edition License, Certificate -- No Charge, and a
    license file will be e-mailed to you.

5)  **Source env scripts:**

    source /build/tools/Xilinx/14.7/ISE\_DS/settings64.sh (bash)

    ise & (to execute ISE)

6)  **Setup license:**

    The first time you execute "ise", a license select tool will be
    launched. At this point select the file of the keyfile you received
    from step 4:

7)  **Starting ISE:**

    cd /build/repo/mioc-verilog/Xilinx

    source /build/tools/Xilinx/14.7/ISE\_DS/settings64.sh (if you have
    not done it already)

    ise &

    Open project mioc-top.xise

    (please note that this not the selected method of running)

    This method depends on the GUI, where control of synthesis
    constraints is not as desired. We need to be able to lock down
    the 80's style design with KEEP on nets and KEEP_HIERARCHY on
    instances, since the MIOC design does not follow conventional
    design methodology. The following step is how we will be building
    MIOC

8)  **Starting MIOC build from the command line:**

    cd /build/repo/mioc-verilog/Xilinx

    source /build/tools/Xilinx/14.7/ISE\_DS/settings64.sh (if you have
    not done it already)

    ./runme
