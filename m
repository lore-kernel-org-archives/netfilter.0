From: "kaiwen" <cal_kaiwen@hotmail.com>
Subject: Match packet mark with --set-mark to ip rule fwmark
Date: Wed, 7 Jan 2004 12:10:05 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law11-OE68Dt3HvoFOA00000021@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_01E6_01C3D517.2FBEBFA0"
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

------=_NextPart_000_01E6_01C3D517.2FBEBFA0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi,

Here I am trying something simple.
My objective is to make ip rule fwmark command work :)

Network Diagram:
--- 192.168.250.197 (eth0) Linux Box (eth1) 192.168.8.88 =
-------------192.168.8.122 (eth0) Windows XP Client

Configuration done on Linux Box:-

(1) [root@g webauth]# iptables -t mangle -A PREROUTING -j MARK =
--set-mark 5
[root@g webauth]# iptables -t mangle -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
MARK       all  --  anywhere             anywhere           MARK set 0x5

(2) [root@g webauth]# ip rule add fwmark 5 table test2
[root@g webauth]# ip rule
0:      from all lookup local
32765:  from all fwmark        5 lookup test2
32766:  from all lookup main
32767:  from all lookup 253

(3) [root@g webauth]# ip ro show table test2
prohibit 192.168.8.122

I expect ping from 192.168.8.122 to 192.168.250.197 to be drop, BUT is =
is
successful. Why?
Did I miss out anything? Please advice.

Thank you
Kaiwen


------=_NextPart_000_01E6_01C3D517.2FBEBFA0
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
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>Hi,<BR><BR>Here=20
I am trying something simple.<BR>My objective is to make ip rule fwmark =
command=20
work :)<BR><BR>Network Diagram:<BR>--- 192.168.250.197 (eth0) Linux Box =
(eth1)=20
192.168.8.88 -------------192.168.8.122 (eth0) Windows XP=20
Client<BR><BR>Configuration done on Linux Box:-<BR><BR>(1) [root@g =
webauth]#=20
iptables -t mangle -A PREROUTING -j MARK --set-mark 5<BR>[root@g =
webauth]#=20
iptables -t mangle -L<BR>Chain PREROUTING (policy=20
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination<BR>MARK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
MARK set=20
0x5<BR><BR>(2) [root@g webauth]# ip rule add fwmark 5 table=20
test2</FONT></FONT><FONT face=3DArial size=3D2><FONT face=3D"Times New =
Roman"=20
size=3D3><BR>[root@g webauth]# ip =
rule<BR>0:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from=20
all lookup local<BR>32765:&nbsp; from all=20
fwmark&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5 lookup =
test2<BR>32766:&nbsp;=20
from all lookup main<BR>32767:&nbsp; from all lookup 253<BR><BR>(3) =
[root@g=20
webauth]# ip ro show table test2<BR>prohibit 192.168.8.122<BR><BR>I =
expect ping=20
from 192.168.8.122 to 192.168.250.197 to be drop, BUT is =
is<BR>successful.=20
Why?<BR>Did I miss out anything? Please advice.<BR><BR>Thank=20
you<BR>Kaiwen</FONT><BR></DIV></FONT></FONT></DIV></BODY></HTML>

------=_NextPart_000_01E6_01C3D517.2FBEBFA0--

