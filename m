From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Bandwidth Monitoring
Date: 04 Sep 2003 12:04:08 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062657272.2760.9.camel@india.nsecure.net>
References: <04a901c36e18$ad2d6650$2a0110ac@SAMHP> 
	<1062401622.8490.22.camel@raylinux.internal>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-8zZmgggOHNQzWxWugjAd"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1062401622.8490.22.camel@raylinux.internal>
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


--=-8zZmgggOHNQzWxWugjAd
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

But to use this we have to install other packages like apache, mysql
etc. Which will not be recommended to do on a firewall machine. If
bwacct can sniff the data from any other machine and give me the
statistics then that works out great for me.


Regards
Dharmendra.T
dharmu@nsecure.net




On Mon, 2003-09-01 at 13:03, Ray Leach wrote:

    On Fri, 2003-08-29 at 12:31, Sathi wrote:
    > Hello All,
    > 
    > Is there any way to findout the bandwidth used by a client(LAN user), from
    > Linux gateway server.
    > 
    Have a look at bwacct. It's real easy to setup and works well.
    www.bwacct.org
    
    > I have to take monthly statistics of bandwidth used by a client (LAN user).
    > 
    > FYI i am using CBQ for bandwidth control
    > 
    > Regards
    > Sathi
    -- 
    --
    Raymond Leach <raymondl@knowledgefactory.co.za>
    Network Support Specialist
    http://www.knowledgefactory.co.za
    "lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
    Key fingerprint = 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
    --

-- 
This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-8zZmgggOHNQzWxWugjAd
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
Hi,
<BR>

<BR>
But to use this we have to install other packages like apache, mysql etc. Which will not be recommended to do on a firewall machine. If bwacct can sniff the data from any other machine and give me the statistics then that works out great for me.
<BR>

<PRE>Regards
Dharmendra.T
dharmu@nsecure.net
</PRE>

<BR>

<BR>
On Mon, 2003-09-01 at 13:03, Ray Leach wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>On Fri, 2003-08-29 at 12:31, Sathi wrote:</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Hello All,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Is there any way to findout the bandwidth used by a client(LAN user), from</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Linux gateway server.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Have a look at bwacct. It's real easy to setup and works well.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>www.bwacct.org</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; I have to take monthly statistics of bandwidth used by a client (LAN user).</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; FYI i am using CBQ for bandwidth control</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Regards</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Sathi</FONT></FONT></I>
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
This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-8zZmgggOHNQzWxWugjAd--


