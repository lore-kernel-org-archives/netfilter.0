From: "esie" <esie@esie.ensino.eb.br>
Subject: port 23000 block
Date: Tue, 17 Sep 2002 16:04:50 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c25e7d$1a569500$6501010a@esie.ensino.eb.br>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C25E63.F430B040"
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

------=_NextPart_000_000D_01C25E63.F430B040
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, list
I got some problems in my firewall
I built one firewall in the Pentium III, 600 Mhz and 256 Mb RAM.
I have been using Slackware 8.1 OS with iptables 1.2.6a and squid 2.4 =
Stable 7 and with rules below:


#!/bin/sh
#
# IPTABLES FIREWALL -=20
###
# eth0 - Internet
# eth1 - intranet
#
echo "start firewall"
iptables -F
#
echo "1">/proc/sys/net/ipv4/ip_forward
#
#
/sbin/depmod -a
/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state
/sbin/modprobe ipt_MASQUERADE
#insmod ip_conntrack_ftp
#insmod ip_nat_ftp
#
# Impede a entrada de pacotes spoofados na tabela de roteamento interno
#echo " protecao contra spoof"
#iptables -t nat -A PREROUTING -i eth0 -s 192.168.0.0/16 -j DROP
#iptables -t nat -A PREROUTING -i eth0 -s 10.0.0.0/8 -j DROP
#iptables -t nat -A PREROUTING -i eth0 -s 172.16.0.0/12 -j DROP
#
#
# Permite que pacotes circulem livremente na 'rede interna'
#iptables -A INPUT -p all -i eth1 -j ACCEPT
#iptables -A INPUT -p all -i lo -j ACCEPT
#iptables -A FORWARD -p all -i eth1 -o eth0 -j ACCEPT
#icmp
echo "-ICMP"
iptables -A FORWARD -p icmp -j ACCEPT=20
iptables -A INPUT -p icmp -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT
#
# Mascara rede Interna (no caso a rede interna estah em 10.1.1.24/16)
iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -j MASQUERADE
#
# Acessos servidos pelo firewall
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -p tcp --dport 110 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 3128 -j ACCEPT
iptables -A INPUT -p tcp --dport 23000 -j ACCEPT
iptables -A INPUT -p tcp --dport 8999 -j ACCEPT
iptables -A INPUT -p tcp --dport 13352 -j ACCEPT
#
#
# Permite saida dos pacotes com ip real da rede privada
## As regras ate o EOFINT sao para permitir acesso a servicos externos
## acesso ftp
#ftp
iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport 21 =
-j MASQUERADE
#ssh
iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport 22 =
-j MASQUERADE
#smtp
iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport 25 =
-j MASQUERADE
#pop
iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport 110 =
-j MASQUERADE
#www
#iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport 80 =
-j MASQUERADE
#iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to =
200.20.192.67:80
#
#imap
iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p udp --dport 143 =
-j MASQUERADE
#https
iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport 443 =
-j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p udp --dport 443 =
-j MASQUERADE
#dns
#   udp
iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p udp --dport 53 =
-j MASQUERADE
#   tcp
iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport 53 =
-j MASQUERADE
#siafi
iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport =
8999 -j MASQUERADE

iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport =
23000 -j MASQUERADE
#
iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport =
13352 -j MASQUERADE
#
#SQUID
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to =
200.20.XX.XX:3128
#
## EOFINT
#
# Permite os pacotes voltarem para conexoes validas da rede interna
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
#
#fecha as portas
iptables -A FORWARD -j DROP


However, I"ve had problem with port 23000, which is necessary to run =
terminal emulator
I tested the comunication without squid rules, but didn't work.
Please
I would apreciate any help
Thank you
Rogerio

------=_NextPart_000_000D_01C25E63.F430B040
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Hi, list</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I got some problems in my =
firewall</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I built one firewall in the Pentium =
III, 600 Mhz=20
and 256 Mb RAM.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have been using Slackware 8.1 OS with =
iptables=20
1.2.6a and squid 2.4 Stable 7 and with rules below:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>#!/bin/sh<BR>#<BR># IPTABLES FIREWALL - =

<BR>###<BR># eth0 - Internet</FONT></DIV>
<DIV><FONT face=3DArial size=3D2># eth1 - intranet</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>#</FONT><FONT face=3DArial =
size=3D2><BR>echo "start=20
firewall"<BR>iptables -F<BR>#<BR>echo=20
"1"&gt;/proc/sys/net/ipv4/ip_forward<BR>#<BR>#<BR>/sbin/depmod=20
-a<BR>/sbin/modprobe ip_tables<BR>/sbin/modprobe =
ip_conntrack<BR>/sbin/modprobe=20
iptable_filter<BR>/sbin/modprobe iptable_mangle<BR>/sbin/modprobe=20
iptable_nat<BR>/sbin/modprobe ipt_LOG<BR>/sbin/modprobe=20
ipt_limit<BR>/sbin/modprobe ipt_state<BR>/sbin/modprobe=20
ipt_MASQUERADE<BR>#insmod ip_conntrack_ftp<BR>#insmod =
ip_nat_ftp<BR>#<BR>#=20
Impede a entrada de pacotes spoofados na tabela de roteamento =
interno<BR>#echo "=20
protecao contra spoof"<BR>#iptables -t nat -A PREROUTING -i eth0 -s=20
192.168.0.0/16 -j DROP<BR>#iptables -t nat -A PREROUTING -i eth0 -s =
10.0.0.0/8=20
-j DROP<BR>#iptables -t nat -A PREROUTING -i eth0 -s 172.16.0.0/12 -j=20
DROP<BR>#<BR>#<BR># Permite que pacotes circulem livremente na 'rede=20
interna'<BR>#iptables -A INPUT -p all -i eth1 -j ACCEPT<BR>#iptables -A =
INPUT -p=20
all -i lo -j ACCEPT<BR>#iptables -A FORWARD -p all -i eth1 -o eth0 -j=20
ACCEPT<BR>#icmp<BR>echo "-ICMP"<BR>iptables -A FORWARD -p icmp -j ACCEPT =

