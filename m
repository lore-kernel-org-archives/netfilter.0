From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Redhat Linux 8.0 IPtables help
Date: 06 Jun 2003 10:10:01 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054874488.2496.7.camel@india>
References: <20030602160653.GB14609@eris>
	<20030602165342.GC14917@harp.incogen.com>
	<20030602171755.GA6298@hactar.local.funknet.net>
	<200306041635.19489.rfunk@funknet.net> 
	<000f01c32b99$3d65fab0$8c01a8c0@percipia.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Fk2MLzKC3BhJ78tCKEE7"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000f01c32b99$3d65fab0$8c01a8c0@percipia.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Sundaram Ramasamy <sun@percipia.com>
Cc: netfilter@lists.netfilter.org


--=-Fk2MLzKC3BhJ78tCKEE7
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2003-06-06 at 01:02, Sundaram Ramasamy wrote:

    Hi,
    
    
    
    I have Linux machine with single Network interface. I want to block all the
    tcp,udp and icmp port's other then 22,23,24 and 80.
    
    
    
    Can you verify the following script?
    
    
    
    
    
    IPTABLES=/sbin/iptables
    
    
    
    $IPTABLES -P INPUT DROP
    $IPTABLES -P OUTPUT DROP
    $IPTABLES -P FORWARD DROP
    
    $IPTABLES -A INPUT -p tcp -m multiport --destination-port 22,23,24,80 -j
    ACCEPT
    
    
    
    $IPTABLES -A INPUT -p udp -m multiport --destination-port 22,23,24,80 -j
    ACCEPT
    
    
    
    
    
    What port should I block for icmp protocol?
    
    
    
    -SR
    
    	You have to add the following rules to enable the communication.
    

$IPTABLES -A OUTPUT -p tcp -m multiport --source-port 22,23,24,80 -j
ACCEPT
$IPTABLES -A OUTPUT -p udp -m multiport --source-port 22,23,24,80 -j
ACCEPT


-- 
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-Fk2MLzKC3BhJ78tCKEE7
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Fri, 2003-06-06 at 01:02, Sundaram Ramasamy wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>Hi,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>I have Linux machine with single Network interface. I want to block all the</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>tcp,udp and icmp port's other then 22,23,24 and 80.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Can you verify the following script?</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>IPTABLES=/sbin/iptables</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -P INPUT DROP</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -P OUTPUT DROP</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -P FORWARD DROP</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p tcp -m multiport --destination-port 22,23,24,80 -j</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p udp -m multiport --destination-port 22,23,24,80 -j</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>What port should I block for icmp protocol?</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>-SR</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT SIZE="3">	You have to add the following rules to enable the communication.</FONT>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">$IPTABLES -A OUTPUT -p tcp -m multiport --source-port 22,23,24,80 -j ACCEPT</FONT>
<BR>
<FONT SIZE="3">$IPTABLES -A OUTPUT -p udp -m multiport --source-port 22,23,24,80 -j ACCEPT</FONT>
<BR>
<FONT SIZE="3"></FONT>
<BR>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-Fk2MLzKC3BhJ78tCKEE7--


