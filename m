From: <system@eluminoustechnologies.com>
Subject: Firewalll script
Date: Mon, 23 Dec 2002 18:02:39 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00cc01c2aa7f$64e82860$1a01a8c0@vishal>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00C7_01C2AAAD.7B193970"
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
To: iptables <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_00C7_01C2AAAD.7B193970
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

Following is the policy that my firewall generation script gives, but my =
system hangs when i execute this, I am using ssh to execute this script. =
My aim is very simple to close all unused ports. My entire scripts goes =
like this. Can you please help me in correcting the script.

#########################################################################=
###
#######
# IPTABLES Firewalll script
# written by ts
#########################################################################=
###
#######
#!/bin/sh

IPTABLES=3D"//sbin/iptables"

echo "Flushing rules..."
$IPTABLES -F
$IPTABLES -X

#Set default policies to DROP
$IPTABLES -F INPUT
$IPTABLES -F OUTPUT
$IPTABLES -F FORWARD
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT


LOOP_IF=3D"lo"


#########################################################################=
##
#----Set network sysctl options-----#
echo "--Setting sysctl options--"

echo "Disabling IP Spoofing attacks"
echo 2 > /proc/sys/net/ipv4/conf/all/rp_filter

echo "Disabling respond to broadcast pings"
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

echo "Blocking source routing"
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route

echo "Kill timestamps"
echo 0 > /proc/sys/net/ipv4/tcp_timestamps

echo "Enable SYN Cookies"
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

echo "Kill redirects"
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects

echo "Enabling bad error message protection"
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

echo "Logging martians (packets with impossible addresses)"
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians

echo "Reducing DoS'ing ability by reducing timeouts"
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 2400 > /proc/sys/net/ipv4/tcp_keepalive_time
echo 0 > /proc/sys/net/ipv4/tcp_window_scaling
echo 0 > /proc/sys/net/ipv4/tcp_sack
echo "Done..."

#########################################################################=

echo "--Setting up standard rules--"

echo "Allow unlimited traffic on the loopback interface"
$IPTABLES -A INPUT -i lo -j ACCEPT
$IPTABLES -A OUTPUT -o lo -j ACCEPT

echo "Enabling SYN-FLOODING PROTECTION"
$IPTABLES -N syn-flood
$IPTABLES -A INPUT -p tcp --syn -j syn-flood
$IPTABLES -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
$IPTABLES -A syn-flood -j DROP

echo "Making sure NEW tcp connections are SYN packets"
$IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

echo "Logging fragments caught"
$IPTABLES -N fragments
$IPTABLES -A INPUT -f -j fragments
$IPTABLES -A fragments -j LOG --log-prefix "IPTABLES FRAGMENTS:"
$IPTABLES -A fragments -j DROP

echo "Refusing spoofed packets pretending to be from your IP address"
#$IPTABLES -A INPUT -s $NET_IPADDR -j DROP
echo "Done..."

#########################################################################=
#
echo "--Setting up user defined chains--"

echo "Allow SSH(22/tcp)"
$IPTABLES -A INPUT -p tcp --sport 22 -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 22 -j ACCEPT


echo "Allow ftp"
$IPTABLES -A INPUT -p tcp --sport 21 -m state --state ESTABLISHED -j =
ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 21 -m state --state NEW,ESTABLISHED =
-j
ACCEPT

echo "Active ftp"
$IPTABLES -A INPUT -p tcp --sport 20 -m state --state =
ESTABLISHED,RELATED -j
ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 20 -m state --state ESTABLISHED -j =
ACCEPT

echo "Passive ftp"
$IPTABLES -A INPUT -p tcp --sport 1024:65535 --dport 1024:65535 -m
state --state ESTABLISHED -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --sport 1024:65535 --dport 1024:65535 -m
state --state ESTABLISHED,RELATED -j ACCEPT


