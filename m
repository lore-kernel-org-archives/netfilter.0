From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: neighbour table again
Date: 30 Jul 2003 15:25:52 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059558961.1103.0.camel@india>
References: <20030730083139.96288.qmail@web41903.mail.yahoo.com> 
	<1059557169.17577.2.camel@risingsun.penguindia.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-CE7NKMvWBI5MLLA6yEUu"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1059557169.17577.2.camel@risingsun.penguindia.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: tkvishy@yahoo.com
Cc: "Srikant S. K" <sriks82@yahoo.com>, netfilter@lists.netfilter.org


--=-CE7NKMvWBI5MLLA6yEUu
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Have you tried enabling port forwarding first and then adding the rules?

Regards
Dharmendra T.

On Wed, 2003-07-30 at 14:56, Vishwanatn T. K. wrote:

    Hey buddy,
    
    I am facing similar problem, and still searching out for a suitable
    solution.
    
    On Wed, 2003-07-30 at 14:01, Srikant S. K wrote:
    > Hi all,
    > 
    > I know that this question has been asked several times
    > and I have gone through the archieves before posting
    > it here unsuccessfully.
    > 
    > I have two NIC's one having public IP and the other
    > private IP.
    > 
    > eth0: 202.x.y.z
    > eth1: 10.0.0.1
    > 
    > System Environments:
    > Linux OS - 2.4.20
    > iptables - 1.2.8
    > 
    > The problem is that the moment I enable ip_forward,
    > the "Neighbour Table Overflow" starts and the same
    > stops when I disable ip_forward.
    > 
    > I am also running my mail server on 10.0.0.2. I have
    > setup port forwarding on my Linux gatewat and this
    > works fine the moment ip_forward is enabled.
    > 
    > I have checked my localhost settings as suggested by
    > many and is fine.
    > 
    > I have also tried using older kernel (2.4.14) along
    > with arpd but the problem still exists.
    > 
    > Any help will be a greate help.
    > 
    > Thanks in advance for any help
    > 
    > Regards,
    > 
    > Srikanth
    > 
    > __________________________________
    > Do you Yahoo!?
    > The New Yahoo! Search - Faster. Easier. Bingo.
    > http://search.yahoo.com
    
    

-- 
Regards
Dharmendra.T
dharmu@nsecure.net

This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-CE7NKMvWBI5MLLA6yEUu
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
Have you tried enabling port forwarding first and then adding the rules?
<BR>

<BR>
Regards
<BR>
Dharmendra T.
<BR>

<BR>
On Wed, 2003-07-30 at 14:56, Vishwanatn T. K. wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>Hey buddy,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>I am facing similar problem, and still searching out for a suitable</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>solution.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>On Wed, 2003-07-30 at 14:01, Srikant S. K wrote:</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Hi all,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; I know that this question has been asked several times</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; and I have gone through the archieves before posting</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; it here unsuccessfully.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; I have two NIC's one having public IP and the other</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; private IP.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; eth0: 202.x.y.z</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; eth1: 10.0.0.1</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; System Environments:</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Linux OS - 2.4.20</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; iptables - 1.2.8</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; The problem is that the moment I enable ip_forward,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; the &quot;Neighbour Table Overflow&quot; starts and the same</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; stops when I disable ip_forward.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; I am also running my mail server on 10.0.0.2. I have</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; setup port forwarding on my Linux gatewat and this</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; works fine the moment ip_forward is enabled.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; I have checked my localhost settings as suggested by</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; many and is fine.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; I have also tried using older kernel (2.4.14) along</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; with arpd but the problem still exists.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Any help will be a greate help.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Thanks in advance for any help</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Regards,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Srikanth</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; __________________________________</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Do you Yahoo!?</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; The New Yahoo! Search - Faster. Easier. Bingo.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; http://search.yahoo.com</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I></PRE>
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

--=-CE7NKMvWBI5MLLA6yEUu--


