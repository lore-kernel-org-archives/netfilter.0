From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: BANDWIDTH MANAGEMENT
Date: 29 Jul 2003 16:03:28 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059474816.3423.0.camel@india>
References: <3F2647E5.8000206@libero.it> 
	<1059474162.16733.26.camel@raylinux.internal>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-SHPaGSgIFnsUXiYwk7kN"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1059474162.16733.26.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-SHPaGSgIFnsUXiYwk7kN
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Is there any gui tool for this?



On Tue, 2003-07-29 at 15:52, Ray Leach wrote:

    On Tue, 2003-07-29 at 12:09, Giulius wrote:
    > Hi list!
    > 
    > I need to find a method to limit my bandwidth, and i would like to know 
    > if exist a module with netfilter that do this.
    > 
    Yes and no.
    
    bandwidth management on Linux is done using tc (traffic control) - part
    of ip route2.
    
    Ther are however modules of P-O-M (netfilter) that can route traffic via
    different interfaces according to netfilter rules. Sort of poor mans
    load balancing.
    
    Have a look at tc and the queuing disciplines (HTB, TBF, SFQ, CBQ, etc).
    
    Ray
    > Tx.
    > Giulius.
    -- 
    --
    Raymond Leach <raymondl@knowledgefactory.co.za>
    Network Support Specialist
    http://www.knowledgefactory.co.za
    "lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
    Key fingerprint = 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
    --

-- 
Regards
Dharmendra.T
dharmu@nsecure.net

This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-SHPaGSgIFnsUXiYwk7kN
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
Is there any gui tool for this?
<BR>

<BR>

<BR>

<BR>
On Tue, 2003-07-29 at 15:52, Ray Leach wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>On Tue, 2003-07-29 at 12:09, Giulius wrote:</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Hi list!</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; I need to find a method to limit my bandwidth, and i would like to know </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; if exist a module with netfilter that do this.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Yes and no.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>bandwidth management on Linux is done using tc (traffic control) - part</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>of ip route2.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Ther are however modules of P-O-M (netfilter) that can route traffic via</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>different interfaces according to netfilter rules. Sort of poor mans</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>load balancing.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Have a look at tc and the queuing disciplines (HTB, TBF, SFQ, CBQ, etc).</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Ray</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Tx.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Giulius.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>-- </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>--</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Raymond Leach &lt;raymondl@knowledgefactory.co.za&gt;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Network Support Specialist</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>http://www.knowledgefactory.co.za</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&quot;lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import&quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Key fingerprint = 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>--</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T
dharmu@nsecure.net

This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-SHPaGSgIFnsUXiYwk7kN--