echo "Allow DNS(53/tcp&udp)"
$IPTABLES -A INPUT -p tcp --sport 53 -j ACCEPT
$IPTABLES -A INPUT -p udp --sport 53 -j ACCEPT
$IPTABLES -A INPUT -p tcp --sport 53 -j ACCEPT
$IPTABLES -A INPUT -p udp --sport 53 -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 53 -j ACCEPT
$IPTABLES -A OUTPUT -p udp --dport 53 -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 53 -j ACCEPT
$IPTABLES -A OUTPUT -p udp --dport 53 -j ACCEPT

echo "Allow SFTP(115/tcp)to the internet"
$IPTABLES -A OUTPUT -p tcp --dport 115 -j ACCEPT
$IPTABLES -A INPUT -p tcp --sport 115 -j ACCEPT

echo "Allow IMAP2"
$IPTABLES -A OUTPUT -p tcp --dport 143 -j ACCEPT
$IPTABLES -A INPUT -p tcp --sport 143 -j ACCEPT

echo "Allow HTTP(80)(tcp&udp)to the internet"
$IPTABLES -A OUTPUT -p tcp --dport 80 -j ACCEPT
$IPTABLES -A INPUT -p tcp --sport 80 -j ACCEPT


echo "Allow https"
$IPTABLES -A OUTPUT -p tcp --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp --sport 443 -j ACCEPT


echo "Allow plesk admin"
$IPTABLES -A OUTPUT -p tcp --dport 8443 -j ACCEPT
$IPTABLES -A INPUT -p tcp --sport 8443 -j ACCEPT


echo "Rejecting all connections to 137:139"
$IPTABLES -N NETBIOS
$IPTABLES -A INPUT -p udp --sport 137:139 -j NETBIOS
$IPTABLES -A NETBIOS -j LOG --log-prefix "IPTABLES NETBIOS: "
$IPTABLES -A NETBIOS -j DROP

echo "Allowing SMTP"
$IPTABLES -A OUTPUT -p tcp --dport 25 -j ACCEPT
$IPTABLES -A INPUT -p tcp --sport 25 -j ACCEPT

echo "Allowing POP3"
$IPTABLES -A OUTPUT -p tcp --dport 110 -j ACCEPT
$IPTABLES -A INPUT -p tcp --sport 110 -j ACCEPT

echo "Allowing Ident"
$IPTABLES -A OUTPUT -p tcp --dport 113 -j ACCEPT
$IPTABLES -A INPUT -p tcp --sport 113 -j ACCEPT

echo "Rejecting all other packets"
$IPTABLES -A INPUT -j DROP
$IPTABLES -A OUTPUT -j DROP

echo "Done..."

#########################################################################=
###
#####
echo "Firewall construction completed"










