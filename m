From: Todd Hartman <thartman@bass-inc.com>
Subject: Port Forwarding only works outside?
Date: Tue, 10 Dec 2002 09:31:56 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <97AE76F7052DBB43A268427FCAAEF0371BF6CE@s-2k-corp1.bass-inc.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2A061.460304B0"
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

------_=_NextPart_001_01C2A061.460304B0
Content-Type: text/plain

I've come across an issue I just don't know how to solve. I'm not even
certain it's an issue with iptables itself, but I thought that someone here
might have run across this before and have some advice.
 
I've got a RH7.3 box set up with two NICs. Eth0 is external and eth1 is
internal. Internal network is 192.168.1.* with netmask 255.255.255.128. I
need to forward traffic on eth0, port 25 to 192.168.1.29. The firewall is
192.168.1.1 - both in the same subnet as I understand it.
 
When I forward SMTP traffic to 192.168.1.29 and try to telnet to port 25 to
test SMTP, it just sits there, unresponsive. BUT, if I forward eth0 port 25
traffic to a machine out on the internet, it works just fine.
 
I suspect a networking problem, but I don't know well enough to pin it down
myself.
 
-T
 

------_=_NextPart_001_01C2A061.460304B0
Content-Type: text/html

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=US-ASCII">
<TITLE>Message</TITLE>

<META content="MSHTML 6.00.2800.1106" name=GENERATOR></HEAD>
<BODY>
<DIV><SPAN class=670362715-10122002><FONT face=Arial size=2>I've come across an 
issue I just don't know how to solve. I'm not even certain it's an issue with 
iptables itself, but I thought that someone here might have run across this 
before and have some advice.</FONT></SPAN></DIV>
<DIV><SPAN class=670362715-10122002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=670362715-10122002><FONT face=Arial size=2>I've got a RH7.3 box 
set up with two NICs. Eth0 is external and eth1 is internal. Internal network is 
192.168.1.* with netmask 255.255.255.128. I need to forward traffic on eth0, 
port 25 to 192.168.1.29. The firewall is 192.168.1.1 - both in the same subnet 
as I understand it.</FONT></SPAN></DIV>
<DIV><SPAN class=670362715-10122002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=670362715-10122002><FONT face=Arial size=2>When I forward SMTP 
traffic to 192.168.1.29 and try to telnet to port 25 to test SMTP, it just sits 
there, unresponsive. BUT, if I forward eth0 port 25 traffic to a machine out on 
the internet, it works just fine.</FONT></SPAN></DIV>
<DIV><SPAN class=670362715-10122002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=670362715-10122002><FONT face=Arial size=2>I suspect a 
networking problem, but I don't know well enough to pin it down 
myself.</FONT></SPAN></DIV>
<DIV><SPAN class=670362715-10122002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=670362715-10122002><FONT face=Arial 
size=2>-T</FONT></SPAN></DIV>
<DIV><SPAN class=670362715-10122002></SPAN>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C2A061.460304B0--

