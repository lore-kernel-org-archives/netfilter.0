From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: Help on this iptable script
Date: Sun, 15 Jun 2003 22:52:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c333b2$47c194d0$8c01a8c0@RSUNDARAM>
References: <88116A11E9DFD411870900508BEC3831803B4B@CPQ01>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000C_01C33390.C09DA550"
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_000C_01C33390.C09DA550
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

RE: Using IPTABLES, cannot go to External InterfaceHi All,

Sorry for asking this question again.  I have machine with single =
interface card, We want to black all incoming, outgoing package other =
than 21,22,23,53,80,2020,3306,8080 ports.

When default OUTPUT policy is ACCEPT every thing working fine.

$IPT -P OUTPUT ACCEPT


If I make default OUTPUT policy is DROP, I was not able login using ssh, =
also iptables -L command takes about 3 minutes to display the result.

$IPT -P OUTPUT DROP

What I am dong wrong? Any tips to improve this script


Thanks
-SR

#!/bin/bash

#set -xv

INT=3D"eth0"

LO=3D"lo"

ANY=3D"Any/0"

PRIVP=3D"0:1023"

UNPRI=3D"1024:65535"

IN_PORTS=3D"21,22,23,53,80,2020,3306,8080"

OUT_PORTS=3D"21,22,23,53,80,2020,3306,8080"

IPT=3D"/sbin/iptables"

# Set the Default Policies

$IPT -P INPUT DROP

$IPT -P OUTPUT ACCEPT

$IPT -P FORWARD DROP

$IPT -F

$IPT -X icmp_packets

$IPT -X tcp_packets

$IPT -X udp_packets


#Local Loopback Address

$IPT -A INPUT -i $LO -j ACCEPT

$IPT -A OUTPUT -o $LO -j ACCEPT

$IPT -N icmp_packets

$IPT -N tcp_packets

$IPT -N udp_packets

# Filter untrusted traffic

$IPT -A INPUT -i eth0 -p icmp -j icmp_packets

$IPT -A INPUT -i eth0 -p tcp -j tcp_packets

$IPT -A INPUT -i eth0 -p udp -j udp_packets

# Trust traffic we initiated from untrusted networks.

$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Log dropped traffic.

$IPT -A INPUT -m limit --limit 3/min --limit-burst 3 -j LOG --log-prefix =
"IPT INPUT packet died: " --log-level 6

# Allow outbound traffic.=20

$IPT -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

$IPT -A OUTPUT -p tcp -m multiport --source-ports ${OUT_PORTS} -j ACCEPT

$IPT -A OUTPUT -p udp -m multiport --source-ports ${OUT_PORTS} -j ACCEPT

# Log dropped traffic.

$IPT -A OUTPUT -m limit --limit 3/min --limit-burst 3 -j LOG =
--log-prefix "IPT OUTPUT packet died: " --log-level 6



# Allow incoming ports=20

$IPT -A tcp_packets -p tcp -m multiport --destination-ports ${IN_PORTS} =
-j ACCEPT

## Manage the following ICMP traffic .

$IPT -A icmp_packets -p icmp -m icmp --icmp-type 0 -j ACCEPT

$IPT -A icmp_packets -p icmp -m icmp --icmp-type 3 -j ACCEPT

$IPT -A icmp_packets -p icmp -m icmp --icmp-type 5 -j ACCEPT

$IPT -A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT

$IPT -A icmp_packets -i eth1 -p icmp -m icmp --icmp-type 8 -j ACCEPT

$IPT -A icmp_packets -i lo -p icmp -m icmp --icmp-type 8 -j ACCEPT

# Allow potentially untracked valid DNS traffic.

$IPT -A udp_packets -p udp -m udp --sport 53 -j ACCEPT



