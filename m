From: "Vanderveer, Derek" <Derek.Vanderveer@McKesson.com>
Subject: FTP over NAT problem
Date: Tue, 25 May 2004 09:41:33 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FFE4E834C1C2C04DA3EC09A7FE28FDC206A59C25@migmsx01.alitech.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----_=_NextPart_001_01C44277.2373FF44"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C44277.2373FF44
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Hey all,
 
I've been fighting with this problem for over a week, and I've made no
headway.  I have a server with a bank of serial ports, all attached to
modems.  We use scripts to raise and drop lines to various customer
sites that we support.  In the past, we've had great success using
iptables to handle forwarding and NAT of LAN traffic going out over the
wire to the customer's servers.  My latest server, however, doesn't
handle FTP, PCAnywhere or RDP at all, using the same iptables commands
as the older servers.  It has a slightly newer (v1.2.6a vs. 1.2.5)
version of iptables, but otherwise isn't much different.
 
Telnet and ICMP work fine, but PCA and RDP never connect.  You can
connect to a server using FTP, and browse in Active or Passive mode
without any problems.  As soon as you try to transfer a file, however,
the transfer hangs immediately, regardless of whether you use Active or
Passive.  I've pared my iptables script down to the bare minimum that
gets me to this state after a full reboot, and here it is:
 
modprobe ip_conntrack_ftp
modprobe ip_nat_ftp
iptables -P FORWARD DROP
iptables -F FORWARD
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -o ppp+ -j MASQUERADE
iptables -A FORWARD -i eth0 -o ppp+ -j ACCEPT
iptables -A FORWARD -i ppp+ -o eth0 -m state --state ESTABLISHED,RELATED
-j ACCEPT
Distro is Debian 3.0r2, kernel is 2.4.26.  All non-experimental
netfilter kernel options are compiled as modules; except for
ip_conntrack_ftp and ip_nat_ftp, I just let the others autoload as I
issue the iptables statements above.  Can anyone shed any light on why
this is happening??  The same iptables ruleset works fine on my other
servers, and I'm stumped!

     Derek V.



------_=_NextPart_001_01C44277.2373FF44
Content-Type: text/html;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>



<META content="MSHTML 6.00.2800.1400" name=GENERATOR></HEAD>
<BODY>
<DIV><FONT face=Arial size=2>
<DIV><FONT face=Arial size=2><SPAN class=849334507-22052004>Hey 
all,</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=849334507-22052004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=849334507-22052004>I've been fighting 
with this problem for over a week, and I've made no headway.&nbsp; I have a 
server with a bank of serial ports, all attached to modems.&nbsp; We use scripts 
to raise and drop lines to various customer sites that we support.&nbsp; In the 
past, we've had great success using iptables to handle forwarding and NAT of LAN 
traffic going out over the wire to the customer's servers.&nbsp;&nbsp;My latest 
server, however, doesn't handle FTP, PCAnywhere or RDP&nbsp;at all, using the 
same iptables commands as the older servers.&nbsp; It has a slightly newer 
(v1.2.6a vs. 1.2.5) version of iptables, but otherwise isn't much 
different.</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=849334507-22052004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=849334507-22052004>Telnet and ICMP work 
fine, but PCA and RDP never connect.&nbsp; You can connect to a server using 
FTP, and browse in Active or Passive mode without any problems.&nbsp; As soon as 
you try to transfer a file, however, the transfer hangs immediately, regardless 
of whether you use Active or Passive.&nbsp; I've pared my iptables script down 
to the bare minimum that gets me to this state after a full reboot, and here it 
is:</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=849334507-22052004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=849334507-22052004>
<DIV><FONT face="Courier New" size=2><SPAN class=849334507-22052004>modprobe 
ip_conntrack_ftp</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=849334507-22052004>modprobe 
ip_nat_ftp</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN 
class=849334507-22052004></SPAN></FONT>iptables -P FORWARD 
DROP</SPAN></FONT></DIV></DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=849334507-22052004>iptables -F 
FORWARD</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=849334507-22052004>iptables -t 
nat -P POSTROUTING ACCEPT</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=849334507-22052004>iptables -t 
nat -F POSTROUTING</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=849334507-22052004>iptables -t 
nat -A POSTROUTING -o ppp+ -j MASQUERADE</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=849334507-22052004>iptables -A 
FORWARD -i eth0 -o ppp+ -j ACCEPT</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=849334507-22052004>iptables -A 
FORWARD -i ppp+ -o eth0 -m state --state ESTABLISHED,RELATED -j 
ACCEPT</SPAN></FONT></DIV>
<DIV>
<DIV><FONT face="Courier New" size=2><SPAN 
class=849334507-22052004></SPAN></FONT></DIV><FONT face="Courier New" 
size=2><SPAN class=849334507-22052004></SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=849334507-22052004>Distro is Debian 
3.0r2, kernel is 2.4.26.&nbsp; All non-experimental netfilter kernel options are 
compiled as modules; except for ip_conntrack_ftp and ip_nat_ftp, I just let the 
others autoload as I issue the iptables statements above.&nbsp; Can anyone shed 
any light on why this is happening??&nbsp; The same iptables ruleset works fine 
on my other servers, and I'm stumped!</SPAN></FONT></DIV>
<P><FONT face=Arial size=2>&nbsp;&nbsp;&nbsp;&nbsp; Derek 
V.</FONT><BR></P></FONT></DIV></BODY></HTML>

------_=_NextPart_001_01C44277.2373FF44--


