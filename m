From: Robert Jones <rjonese@shaw.ca>
Subject: iptables and port 113/auth requests
Date: Tue, 04 Feb 2003 15:50:20 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c2cc97$6a1feb80$0201a8c0@robs>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="Boundary_(ID_XHnKS31dctnLY+MScGeh/w)"
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

--Boundary_(ID_XHnKS31dctnLY+MScGeh/w)
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT

I am trying to build a firewall and i have a problem
i have redhat 8.0
2 nic cards eth0 and eth1..... eth0 being external eth1 being internal
eth0 is connected to a cable modem.  gets its ip via dhcp
i run a dhcpd server on my eth1
int lan is 192.168.1.0
trying to set up ip masquerading for my int lan
some of my users use mirc on irc servers that required an ident reply (port 113)
i would like the ident requests from the irc server to be fowarded to the int lan so that mirc can reply to the requests
i domt know if this is even possible but was wondering if anyone could help me

--Boundary_(ID_XHnKS31dctnLY+MScGeh/w)
Content-type: text/html; charset=iso-8859-1
Content-transfer-encoding: 7BIT

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="MSHTML 6.00.2800.1126" name=GENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=#ffffff>
<DIV><FONT face=Arial size=2>I am trying to build a firewall and i have a 
problem</FONT></DIV>
<DIV><FONT face=Arial size=2>i have redhat 8.0</FONT></DIV>
<DIV><FONT face=Arial size=2>2 nic cards eth0 and eth1..... eth0 being external 
eth1 being internal</FONT></DIV>
<DIV><FONT face=Arial size=2>eth0 is connected to a cable modem.&nbsp; gets its 
ip via dhcp</FONT></DIV>
<DIV><FONT face=Arial size=2>i run a dhcpd server on my eth1</FONT></DIV>
<DIV><FONT face=Arial size=2>int lan is 192.168.1.0</FONT></DIV>
<DIV><FONT face=Arial size=2>trying to set up ip masquerading for my int 
lan</FONT></DIV>
<DIV><FONT face=Arial size=2>some of my users use mirc on irc servers that 
required an ident reply (port 113)</FONT></DIV>
<DIV><FONT face=Arial size=2>i would like the ident requests from the irc server 
to be fowarded to the int lan so that mirc can reply to the 
requests</FONT></DIV>
<DIV><FONT face=Arial size=2>i domt know if this is even possible but was 
wondering if anyone could help me</FONT></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

--Boundary_(ID_XHnKS31dctnLY+MScGeh/w)--