------=_NextPart_000_000C_01C33390.C09DA550
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=EF=BB=BF<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>RE: Using IPTABLES, cannot go to External =
Interface</TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3DUTF-8">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi All,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Sorry for asking this question =
again.&nbsp; I have=20
machine with single interface card, We want to black all incoming, =
outgoing=20
package other than <FONT face=3D"Times New =
Roman">21,22,23,53,80,2020,3306,8080=20
ports.</FONT></FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>When default&nbsp;OUTPUT policy is =
ACCEPT every=20
thing working fine.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>$IPT -P OUTPUT ACCEPT</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>If I make default OUTPUT policy is =
DROP, I was not=20
able login using ssh, also iptables -L command takes about 3 minutes to =
display=20
the result.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>$IPT -P OUTPUT DROP</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>What I am dong wrong? Any tips to =
improve this=20
script</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-SR</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>
<P>#!/bin/bash</P>
<P>#set -xv</P>
<P>INT=3D"eth0"</P>
<P>LO=3D"lo"</P>
<P>ANY=3D"Any/0"</P>
<P>PRIVP=3D"0:1023"</P>
<P>UNPRI=3D"1024:65535"</P>
<P>IN_PORTS=3D"21,22,23,53,80,2020,3306,8080"</P>
<P>OUT_PORTS=3D"21,22,23,53,80,2020,3306,8080"</P>
<P>IPT=3D"/sbin/iptables"</P>
<P># Set the Default Policies</P>
<P>$IPT -P INPUT DROP</P>
<P>$IPT -P OUTPUT ACCEPT</P>
<P>$IPT -P FORWARD DROP</P>
<P>$IPT -F</P>
<P>$IPT -X icmp_packets</P>
<P>$IPT -X tcp_packets</P>
<P>$IPT -X udp_packets</P>
<P></P>
<P>#Local Loopback Address</P>
<P>$IPT -A INPUT -i $LO -j ACCEPT</P>
<P>$IPT -A OUTPUT -o $LO -j ACCEPT</P>
<P>$IPT -N icmp_packets</P>
<P>$IPT -N tcp_packets</P>
<P>$IPT -N udp_packets</P>
<P># Filter untrusted traffic</P>
<P>$IPT -A INPUT -i eth0 -p icmp -j icmp_packets</P>
<P>$IPT -A INPUT -i eth0 -p tcp -j tcp_packets</P>
<P>$IPT -A INPUT -i eth0 -p udp -j udp_packets</P>
<P># Trust traffic we initiated from untrusted networks.</P>
<P>$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT</P>
<P># Log dropped traffic.</P>
<P>$IPT -A INPUT -m limit --limit 3/min --limit-burst 3 -j LOG =
--log-prefix "IPT=20
INPUT packet died: " --log-level 6</P>
<P># Allow outbound traffic. </P>
<P>$IPT -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT</P>
<P>$IPT -A OUTPUT -p tcp -m multiport --source-ports ${OUT_PORTS} -j =
ACCEPT</P>
<P>$IPT -A OUTPUT -p udp -m multiport --source-ports ${OUT_PORTS} -j =
ACCEPT</P>
<P># Log dropped traffic.</P>
<P>$IPT -A OUTPUT -m limit --limit 3/min --limit-burst 3 -j LOG =
--log-prefix=20
"IPT OUTPUT packet died: " --log-level 6</P>
<P><FONT face=3DArial></FONT>&nbsp;</P>
<P># Allow incoming ports </P>
<P>$IPT -A tcp_packets -p tcp -m multiport --destination-ports =
${IN_PORTS} -j=20
ACCEPT</P>
<P>## Manage the following ICMP traffic .</P>
<P>$IPT -A icmp_packets -p icmp -m icmp --icmp-type 0 -j ACCEPT</P>
<P>$IPT -A icmp_packets -p icmp -m icmp --icmp-type 3 -j ACCEPT</P>
<P>$IPT -A icmp_packets -p icmp -m icmp --icmp-type 5 -j ACCEPT</P>
<P>$IPT -A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT</P>
<P>$IPT -A icmp_packets -i eth1 -p icmp -m icmp --icmp-type 8 -j =
ACCEPT</P>
<P>$IPT -A icmp_packets -i lo -p icmp -m icmp --icmp-type 8 -j =
ACCEPT</P>
<P># Allow potentially untracked valid DNS traffic.</P>
<P>$IPT -A udp_packets -p udp -m udp --sport 53 -j ACCEPT</P>
<P><FONT face=3DArial></FONT>&nbsp;</P></FONT></DIV></BODY></HTML>

------=_NextPart_000_000C_01C33390.C09DA550--


