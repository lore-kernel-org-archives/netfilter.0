From: =?iso-8859-1?Q?Ethan_Trevi=F1o?= <etrevino@mec.edu>
Subject: Problem with configuration script
Date: Thu, 22 May 2003 09:27:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c32065$ecee45d0$6400a8c0@ethan>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C32044.65DCA5D0"
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

------=_NextPart_000_0001_01C32044.65DCA5D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hey,
I have a RedHat 9 system with a Iptables 1.2.7a installed on it.  My
system runs DHCPD off of eth0 (which also is the only ethernet card on
that system).  I want the DHCP clients to be able to access the internet
using DHCP server, so I've been trying to set up NAT.  However, whenever
I run the script (copied below) I get the following error:
 
[root@male sysconfig]# ./myfilters 
iptables: Invalid argument
iptables v1.2.7a: Unknown arg `-j'
Try `iptables -h' or 'iptables --help' for more information.
./myfilters: line 38: ACCEPT: command not found
 
What changes do I need to make to this script to allow my system to
operate as a NAT server to my DHCP clients?
 
Thanks,
Ethan
 
//////////////////////////////////myfilters/////////////////////////////
/////////////////////////////////////
# set default (policy) rules
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
 
#IP spoofing, deny and packets on the internal network that has an
external source address.
iptables -A INPUT -j LOG -i eth0 \! -s 192.168.1.0/24
iptables -A INPUT -j DROP -i eth0 \! -s 192.168.1.0/24
iptables -A FORWARD -j DROP -i eth0 \! -s 192.168.1.0/24
 
# IP spoofing, deny any outside packets (any not on eth1) that have the
source address of the internal network
iptables -A INPUT -j DROP \! -i eth0 -s 192.168.1.0/24
iptables -A INPUT -j FORWARD \! -i eth0 -s 192.168.1.0/24
 
# IP spoofing, deny any outside packets with localhost address
# (packets not on the lo interface (any on eth0 or eth1) that have the
source address of localhost)
iptables -A INPUT -j DROP -i \! lo -s 127.0.0.0/255.0.0.0
iptables -A FORWARD -j DROP -i \! lo -s 127.0.0.0/255.0.0.0
 
# allow all incoming messages for users on your firewall system
iptables -A INPUT -j ACCEPT -i lo
 
# allow communication to the Web server (address 10.0.0.2), port www
# iptables -A INPUT -j ACCEPT -p tcp -i eth0 --dport www -s 10.0.0.2
 
# Allow established connections from Web servers to internal network
#iptables -A INPUT -m state --state ESTABLISHED,RELATED -i eth0 -p tcp
#--sport www -s 10.0.0.2 -d 192.168.1.0/24 -j ACCEPT
 
# Prevent new connection from Web servers to internal network
#iptables -A OUTPUT -m state --state NEW -o eth0 -p tcp --sport www
#-d 192.168.1.0/24 -j DROP
 
# allow established and related outside communications to your system
# allow outside communication to the firewall, except for ICMP packets
iptables -A INPUT -m state --state ESTABLISHED,RELATED -i eth0 -p \!
icmp -j
ACCEPT
 
# prevent outside initiated connections
iptables -A INPUT -m state --state NEW -i eth0 -j DROP
iptables -A FORWARD -m state --state NEW -i eth0 -j DROP
 
# allow all local communication to and from the firewall on eth0 from
the local network
iptables -A INPUT -j ACCEPT -p all -i eth0 -s 192.168.1.0/24
 
# Set up masquerading to allow internal machines access to outside
network
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
 
# Accept ICMP Ping (0 and 8) and Destination unreachable (3) messages
# Others will be rejected by INPUT and OUTPUT DROP policy
iptables -A INPUT -j ACCEPT -p icmp -i eth0 --icmp-type echo-reply -d
209.80.243.199
iptables -A INPUT -j ACCEPT -p icmp -i eth0 --icmp-type echo-request -d
209.80.243.199
iptables -A INPUT -j ACCEPT -p icmp -i eth0 --icmp-type
destination-unreachable -d 209.80.243.199
 
# Turn on IP Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

