From: "Fernando La Gamba" <fernando.lagamba@fastrack.com.br>
Subject: redirect connec to ex int to int
Date: Tue, 22 Jul 2003 15:08:10 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00bf01c3507c$35db5800$6200000a@detec10>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00BB_01C35063.1072A8C0"
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

------=_NextPart_000_00BB_01C35063.1072A8C0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm trying to redirect connections from outside (external interface) to a
internal machine (192.168.200.252), but i dont know why, nothing happend.

Someone can tell me whats wrong with this rules?

#!/bin/bash

export IPTABLES=3D/usr/local/sbin/iptables
export MODPROBE=3D/sbin/modprobe

$MODPROBE ip_nat_ftp
$MODPROBE ip_conntrack
$MODPROBE ip_conntrack_ftp
$MODPROBE ipt_string
echo 1 > /proc/sys/net/ipv4/ip_forward

$IPTABLES -F
$IPTABLES -F -t nat
$IPTABLES -F -t mangle
$IPTABLES -X
$IPTABLES -Z

echo "- Enabling SNAT (MASQUERADE) funtionality on eth0"

#<INTERFACES>
IF_EXT=3Deth0
IF_INT=3Deth1
#</INTERFACES>

#<REDES>
ANY=3D0.0.0.0/0
NET_INT=3D192.168.0.0/16
#</REDES>

#<sERVIDOR WEB>
IP_WEB_INT=3D192.168.200.252
IP_WEB_EXT=3D200.X.X.X
#</sERVIDOR WEB>


$IPTABLES -N EXT_SRVWEB
$IPTABLES -A EXT_SRVWEB -p tcp -s $ANY --sport 1024: -d $IP_WEB_INT --dport
10001 -i $IF_EXT -o $IF_INT -j ACCEPT
$IPTABLES -A EXT_SRVWEB -j DROP

$IPTABLES -N SRVWEB_EXT
$IPTABLES -A SRVWEB_EXT -p tcp -s $IP_WEB_INT --sport 10001 -d $ANY --dport
1024: -i $IF_INT -o $IF_EXT -j ACCEPT
$IPTABLES -A SRVWEB_EXT -j DROP

$IPTABLES -t nat -A PREROUTING -d $IP_WEB_EXT -j DNAT --to $IP_WEB_INT -i
$IF_EXT

$IPTABLES -A FORWARD -j EXT_SRVWEB -s $ANY      -d $IP_WEB_INT -i $IF_EXT -o
$IF_INT
$IPTABLES -A FORWARD -j SRVWEB_EXT -s $IP_WEB_INT -d $ANY      -i $IF_INT -o
$IF_EXT

$IPTABLES -A POSTROUTING -t nat -s $IP_WEB_INT -d $ANY -j SNAT --to
$IP_WEB_EXT -o $IF_EXT
$IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s $NET_INT -o $IF_EXT

Thanks
____________________________
Fastrack Solu=E7=F5es e Sistemas
Fernando La Gamba
Network Admin / Security
Com.: 5506-6044 R. 614
Cel.: 9214-2176


---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.501 / Virus Database: 299 - Release Date: 14/7/2003

------=_NextPart_000_00BB_01C35063.1072A8C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I'm trying to redirect connections from =
outside=20
(external interface) to a internal machine (192.168.200.252), but i dont =
know=20
why, nothing happend.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Someone can tell me whats wrong with =
this=20
rules?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>#!/bin/bash</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>export =
IPTABLES=3D/usr/local/sbin/iptables<BR>export=20
MODPROBE=3D/sbin/modprobe</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>$MODPROBE ip_nat_ftp<BR>$MODPROBE=20
ip_conntrack<BR>$MODPROBE ip_conntrack_ftp<BR>$MODPROBE =
ipt_string<BR>echo 1=20
&gt; /proc/sys/net/ipv4/ip_forward</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>$IPTABLES -F<BR>$IPTABLES -F -t =
nat<BR>$IPTABLES -F=20
-t mangle<BR>$IPTABLES -X<BR>$IPTABLES -Z</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>echo "- Enabling SNAT (MASQUERADE) =
funtionality on=20
eth0"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>#&lt;INTERFACES&gt;<BR>IF_EXT=3Deth0<BR>IF_INT=3Deth1<BR>#&lt;/I=
NTERFACES&gt;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>#&lt;REDES&gt;<BR>ANY=3D0.0.0.0/0<BR>NET_INT=3D192.168.0.0/16<BR=
>#&lt;/REDES&gt;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>#&lt;sERVIDOR=20
WEB&gt;<BR>IP_WEB_INT=3D192.168.200.252<BR>IP_WEB_EXT=3D200.X.X.X<BR>#&lt=
;/sERVIDOR=20
WEB&gt;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV><FONT face=3DArial =
size=3D2>
<DIV><BR>$IPTABLES -N EXT_SRVWEB<BR>$IPTABLES -A EXT_SRVWEB -p tcp -s =
$ANY=20
--sport 1024: -d $IP_WEB_INT --dport 10001 -i $IF_EXT -o $IF_INT -j=20
ACCEPT<BR>$IPTABLES -A EXT_SRVWEB -j DROP</DIV>
<DIV>&nbsp;</DIV>
<DIV>$IPTABLES -N SRVWEB_EXT<BR>$IPTABLES -A SRVWEB_EXT -p tcp -s =
$IP_WEB_INT=20
--sport 10001 -d $ANY --dport 1024: -i $IF_INT -o $IF_EXT -j =
ACCEPT<BR>$IPTABLES=20
-A SRVWEB_EXT -j DROP</DIV>
<DIV>&nbsp;</DIV>
<DIV>$IPTABLES -t nat -A PREROUTING -d $IP_WEB_EXT -j DNAT --to =
$IP_WEB_INT -i=20
$IF_EXT</DIV>
<DIV>&nbsp;</DIV>
<DIV>$IPTABLES -A FORWARD -j EXT_SRVWEB -s =
$ANY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -d=20
$IP_WEB_INT -i $IF_EXT -o $IF_INT<BR>$IPTABLES -A FORWARD -j SRVWEB_EXT =
-s=20
$IP_WEB_INT -d $ANY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -i $IF_INT -o =
$IF_EXT</DIV>
<DIV>&nbsp;</DIV>
<DIV>$IPTABLES -A POSTROUTING -t nat -s $IP_WEB_INT -d $ANY -j SNAT --to =

$IP_WEB_EXT -o $IF_EXT<BR>$IPTABLES -A POSTROUTING -t nat -j MASQUERADE =
-s=20
$NET_INT -o $IF_EXT<BR></DIV>
<DIV>Thanks</DIV></FONT>
<DIV><FONT face=3DArial =
size=3D2>____________________________<BR>Fastrack Solu=E7=F5es e=20
Sistemas<BR>Fernando La Gamba<BR>Network Admin / Security<BR>Com.: =
5506-6044 R.=20
614<BR>Cel.: 9214-2176</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><BR>---<BR>Outgoing mail is certified =
Virus=20
Free.<BR>Checked by AVG anti-virus system (<A=20
href=3D"http://www.grisoft.com">http://www.grisoft.com</A>).<BR>Version: =
6.0.501 /=20
Virus Database: 299 - Release Date: 14/7/2003</FONT></DIV></BODY></HTML>

------=_NextPart_000_00BB_01C35063.1072A8C0--


