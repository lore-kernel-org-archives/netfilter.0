From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: ip_tables.o not loading - nf_unregister_sockopt error
Date: 08 Sep 2003 11:36:34 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063001214.960.33.camel@india.nsecure.net>
References: <000501c37184$d6701fc0$7b01a8c0@Doc>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-CHB/honJAwKCfgNCnPKF"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000501c37184$d6701fc0$7b01a8c0@Doc>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Doc Nielsen <WebMaster@DocNielsen.dk>
Cc: netfilter@lists.netfilter.org


--=-CHB/honJAwKCfgNCnPKF
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2003-09-03 at 00:33, Doc Nielsen wrote:

    hey guys
    
    Im having some trouble compiling and using iptables/netfilter
    Its enabled in the kernel, and the modules are there, but when I try to load
    them I get this:
    
    root@server:~# modprobe ip_tables
    /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: unresolved symbol
    nf_unregister_sockopt
    /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: unresolved symbol
    nf_register_sockopt
    /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: insmod
    /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o failed
    /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: insmod ip_tables
    failed
    
    What am I doing wrong?
    
    Please CC mail directly to me, as Im not subscribed to the list.
    And yes, I have browsed the archives with no luck.
    
    - Doc
    
    Could you tell me how you have compiled your kernel?

-- 
Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Admin

--=-CHB/honJAwKCfgNCnPKF
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Wed, 2003-09-03 at 00:33, Doc Nielsen wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>hey guys</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Im having some trouble compiling and using iptables/netfilter</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Its enabled in the kernel, and the modules are there, but when I try to load</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>them I get this:</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>root@server:~# modprobe ip_tables</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: unresolved symbol</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>nf_unregister_sockopt</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: unresolved symbol</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>nf_register_sockopt</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: insmod</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o failed</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: insmod ip_tables</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>failed</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>What am I doing wrong?</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Please CC mail directly to me, as Im not subscribed to the list.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>And yes, I have browsed the archives with no luck.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>- Doc</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT SIZE="3">Could you tell me how you have compiled your kernel?</FONT></PRE>
    </BLOCKQUOTE>
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

--=-CHB/honJAwKCfgNCnPKF--


