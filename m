From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: A problem in configuring a firewall system
Date: 08 Sep 2003 11:15:05 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062999914.960.22.camel@india.nsecure.net>
References: <20030902115159.79965.qmail@web10701.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-0wOA1sScp0IiH9u+ZBLX"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030902115159.79965.qmail@web10701.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: shiva vafadar <sh_vafadar@yahoo.com>
Cc: netfilter@lists.netfilter.org


--=-0wOA1sScp0IiH9u+ZBLX
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2003-09-02 at 17:21, shiva vafadar wrote:

    Dear all
     
    I have a problem in configuring my firewall system.
    My Linux system has two Net cards and there are two interfaces in
    it. eth0 and eth1.
    I want to forward a incoming request ( from 192.168.1.1) to another
    destination(132.20.48.5). I have added a rule in firewall iptables
    using Nat and prerouting. As a consequence of this rule a recorde is
    added to the log file after requesting, with following informaiton:
    IN=eth0, OUT= eth1, Source=192.168.1.11 and Destination=132.20.48.5.
    I think this is exactly what I want. 
    I used tcp dump and I see that there is a request from 192.168.1.11
    to firewall system on eth0 but there is no request from eth1 to the
    132.20.48.5.
    I conclude that there is somthing wrong in connection between lan
    cards and interfaces, Is it all right? And what should I do to
    bridge this gap?
     
    I approciate your consideration in advance.
     
    Shiva Vafadar
     
     
    
    
    ____________________________________________________________________
    Do you Yahoo!?
    Yahoo! SiteBuilder - Free, easy-to-use web site design software

Hi 

As you are forwarding the packets from internal to external you are
getting the info logged as given. The kind of packet you are expecting
to come will come only if the packet is generated locally on the
firewall machine. So currently you are right.

-- 
Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Admin

--=-0wOA1sScp0IiH9u+ZBLX
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Tue, 2003-09-02 at 17:21, shiva vafadar wrote:
    <BLOCKQUOTE>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>Dear all</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>I have a problem in configuring my firewall system.</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>My Linux system has two Net cards and there are two interfaces in it. eth0 and eth1.</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>I want to forward a incoming request ( from 192.168.1.1)&nbsp;to another destination(132.20.48.5). I have added a rule in firewall iptables using Nat and prerouting. As a consequence of this rule&nbsp;a recorde is added to the log file after requesting, with following informaiton:</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>IN=eth0, OUT= eth1, Source=192.168.1.11 and Destination=132.20.48.5.</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>I think this is exactly what I want. </FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>I used tcp dump and I see that there is a request from 192.168.1.11 to firewall system on eth0 but there is no request from eth1 to the 132.20.48.5.</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>I conclude that there is somthing wrong in connection between lan cards and interfaces, Is it all right? And what should I do to bridge this gap?</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>I approciate your consideration in advance.</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>Shiva Vafadar</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
    <BR>
    
<HR SIZE="1">
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Do you Yahoo!?</FONT></FONT></I>
    <BR>
    <A HREF="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com"><FONT SIZE="3"><I>Yahoo! SiteBuilder</FONT></I></A><FONT COLOR="#73273a"><FONT SIZE="3"><I> - Free, easy-to-use web site design software</FONT></FONT></I>
    </BLOCKQUOTE>
<FONT SIZE="3">Hi </FONT>
<BR>
<FONT SIZE="3"></FONT>
<BR>
<FONT SIZE="3">As you are forwarding the packets from internal to external you are getting the info logged as given. The kind of packet you are expecting to come will come only if the packet is generated locally on the firewall machine. So currently you are right.</FONT>
<BR>
<FONT SIZE="3"></FONT>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Admin</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-0wOA1sScp0IiH9u+ZBLX--


