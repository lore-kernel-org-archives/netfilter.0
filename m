From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Any holes in this firewall script?
Date: 05 Jun 2003 10:12:21 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054788173.1063.3.camel@india>
References: <20030603180849.B2402@gateway.junsun.net>
	<1054702862.2273.6.camel@india> <20030603220551.A2672@gateway.junsun.net>
	<1054705385.3434.0.camel@india>  <20030604081501.A3411@gateway.junsun.net>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-qfivgGiAp1JEGpnqOYqB"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030604081501.A3411@gateway.junsun.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jun Sun <jsun@junsun.net>
Cc: netfilter@lists.netfilter.org


--=-qfivgGiAp1JEGpnqOYqB
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Jun,
What about the destination ips? These rules will allow from interal to
any of the destination and external to any of the internal ips which is
ofcourse dangerous. So I do suggest you to defie the rules for the
destinations also(-d).  And do not allow all the protocals. 

Regards
Dharmendra T.
On Wed, 2003-06-04 at 20:45, Jun Sun wrote:

    On Wed, Jun 04, 2003 at 11:12:37AM +0530, Dharmendra.T wrote:
    > Yes, but after that you are allowing everything from all the
    > interfaces.  Which is not recommended to do so.
    >
    
    Eh?  Which rules allow everything from all interfaces?
    
    I have the following, which only allow all packets with the right
    IP address range from internal interface and lo:
    
    $IPTABLES -A INPUT -p ALL -i $INTIF -s $INTLAN -j ACCEPT
    $IPTABLES -A INPUT -p ALL -i $LOIF -s $LOIP -j ACCEPT
    $IPTABLES -A INPUT -p ALL -i $LOIF -s $INTIP -j ACCEPT
    $IPTABLES -A INPUT -p ALL -i $LOIF -s $EXTIP -j ACCEPT
    
    Jun

-- 
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-qfivgGiAp1JEGpnqOYqB
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
Hi Jun,
<BR>
What about the destination ips? These rules will allow from interal to any of the destination and external to any of the internal ips which is ofcourse dangerous. So I do suggest you to defie the rules for the destinations also(-d).&nbsp; And do not allow all the protocals. 
<BR>

<BR>
Regards
<BR>
Dharmendra T.
<BR>
On Wed, 2003-06-04 at 20:45, Jun Sun wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>On Wed, Jun 04, 2003 at 11:12:37AM +0530, Dharmendra.T wrote:</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Yes, but after that you are allowing everything from all the</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; interfaces.  Which is not recommended to do so.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Eh?  Which rules allow everything from all interfaces?</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>I have the following, which only allow all packets with the right</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>IP address range from internal interface and lo:</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p ALL -i $INTIF -s $INTLAN -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p ALL -i $LOIF -s $LOIP -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p ALL -i $LOIF -s $INTIP -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p ALL -i $LOIF -s $EXTIP -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Jun</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
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

--=-qfivgGiAp1JEGpnqOYqB--


