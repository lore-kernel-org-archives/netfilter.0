From: "kaiwen" <cal_kaiwen@hotmail.com>
Subject: Precedence of packet traverse through iptables chain, local routing table and newly created routing table
Date: Wed, 14 Jan 2004 16:08:48 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law11-OE54wbW2Y2dtd00009c21@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0134_01C3DAB8.B1A0AA00"
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

------=_NextPart_000_0134_01C3DAB8.B1A0AA00
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=20

I been trying on ip rule fwmark and iptables MARK.=20

I will show my testing in detail, but my ultimate question is why ONLY =
marking in Mangle OUTPUT tables works, but not others?

Network Diagram

------------ 192.168.250.197 eth0 LINUX ROUTER eth1 192.168.8.88 =
------------------ 192.168.8.112 eth0 Windows XP Client

Steps (performed on LINUX ROUTER)
(1) Delete route to 192.168.8.0 from local routing table on
(2) Add route to 192.168.8.0 at table test2
(3) Mark packet with --set-mark 3 at MANGLE OUTPUT table
(4) Forward all packet marked 3 to table test2 using ip rule fwmark
(5) Do a ip ro flush cache
(6) Ping from 192.168.8.112 to 192.168.8.88 is successful


[root@son-ag webauth]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use =
Iface
192.168.250.0   0.0.0.0         255.255.255.0   U     0      0        0 =
eth0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 =
lo
0.0.0.0         192.168.250.254 0.0.0.0         UG    0      0        0 =
eth0


[root@son-ag webauth]# ip route show table test2
192.168.8.0/24 via 192.168.8.88 dev br0


[root@son-ag webauth]# iptables -t mangle -L
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
MARK       all  --  anywhere             anywhere           MARK set 0x3


[root@son-ag webauth]# ip ru
0:      from all lookup local
32764:  from all fwmark        3 lookup test2
32766:  from all lookup main
32767:  from all lookup 253


I wish to know why is that ONLY marking at OUTPUT table works?
The network setup is for testing purpose, I wish to know the precedence =
of iptables chains, local routing table and newly created table (e.g. =
test2)

Looking at the iptables chain diagram, my guess is MARKING at mangle =
INPUT or mangle PREROUTING should work as well.=20
When packet comes off from wire, I mark it with 3 at mangle PREROUTING. =
Since it is a ping to 192.168.8.88, it should be a local process.
Then the ping is successful. But from my testing, no.=20

Another possiblity is packet is route to test2 routing table after =
mangle OUTPUT and before mandle POSTROUTING. I am getting confuse :)

Please advice. Thank you

Kaiwen

------=_NextPart_000_0134_01C3DAB8.B1A0AA00
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2734.1600" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi, </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I been trying on ip rule fwmark and =
iptables MARK.=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I will show my testing in detail, but =
my ultimate=20
question is why ONLY marking in Mangle OUTPUT tables works, but not=20
others?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Network Diagram</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>------------ 192.168.250.197 eth0 LINUX =
ROUTER eth1=20
192.168.8.88 ------------------ 192.168.8.112 eth0 Windows XP=20
Client</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Steps (performed on LINUX =
ROUTER)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>(1) Delete route to 192.168.8.0 from =
local routing=20
table on</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>(2) Add route to 192.168.8.0 at table=20
test2</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>(3) Mark packet with --set-mark 3 at =
MANGLE OUTPUT=20
table</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>(4) Forward all packet marked 3 to =
table test2=20
using ip rule fwmark</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>(5) Do a ip ro flush cache</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>(6) Ping from 192.168.8.112 to =
192.168.8.88 is=20
successful</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@son-ag webauth]# route =
-n<BR>Kernel IP=20
routing table<BR>Destination&nbsp;&nbsp;&nbsp;&nbsp;=20
Gateway&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Genmask&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Flags Metric=20
Ref&nbsp;&nbsp;&nbsp; Use Iface<BR>192.168.250.0&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.255.255.0&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth0<BR>127.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
lo<BR>0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
192.168.250.254=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
UG&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth0<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@son-ag webauth]# ip route show =
table=20
test2<BR>192.168.8.0/24 via 192.168.8.88 dev br0<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@son-ag webauth]# iptables -t =
mangle=20
-L<BR></FONT><FONT face=3DArial size=3D2>Chain OUTPUT (policy=20
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination<BR>MARK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
MARK set=20
0x3<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@son-ag webauth]# ip=20
ru<BR>0:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from all lookup =
local<BR>32764:&nbsp;=20
from all fwmark&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 lookup=20
test2<BR>32766:&nbsp; from all lookup main<BR>32767:&nbsp; from all =
lookup=20
253<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I wish to know why is that ONLY marking =
at OUTPUT=20
table works?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The network setup is for testing =
purpose, I wish to=20
know the precedence&nbsp;of iptables chains, local routing table and =
newly=20
created table (e.g. test2)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Looking at the iptables chain diagram, =
my guess is=20
MARKING at mangle INPUT or mangle PREROUTING should work as well. =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>When packet comes off from wire, I mark =
it with 3=20
at mangle PREROUTING. Since it is a ping to 192.168.8.88, it should be a =
local=20
process.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Then the ping is successful. But from =
my testing,=20
no. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Another possiblity is packet is route =
to test2=20
routing table after mangle OUTPUT and before mandle POSTROUTING. I am =
getting=20
confuse :)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Please advice. Thank you</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT =
size=3D2>Kaiwen</FONT></DIV></FONT></BODY></HTML>

------=_NextPart_000_0134_01C3DAB8.B1A0AA00--

