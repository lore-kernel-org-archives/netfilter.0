From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: stupid redirect question
Date: 08 Sep 2003 11:05:46 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062999357.960.16.camel@india.nsecure.net>
References: <GKEILLINGDHHPJJGKJDIEEBCCBAA.jeremy@slicenet.net>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-k5SF54qtQvT6V8RxK52l"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <GKEILLINGDHHPJJGKJDIEEBCCBAA.jeremy@slicenet.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jeremy Davis <jeremy@slicenet.net>
Cc: Netfilter List <netfilter@lists.netfilter.org>


--=-k5SF54qtQvT6V8RxK52l
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2003-09-06 at 12:40, Jeremy Davis wrote:

    Ok my problem is when I add a port redirection in the prerouting chain so
    that port 80 traffic goes to a certain box.  I used this rule
    
    iptables -t nat -I PREROUTING -i ppp0 -p tcp --dport 80 -j DNAT --to
    192.168.0.5:80
    
    but this kills all lan http traffic from getting back in to the
    workstations.  What am I missing?
    
    Jeremy
    
    This says that all the traffic coming to ppp0 detsined to port 80( as you have not specifed the destination ip) will be redirected to 192.168.0.5 on port 80. 

So make sure that this what you wanted. Else give destination ip with
the above rule.

Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Administrator.

    
    
    Here is my nat table
    
    Chain PREROUTING (policy ACCEPT 11624 packets, 749K bytes)
     pkts bytes target     prot opt in     out     source
    destination
        0     0 DNAT       tcp  --  any    any     anywhere             anywhere
    tcp dpt:dnsix to:192.168.0.5:80
        0     0 DNAT       tcp  --  any    any     anywhere             anywhere
    tcp dpt:cadlock to:192.168.0.5:1000
        2   120 DNAT       tcp  --  ppp0   any     anywhere             anywhere
    tcp dpt:ftp to:192.168.0.5:21
        3   144 DNAT       tcp  --  any    any     anywhere             anywhere
    tcp dpt:telnet to:192.168.0.5:23
    
    Chain POSTROUTING (policy ACCEPT 12 packets, 780 bytes)
     pkts bytes target     prot opt in     out     source
    destination
     9770  490K MASQUERADE  all  --  any    ppp0    anywhere
    anywhere
    
    Chain OUTPUT (policy ACCEPT 43 packets, 2737 bytes)
     pkts bytes target     prot opt in     out     source
    destination
    
    
    
    Here is my filter table
    
    Chain INPUT (policy ACCEPT 5427 packets, 393K bytes)
     pkts bytes target     prot opt in     out     source
    destination
      823 75341 ACCEPT     icmp --  ppp0   any     anywhere             anywhere
      423 52420 ACCEPT     all  --  ppp0   any     anywhere             anywhere
    state RELATED,ESTABLISHED
        0     0 ACCEPT     tcp  --  ppp0   any     anywhere             anywhere
    tcp dpt:ssh
      348 59851 LOG        all  --  ppp0   any     anywhere             anywhere
    LOG level warning
      348 59851 REJECT     all  --  ppp0   any     anywhere             anywhere
    reject-with icmp-port-unreachable
    
    Chain FORWARD (policy DROP 80 packets, 3840 bytes)
     pkts bytes target     prot opt in     out     source
    destination
        0     0 ACCEPT     tcp  --  ppp0   eth1    anywhere             anywhere
    tcp dpt:cadlock
        0     0 ACCEPT     tcp  --  ppp0   eth1    anywhere             anywhere
    tcp dpt:http
       18  1001 ACCEPT     tcp  --  ppp0   eth1    anywhere             anywhere
    tcp dpt:ftp
     3444  140K ACCEPT     tcp  --  ppp0   eth1    anywhere             anywhere
    tcp dpt:telnet
     113K   19M ACCEPT     all  --  eth1   ppp0    anywhere             anywhere
     126K   94M ACCEPT     all  --  ppp0   eth1    anywhere             anywhere
    state RELATED,ESTABLISHED
    
    

-- 


--=-k5SF54qtQvT6V8RxK52l
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Sat, 2003-09-06 at 12:40, Jeremy Davis wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>Ok my problem is when I add a port redirection in the prerouting chain so</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>that port 80 traffic goes to a certain box.  I used this rule</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>iptables -t nat -I PREROUTING -i ppp0 -p tcp --dport 80 -j DNAT --to</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>192.168.0.5:80</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>but this kills all lan http traffic from getting back in to the</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>workstations.  What am I missing?</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Jeremy</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT SIZE="3">This says that all the traffic coming to ppp0 detsined to port 80( as you have not specifed the destination ip) will be redirected to 192.168.0.5 on port 80. </FONT></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">So make sure that this what you wanted. Else give destination ip with the above rule.</FONT>
<BR>
<FONT SIZE="3"></FONT>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Administrator.</PRE>
</TD>
</TR>
</TABLE>

    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Here is my nat table</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Chain PREROUTING (policy ACCEPT 11624 packets, 749K bytes)</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I> pkts bytes target     prot opt in     out     source</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>destination</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>    0     0 DNAT       tcp  --  any    any     anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>tcp dpt:dnsix to:192.168.0.5:80</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>    0     0 DNAT       tcp  --  any    any     anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>tcp dpt:cadlock to:192.168.0.5:1000</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>    2   120 DNAT       tcp  --  ppp0   any     anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>tcp dpt:ftp to:192.168.0.5:21</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>    3   144 DNAT       tcp  --  any    any     anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>tcp dpt:telnet to:192.168.0.5:23</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Chain POSTROUTING (policy ACCEPT 12 packets, 780 bytes)</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I> pkts bytes target     prot opt in     out     source</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>destination</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I> 9770  490K MASQUERADE  all  --  any    ppp0    anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Chain OUTPUT (policy ACCEPT 43 packets, 2737 bytes)</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I> pkts bytes target     prot opt in     out     source</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>destination</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Here is my filter table</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Chain INPUT (policy ACCEPT 5427 packets, 393K bytes)</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I> pkts bytes target     prot opt in     out     source</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>destination</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>  823 75341 ACCEPT     icmp --  ppp0   any     anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>  423 52420 ACCEPT     all  --  ppp0   any     anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>state RELATED,ESTABLISHED</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>    0     0 ACCEPT     tcp  --  ppp0   any     anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>tcp dpt:ssh</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>  348 59851 LOG        all  --  ppp0   any     anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>LOG level warning</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>  348 59851 REJECT     all  --  ppp0   any     anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>reject-with icmp-port-unreachable</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Chain FORWARD (policy DROP 80 packets, 3840 bytes)</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I> pkts bytes target     prot opt in     out     source</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>destination</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>    0     0 ACCEPT     tcp  --  ppp0   eth1    anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>tcp dpt:cadlock</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>    0     0 ACCEPT     tcp  --  ppp0   eth1    anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>tcp dpt:http</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>   18  1001 ACCEPT     tcp  --  ppp0   eth1    anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>tcp dpt:ftp</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I> 3444  140K ACCEPT     tcp  --  ppp0   eth1    anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>tcp dpt:telnet</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I> 113K   19M ACCEPT     all  --  eth1   ppp0    anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I> 126K   94M ACCEPT     all  --  ppp0   eth1    anywhere             anywhere</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>state RELATED,ESTABLISHED</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-k5SF54qtQvT6V8RxK52l--