------=_NextPart_000_0001_01C32044.65DCA5D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2726.2500" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial=20
size=3D2>Hey,</FONT></SPAN></DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2>I have =
a RedHat 9=20
system with a Iptables 1.2.7a installed on it.&nbsp; My system runs =
DHCPD off of=20
eth0 (which also is the only ethernet card on that system).&nbsp; I want =
the=20
DHCP clients to be able to access the internet using DHCP server, so =
I've been=20
trying to set up NAT.&nbsp; However, whenever I run the script (copied =
below) I=20
get the following error:</FONT></SPAN></DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial =
size=3D2>[root@male=20
sysconfig]# ./myfilters <BR>iptables: Invalid argument<BR>iptables =
v1.2.7a:=20
Unknown arg `-j'<BR>Try `iptables -h' or 'iptables --help' for more=20
information.<BR>./myfilters: line 38: ACCEPT: command not=20
found</FONT></SPAN></DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2>What =
changes do I=20
need to make to this script to allow my system to operate as a NAT =
server to my=20
DHCP clients?</FONT></SPAN></DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial=20
size=3D2>Thanks,</FONT></SPAN></DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial=20
size=3D2>Ethan</FONT></SPAN></DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial=20
size=3D2>//////////////////////////////////myfilters/////////////////////=
/////////////////////////////////////////////</FONT></SPAN></DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2># set =
default=20
(policy) rules<BR>iptables -P INPUT DROP<BR>iptables -P OUTPUT=20
ACCEPT<BR>iptables -P FORWARD ACCEPT</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2>#IP =
spoofing, deny=20
and packets on the internal network that has an external source=20
address.<BR>iptables -A INPUT -j LOG -i eth0 \! -s =
192.168.1.0/24<BR>iptables -A=20
INPUT -j DROP -i eth0 \! -s 192.168.1.0/24<BR>iptables -A FORWARD -j =
DROP -i=20
eth0 \! -s 192.168.1.0/24</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2># IP =
spoofing, deny=20
any outside packets (any not on eth1) that have the source address of =
the=20
internal network<BR>iptables -A INPUT -j DROP \! -i eth0 -s=20
192.168.1.0/24<BR>iptables -A INPUT -j FORWARD \! -i eth0 -s=20
192.168.1.0/24</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2># IP =
spoofing, deny=20
any outside packets with localhost address<BR># (packets not on the lo =
interface=20
(any on eth0 or eth1) that have the source address of =
localhost)<BR>iptables -A=20
INPUT -j DROP -i \! lo -s 127.0.0.0/255.0.0.0<BR>iptables -A FORWARD -j =
DROP -i=20
\! lo -s 127.0.0.0/255.0.0.0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2># =
allow all incoming=20
messages for users on your firewall system<BR>iptables -A INPUT -j =
ACCEPT -i=20
lo</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2># =
allow=20
communication to the Web server (address 10.0.0.2), port www<BR># =
iptables -A=20
INPUT -j ACCEPT -p tcp -i eth0 --dport www -s =
10.0.0.2</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2># =
Allow established=20
connections from Web servers to internal network<BR>#iptables -A INPUT =
-m state=20
--state ESTABLISHED,RELATED -i eth0 -p tcp<BR>#--sport www -s 10.0.0.2 =
-d=20
192.168.1.0/24 -j ACCEPT</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2># =
Prevent new=20
connection from Web servers to internal network<BR>#iptables -A OUTPUT =
-m state=20
--state NEW -o eth0 -p tcp --sport www<BR>#-d 192.168.1.0/24 -j=20
DROP</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2># =
allow established=20
and related outside communications to your system<BR># allow outside=20
communication to the firewall, except for ICMP packets<BR>iptables -A =
INPUT -m=20
state --state ESTABLISHED,RELATED -i eth0 -p \! icmp=20
-j<BR>ACCEPT</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2># =
prevent outside=20
initiated connections<BR>iptables -A INPUT -m state --state NEW -i eth0 =
-j=20
DROP<BR>iptables -A FORWARD -m state --state NEW -i eth0 -j=20
DROP</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2># =
allow all local=20
communication to and from the firewall on eth0 from the local=20
network<BR>iptables -A INPUT -j ACCEPT -p all -i eth0 -s=20
192.168.1.0/24</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2># Set =
up=20
masquerading to allow internal machines access to outside =
network<BR>iptables -t=20
nat -A POSTROUTING -o eth0 -j MASQUERADE</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2># =
Accept ICMP Ping=20
(0 and 8) and Destination unreachable (3) messages<BR># Others will be =
rejected=20
by INPUT and OUTPUT DROP policy<BR>iptables -A INPUT -j ACCEPT -p icmp =
-i eth0=20
--icmp-type echo-reply -d 209.80.243.199<BR>iptables -A INPUT -j ACCEPT =
-p icmp=20
-i eth0 --icmp-type echo-request -d 209.80.243.199<BR>iptables -A INPUT =
-j=20
ACCEPT -p icmp -i eth0 --icmp-type destination-unreachable -d=20
209.80.243.199</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D485070713-22052003><FONT face=3DArial size=3D2># Turn =
on IP=20
Forwarding<BR>echo 1 &gt;=20
/proc/sys/net/ipv4/ip_forward</FONT></SPAN></DIV></BODY></HTML>

------=_NextPart_000_0001_01C32044.65DCA5D0--


