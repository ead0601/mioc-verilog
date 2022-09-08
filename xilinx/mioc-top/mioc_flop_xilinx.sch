<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500xl" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="in2_n" />
        <signal name="in2" />
        <signal name="in1" />
        <signal name="in1_b" />
        <signal name="in3" />
        <signal name="in4_b" />
        <signal name="in4" />
        <signal name="q" />
        <signal name="qbar" />
        <port polarity="Input" name="in2" />
        <port polarity="Input" name="in1" />
        <port polarity="Input" name="in3" />
        <port polarity="Input" name="in4" />
        <port polarity="Output" name="q" />
        <port polarity="Output" name="qbar" />
        <blockdef name="fdrs">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-352" y2="-352" x1="0" />
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="192" y1="-320" y2="-352" x1="192" />
            <line x2="64" y1="-352" y2="-352" x1="192" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="fdrs" name="XLXI_2">
            <blockpin signalname="in2_n" name="C" />
            <blockpin signalname="in3" name="D" />
            <blockpin signalname="in1_b" name="R" />
            <blockpin signalname="in4_b" name="S" />
            <blockpin signalname="q" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_3">
            <blockpin signalname="in2" name="I" />
            <blockpin signalname="in2_n" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_5">
            <blockpin signalname="in1" name="I" />
            <blockpin signalname="in1_b" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_6">
            <blockpin signalname="in4" name="I" />
            <blockpin signalname="in4_b" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_7">
            <blockpin signalname="q" name="I" />
            <blockpin signalname="qbar" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1536" y="1200" name="XLXI_2" orien="R0" />
        <instance x="1072" y="1120" name="XLXI_3" orien="R0" />
        <branch name="in2_n">
            <wire x2="1408" y1="1088" y2="1088" x1="1296" />
            <wire x2="1408" y1="1072" y2="1088" x1="1408" />
            <wire x2="1536" y1="1072" y2="1072" x1="1408" />
        </branch>
        <branch name="in2">
            <wire x2="1072" y1="1088" y2="1088" x1="736" />
        </branch>
        <iomarker fontsize="28" x="736" y="1088" name="in2" orien="R180" />
        <instance x="1072" y="1296" name="XLXI_5" orien="R0" />
        <branch name="in1">
            <wire x2="1056" y1="1264" y2="1264" x1="736" />
            <wire x2="1072" y1="1264" y2="1264" x1="1056" />
        </branch>
        <branch name="in1_b">
            <wire x2="1536" y1="1264" y2="1264" x1="1296" />
            <wire x2="1536" y1="1168" y2="1264" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="736" y="1264" name="in1" orien="R180" />
        <branch name="in3">
            <wire x2="1536" y1="944" y2="944" x1="736" />
        </branch>
        <iomarker fontsize="28" x="736" y="944" name="in3" orien="R180" />
        <instance x="1072" y="880" name="XLXI_6" orien="R0" />
        <branch name="in4_b">
            <wire x2="1536" y1="848" y2="848" x1="1296" />
        </branch>
        <branch name="in4">
            <wire x2="1056" y1="848" y2="848" x1="736" />
            <wire x2="1072" y1="848" y2="848" x1="1056" />
        </branch>
        <iomarker fontsize="28" x="736" y="848" name="in4" orien="R180" />
        <instance x="2096" y="1152" name="XLXI_7" orien="R0" />
        <branch name="q">
            <wire x2="2000" y1="944" y2="944" x1="1920" />
            <wire x2="2000" y1="944" y2="1120" x1="2000" />
            <wire x2="2096" y1="1120" y2="1120" x1="2000" />
            <wire x2="2640" y1="944" y2="944" x1="2000" />
        </branch>
        <branch name="qbar">
            <wire x2="2640" y1="1120" y2="1120" x1="2320" />
        </branch>
        <iomarker fontsize="28" x="2640" y="944" name="q" orien="R0" />
        <iomarker fontsize="28" x="2640" y="1120" name="qbar" orien="R0" />
    </sheet>
</drawing>