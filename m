From: "Juliano Dapper" <juliano@dualcon.com.br>
Subject: z-newnat16 again......
Date: Wed, 23 Oct 2002 16:36:38 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c27ac3$21285d20$3200a8c0@dualcon.com.br>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0007_01C27AB2.5C0E3EC0"
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

------=_NextPart_000_0007_01C27AB2.5C0E3EC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[root@teste /]# lsmod
Module                  Size  Used by    Not tainted
ipt_MASQUERADE          1184   0  (autoclean)
iptable_filter          1728     0  (unused)
iptable_nat            14420   0  [ipt_MASQUERADE]
ip_conntrack         22188   1  [ipt_MASQUERADE iptable_nat]
ip_tables              10528   5  [ipt_MASQUERADE iptable_filter =
iptable_nat]

[root@teste /]# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables: Invalid argument

Linux teste.dualcon.com.br 2.4.19 #1 Qua Out 23 11:54:48 BRST 2002 i586 =
unknown





Linux Registered user # 237204
------=_NextPart_000_0007_01C27AB2.5C0E3EC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>[root@teste /]#=20
lsmod<BR>Module&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Size&nbsp; Used by&nbsp;&nbsp;&nbsp; Not=20
tainted<BR>ipt_MASQUERADE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;=20
1184&nbsp;&nbsp; 0&nbsp;=20
(autoclean)<BR>iptable_filter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;=20
1728&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;=20
(unused)<BR>iptable_nat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
14420&nbsp;&nbsp; 0&nbsp;=20
[ipt_MASQUERADE]<BR>ip_conntrack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
22188&nbsp;&nbsp; 1&nbsp; [ipt_MASQUERADE=20
iptable_nat]<BR>ip_tables&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
10528&nbsp;&nbsp; 5&nbsp; [ipt_MASQUERADE iptable_filter=20
iptable_nat]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@teste /]# iptables -t nat -A =
POSTROUTING -o=20
eth0 -j MASQUERADE<BR>iptables: Invalid argument</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Linux teste.dualcon.com.br 2.4.19 #1 =
Qua Out 23=20
11:54:48 BRST 2002 i586 unknown</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV>
<DIV><BR></DIV></FONT>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT>
<DIV><FONT face=3DArial size=3D2>Linux Registered user #=20
237204</FONT></DIV></BODY></HTML>

------=_NextPart_000_0007_01C27AB2.5C0E3EC0--