------=_NextPart_000_00C7_01C2AAAD.7B193970
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2920.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi All,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><BR>Following is the policy that my =
firewall=20
generation script gives, but my system hangs when i execute this, I am =
using ssh=20
to execute this script. My&nbsp;aim is very simple to close all unused =
ports. My=20
entire scripts goes like this. Can you please help me in correcting the=20
script.<BR><BR>##########################################################=
##################<BR>#######<BR>#=20
IPTABLES Firewalll script<BR># written by=20
ts<BR>###################################################################=
#########<BR>#######<BR>#!/bin/sh<BR><BR>IPTABLES=3D"//sbin/iptables"<BR>=
<BR>echo=20
"Flushing rules..."<BR>$IPTABLES -F<BR>$IPTABLES -X<BR><BR>#Set default =
policies=20
to DROP<BR>$IPTABLES -F INPUT<BR>$IPTABLES -F OUTPUT<BR>$IPTABLES -F=20
FORWARD<BR>$IPTABLES -P INPUT ACCEPT<BR>$IPTABLES -P OUTPUT=20
ACCEPT<BR><BR><BR>LOOP_IF=3D"lo"<BR><BR><BR>#############################=
##############################################<BR>#----Set=20
network sysctl options-----#<BR>echo "--Setting sysctl =
options--"<BR><BR>echo=20
"Disabling IP Spoofing attacks"<BR>echo 2 &gt;=20
/proc/sys/net/ipv4/conf/all/rp_filter<BR><BR>echo "Disabling respond to=20
broadcast pings"<BR>echo 1 &gt;=20
/proc/sys/net/ipv4/icmp_echo_ignore_broadcasts<BR><BR>echo "Blocking =
source=20
routing"<BR>echo 0 &gt;=20
/proc/sys/net/ipv4/conf/all/accept_source_route<BR><BR>echo "Kill=20
timestamps"<BR>echo 0 &gt; /proc/sys/net/ipv4/tcp_timestamps<BR><BR>echo =
"Enable=20
SYN Cookies"<BR>echo 1 &gt; =
/proc/sys/net/ipv4/tcp_syncookies<BR><BR>echo "Kill=20
redirects"<BR>echo 0 &gt;=20
/proc/sys/net/ipv4/conf/all/accept_redirects<BR><BR>echo "Enabling bad =
error=20
message protection"<BR>echo 1 &gt;=20
/proc/sys/net/ipv4/icmp_ignore_bogus_error_responses<BR><BR>echo =
"Logging=20
martians (packets with impossible addresses)"<BR>echo 1 &gt;=20
/proc/sys/net/ipv4/conf/all/log_martians<BR><BR>echo "Reducing DoS'ing =
ability=20
by reducing timeouts"<BR>echo 30 &gt; =
/proc/sys/net/ipv4/tcp_fin_timeout<BR>echo=20
2400 &gt; /proc/sys/net/ipv4/tcp_keepalive_time<BR>echo 0 &gt;=20
/proc/sys/net/ipv4/tcp_window_scaling<BR>echo 0 &gt;=20
/proc/sys/net/ipv4/tcp_sack<BR>echo=20
"Done..."<BR><BR>########################################################=
#################<BR>echo=20
"--Setting up standard rules--"<BR><BR>echo "Allow unlimited traffic on =
the=20
loopback interface"<BR>$IPTABLES -A INPUT -i lo -j ACCEPT<BR>$IPTABLES =
-A OUTPUT=20
-o lo -j ACCEPT<BR><BR>echo "Enabling SYN-FLOODING =
PROTECTION"<BR>$IPTABLES -N=20
syn-flood<BR>$IPTABLES -A INPUT -p tcp --syn -j syn-flood<BR>$IPTABLES =
-A=20
syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN<BR>$IPTABLES -A =

syn-flood -j DROP<BR><BR>echo "Making sure NEW tcp connections are SYN=20
packets"<BR>$IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j=20
DROP<BR><BR>echo "Logging fragments caught"<BR>$IPTABLES -N=20
fragments<BR>$IPTABLES -A INPUT -f -j fragments<BR>$IPTABLES -A =
fragments -j LOG=20
--log-prefix "IPTABLES FRAGMENTS:"<BR>$IPTABLES -A fragments -j =
DROP<BR><BR>echo=20
"Refusing spoofed packets pretending to be from your IP =
address"<BR>#$IPTABLES=20
-A INPUT -s $NET_IPADDR -j DROP<BR>echo=20
"Done..."<BR><BR>########################################################=
##################<BR>echo=20
"--Setting up user defined chains--"<BR><BR>echo "Allow=20
SSH(22/tcp)"<BR>$IPTABLES -A INPUT -p tcp --sport 22 -j =
ACCEPT<BR>$IPTABLES -A=20
OUTPUT -p tcp --dport 22 -j ACCEPT<BR><BR><BR>echo "Allow =
ftp"<BR>$IPTABLES -A=20
INPUT -p tcp --sport 21 -m state --state ESTABLISHED -j =
ACCEPT<BR>$IPTABLES -A=20
OUTPUT -p tcp --dport 21 -m state --state NEW,ESTABLISHED=20
-j<BR>ACCEPT<BR><BR>echo "Active ftp"<BR>$IPTABLES -A INPUT -p tcp =
--sport 20 -m=20
state --state ESTABLISHED,RELATED -j<BR>ACCEPT<BR>$IPTABLES -A OUTPUT -p =
tcp=20
--dport 20 -m state --state ESTABLISHED -j ACCEPT<BR><BR>echo "Passive=20
ftp"<BR>$IPTABLES -A INPUT -p tcp --sport 1024:65535 --dport 1024:65535=20
-m<BR>state --state ESTABLISHED -j ACCEPT<BR>$IPTABLES -A OUTPUT -p tcp =
--sport=20
1024:65535 --dport 1024:65535 -m<BR>state --state ESTABLISHED,RELATED -j =

