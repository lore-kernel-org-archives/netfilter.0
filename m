From: "Chen Ding" <ding@packetlink.com>
Subject: NAT Forwarding Problem
Date: Mon, 16 Sep 2002 13:22:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001201c25dae$0d31dee0$6501a8c0@JCC>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000F_01C25D84.219563E0"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_000F_01C25D84.219563E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

I have encountered a wiered (or maybe a stupid) problem with iptables =
NAT forwarding.=20

-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
--------
Settings:
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
--------
I have four machines in the setting:
    Machine A:             192.168.1.81                 RedHat 7.3
    Machine B:             192.168.1.17                 RedHat 7.3
    Machine C:             192.168.1.101               Microsoft XP
    Machine D:             An public IP address      RedHat 7.3

On Machine A, I have just one Rule:

    iptables -t nat -A PREROUTING -d 192.168.1.81 -j DNAT =
--to-destination 192.168.1.17

On Machine A, B, and D, ipchains were disabled, iptables were enabled. =
Running rpm -q iptables gave me:

                iptables-1.2.5-3

On Machine B/D, no rules were set, defauled to accept all.
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
---------


-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
---------
Problems:
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
---------
    pings:
    1. Machine C to ping 192.168.1.81:         OK (should actually ping =
192.168.1.17)
    2. Machine C to ping 192.168.1.17:         OK=20
    3. Machine A to pring 192.168.1.17:        OK

    telnet:=20
    1. Machine C to telnet 192.168.1.17:       OK
    2. Machine A to telnet 192.168.1.17:       OK
    3. Machine C to telnet 192.168.1.81:       No response

According to the rule, when Machine C telneting Machine A, Machine A =
should forward packets to Machine B, resulting in telneting Machine B. =
If use netstat, it did tell us that Machine A forwarded several packets.

However, if I change the rule on Machine A to forward all packets to =
Machine D, everything works just fine. Machine C can telnet Machine A, =
which ends up telneting Machine D.
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
---------



Having struggled for several days, I am desperate!!!!!!!!!  Your help is =
GREATLY appreciated!

My questions are:
    1. Is there anything wrong in my understanding of iptables?
    2. Anything wrong in the setting?


Thanks!

Chen Ding



------=_NextPart_000_000F_01C25D84.219563E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi All,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have encountered a wiered (or maybe a =
stupid)=20
problem with iptables NAT forwarding. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
-------------------------------------------------------------------------=
-----------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Settings:</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
-------------------------------------------------------------------------=
-----------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have four machines in the =
setting:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Machine A: =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
192.168.1.81&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; RedHat 7.3</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Machine=20
B:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;192.168.1.17&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; RedHat=20
7.3</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Machine=20
C:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;192.168.1.101&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
&nbsp;&nbsp;&nbsp; Microsoft XP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Machine=20
D:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;An=20
public IP address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RedHat =
7.3</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>On Machine A, I have just one =
Rule:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; iptables -t nat -A =
PREROUTING -d=20
192.168.1.81 -j DNAT --to-destination 192.168.1.17</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>On Machine A, B, and D, ipchains were =
disabled,=20
iptables were enabled. Running rpm -q iptables gave me:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; iptables-1.2.5-3</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>On Machine B/D, no rules were set, =
defauled to=20
accept all.</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
-------------------------------------------------------------------------=
------------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
-------------------------------------------------------------------------=
------------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Problems:</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
-------------------------------------------------------------------------=
------------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; pings:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;1. Machine C to =
ping=20
192.168.1.81:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OK =
(should=20
actually ping 192.168.1.17)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; 2.&nbsp;Machine =
C&nbsp;to ping=20
192.168.1.17:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OK=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; 3. Machine A to =
pring=20
192.168.1.17:&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; OK</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; telnet: =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; =
1.&nbsp;Machine&nbsp;C&nbsp;to=20
telnet =
192.168.1.17:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OK</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; 2. Machine&nbsp;A to =
telnet=20
192.168.1.17:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OK</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; 3.&nbsp;Machine =
C&nbsp;to telnet=20
192.168.1.81:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No =
response</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>According to the rule, when Machine C =
telneting=20
Machine A,&nbsp;Machine A&nbsp;should forward packets to Machine B, =
resulting in=20
telneting Machine B. If use netstat, it did tell us that Machine A =
forwarded=20
several packets.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>However, if </FONT><FONT face=3DArial =
size=3D2>I change=20
the rule on Machine A to forward all packets to Machine D, everything =
works just=20
fine.&nbsp;Machine C&nbsp;can telnet Machine A, which ends up telneting =
Machine=20
D.</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
-------------------------------------------------------------------------=
------------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Having struggled for several days, I am =

desperate!!!!!!!!!&nbsp; Your help is GREATLY appreciated!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My questions are:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; 1. Is there anything =
wrong in my=20
understanding of iptables?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; 2. Anything wrong in =
the=20
setting?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chen Ding</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_000F_01C25D84.219563E0--


