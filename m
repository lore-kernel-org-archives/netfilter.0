From: "Pavan Gokarn" <pavang@techknowledge.ws>
Subject: Subscribe/Query
Date: Thu, 27 Feb 2003 10:27:30 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c2de1c$bbc510a0$e11310ac@techknowledge.ws>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001B_01C2DE4A.D56F9100"
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

------=_NextPart_000_001B_01C2DE4A.D56F9100
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Sir,
    I am a system administrator new to IPTables, well pretty new. I have =
an issue with DNAT. my DNAT does not work internally. let me give you =
the configuration. I have a Firewall with 2 plumbed interface on the =
same card. eth0=3D172.16.19.231 and eth0:a=3D10.1.1.25. i have enables =
ip_forward. now when i try to access a 10.0.0.0/8 ip address from =
172.16.19.0/24 (http) using DNAT on the firewall NATBox it does not =
work. can you please give me a solution. the commands i issued are.
# iptables -t nat -A PREROUTING -d 172.16.19.152 -p tcp --dport 8080 -j =
DNAT --to 10.1.1.33:8080

can some one please help me with this. also i am writing a gui solution =
using 'C' as a frontend to iptables. can someone give me the full =
description of NETFILTER/IPTables extentions and options (manpages is =
not enough)

Thanx a ton
Regards
Pavan

------=_NextPart_000_001B_01C2DE4A.D56F9100
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2314.1000" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Dear Sir,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I am a system =
administrator new=20
to IPTables, well pretty new. I have an issue with DNAT. my DNAT does =
not work=20
internally. let me give you the configuration. I have a Firewall with 2 =
plumbed=20
interface on the same card. eth0=3D172.16.19.231 and eth0:a=3D10.1.1.25. =
i have=20
enables ip_forward. now when i try to access a 10.0.0.0/8 ip address =
from=20
172.16.19.0/24 (http) using DNAT on the firewall NATBox it does not =
work. can=20
you please give me a solution. the commands i issued are.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2># iptables -t nat -A PREROUTING -d =
172.16.19.152 -p=20
tcp --dport 8080 -j DNAT --to 10.1.1.33:8080</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>can some one please help me with this. =
also i am=20
writing a gui solution using 'C' as a frontend to iptables. can someone =
give me=20
the full description of NETFILTER/IPTables extentions and options =
(manpages is=20
not enough)</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanx a ton</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Regards</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Pavan</FONT></DIV></BODY></HTML>

------=_NextPart_000_001B_01C2DE4A.D56F9100--