<BR>iptables -A INPUT -p icmp -j ACCEPT<BR>iptables -A OUTPUT -p icmp -j =

ACCEPT<BR>#<BR># Mascara rede Interna (no caso a rede interna estah em=20
10.1.1.24/16)<BR>iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 =
-j=20
MASQUERADE<BR>#<BR># Acessos servidos pelo firewall<BR>iptables -A INPUT =
-p tcp=20
--dport 25 -j ACCEPT<BR>iptables -A INPUT -p tcp --dport 110 -j=20
ACCEPT<BR>iptables -A INPUT -p tcp --dport 53 -j ACCEPT<BR>iptables -A =
INPUT -p=20
udp --dport 53 -j ACCEPT<BR>iptables -A INPUT -p tcp --dport 80 -j=20
ACCEPT<BR>iptables -A INPUT -p tcp --dport 443 -j ACCEPT<BR>iptables -A =
INPUT -p=20
tcp --dport 3128 -j ACCEPT<BR>iptables -A INPUT -p tcp --dport 23000 -j=20
ACCEPT<BR>iptables -A INPUT -p tcp --dport 8999 -j ACCEPT<BR>iptables -A =
INPUT=20
-p tcp --dport 13352 -j ACCEPT<BR>#<BR>#<BR># Permite saida dos pacotes =
com ip=20
real da rede privada<BR>## As regras ate o EOFINT sao para permitir =
acesso a=20
servicos externos<BR>## acesso ftp<BR>#ftp<BR>iptables -t nat -A =
POSTROUTING -s=20
10.1.0.0/22 -o eth0 -p tcp --dport 21 -j MASQUERADE<BR>#ssh<BR>iptables =
-t nat=20
-A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport 22 -j=20
MASQUERADE<BR>#smtp<BR>iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o =
eth0 -p=20
tcp --dport 25 -j MASQUERADE<BR>#pop<BR>iptables -t nat -A POSTROUTING =
-s=20
10.1.0.0/22 -o eth0 -p tcp --dport 110 -j =
MASQUERADE<BR>#www<BR>#iptables -t nat=20
-A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport 80 -j=20
MASQUERADE<BR>#iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 =
-j DNAT=20
--to 200.20.192.67:80<BR>#<BR>#imap<BR>iptables -t nat -A POSTROUTING -s =

10.1.0.0/22 -o eth0 -p udp --dport 143 -j =
MASQUERADE<BR>#https<BR>iptables -t=20
nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport 443 -j=20
MASQUERADE<BR>iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p =
udp=20
--dport 443 -j MASQUERADE<BR>#dns<BR>#&nbsp;&nbsp; udp<BR>iptables -t =
nat -A=20
POSTROUTING -s 10.1.0.0/22 -o eth0 -p udp --dport 53 -j=20
MASQUERADE<BR>#&nbsp;&nbsp; tcp<BR>iptables -t nat -A POSTROUTING -s =
10.1.0.0/22=20
-o eth0 -p tcp --dport 53 -j MASQUERADE<BR>#siafi<BR>iptables -t nat -A=20
POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport 8999 -j=20
MASQUERADE<BR></FONT><FONT face=3DArial size=3D2><BR>iptables -t nat -A =
POSTROUTING=20
-s 10.1.0.0/22 -o eth0 -p tcp --dport 23000 -j =
MASQUERADE<BR>#</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -s =
10.1.0.0/22 -o=20
eth0 -p tcp --dport 13352 -j MASQUERADE<BR>#<BR>#SQUID<BR>iptables -t =
nat -A=20
PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to =
200.20.XX.XX:3128<BR>#<BR>##=20
EOFINT<BR>#<BR># Permite os pacotes voltarem para conexoes validas da =
rede=20
interna<BR>iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j=20
ACCEPT<BR>#<BR>#fecha as portas<BR>iptables -A FORWARD -j =
DROP<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>However, I"ve had problem with port =
23000, which is=20
necessary to run terminal emulator</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I tested the comunication without squid =
rules, but=20
didn't work.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Please</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I would apreciate any help</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Thank you</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>Rogerio</DIV></FONT></FONT></DIV></BODY></HTML>

------=_NextPart_000_000D_01C25E63.F430B040--