ACCEPT<BR><BR><BR>echo "Allow DNS(53/tcp&amp;udp)"<BR>$IPTABLES -A INPUT =
-p tcp=20
--sport 53 -j ACCEPT<BR>$IPTABLES -A INPUT -p udp --sport 53 -j=20
ACCEPT<BR>$IPTABLES -A INPUT -p tcp --sport 53 -j ACCEPT<BR>$IPTABLES -A =
INPUT=20
-p udp --sport 53 -j ACCEPT<BR>$IPTABLES -A OUTPUT -p tcp --dport 53 -j=20
ACCEPT<BR>$IPTABLES -A OUTPUT -p udp --dport 53 -j ACCEPT<BR>$IPTABLES =
-A OUTPUT=20
-p tcp --dport 53 -j ACCEPT<BR>$IPTABLES -A OUTPUT -p udp --dport 53 -j=20
ACCEPT<BR><BR>echo "Allow SFTP(115/tcp)to the internet"<BR>$IPTABLES -A =
OUTPUT=20
-p tcp --dport 115 -j ACCEPT<BR>$IPTABLES -A INPUT -p tcp --sport 115 -j =

ACCEPT<BR><BR>echo "Allow IMAP2"<BR>$IPTABLES -A OUTPUT -p tcp --dport =
143 -j=20
ACCEPT<BR>$IPTABLES -A INPUT -p tcp --sport 143 -j ACCEPT<BR><BR>echo =
"Allow=20
HTTP(80)(tcp&amp;udp)to the internet"<BR>$IPTABLES -A OUTPUT -p tcp =
--dport 80=20
-j ACCEPT<BR>$IPTABLES -A INPUT -p tcp --sport 80 -j =
ACCEPT<BR><BR><BR>echo=20
"Allow https"<BR>$IPTABLES -A OUTPUT -p tcp --dport 443 -j =
ACCEPT<BR>$IPTABLES=20
-A INPUT -p tcp --sport 443 -j ACCEPT<BR><BR><BR>echo "Allow plesk=20
admin"<BR>$IPTABLES -A OUTPUT -p tcp --dport 8443 -j ACCEPT<BR>$IPTABLES =
-A=20
INPUT -p tcp --sport 8443 -j ACCEPT<BR><BR><BR>echo "Rejecting all =
connections=20
to 137:139"<BR>$IPTABLES -N NETBIOS<BR>$IPTABLES -A INPUT -p udp --sport =
137:139=20
-j NETBIOS<BR>$IPTABLES -A NETBIOS -j LOG --log-prefix "IPTABLES =
NETBIOS:=20
"<BR>$IPTABLES -A NETBIOS -j DROP<BR><BR>echo "Allowing =
SMTP"<BR>$IPTABLES -A=20
OUTPUT -p tcp --dport 25 -j ACCEPT<BR>$IPTABLES -A INPUT -p tcp --sport =
25 -j=20
ACCEPT<BR><BR>echo "Allowing POP3"<BR>$IPTABLES -A OUTPUT -p tcp --dport =
110 -j=20
ACCEPT<BR>$IPTABLES -A INPUT -p tcp --sport 110 -j ACCEPT<BR><BR>echo =
"Allowing=20
Ident"<BR>$IPTABLES -A OUTPUT -p tcp --dport 113 -j ACCEPT<BR>$IPTABLES =
-A INPUT=20
-p tcp --sport 113 -j ACCEPT<BR><BR>echo "Rejecting all other=20
packets"<BR>$IPTABLES -A INPUT -j DROP<BR>$IPTABLES -A OUTPUT -j=20
DROP<BR><BR>echo=20
"Done..."<BR><BR>########################################################=
####################<BR>#####<BR>echo=20
"Firewall construction=20
completed"<BR><BR><BR><BR><BR><BR><BR><BR><BR></DIV></FONT></BODY></HTML>=


------=_NextPart_000_00C7_01C2AAAD.7B193970--


