From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Any holes in this firewall script?
Date: 04 Jun 2003 11:12:37 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054705385.3434.0.camel@india>
References: <20030603180849.B2402@gateway.junsun.net>
	<1054702862.2273.6.camel@india>  <20030603220551.A2672@gateway.junsun.net>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Y+mgLKnbMUCVAQi+laMR"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030603220551.A2672@gateway.junsun.net>
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


--=-Y+mgLKnbMUCVAQi+laMR
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Yes, but after that you are allowing everything from all the
interfaces.  Which is not recommended to do so.

Dharmu
On Wed, 2003-06-04 at 10:35, Jun Sun wrote:

    On Wed, Jun 04, 2003 at 10:30:31AM +0530, Dharmendra.T wrote:
    > hi,
    > 
    >  I just don't see any firewalling (blocking) in the script. You are
    > simply allowing everything. Define clear rule like block all and allow
    > only wanted ports.
    >
    
    The default policy is set to "DROP" for the filter table.
    
    Jun

-- 
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-Y+mgLKnbMUCVAQi+laMR
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
Yes, but after that you are allowing everything from all the interfaces.&nbsp; Which is not recommended to do so.
<BR>

<BR>
Dharmu
<BR>
On Wed, 2003-06-04 at 10:35, Jun Sun wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>On Wed, Jun 04, 2003 at 10:30:31AM +0530, Dharmendra.T wrote:</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; hi,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt;  I just don't see any firewalling (blocking) in the script. You are</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; simply allowing everything. Define clear rule like block all and allow</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; only wanted ports.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>The default policy is set to &quot;DROP&quot; for the filter table.</FONT></FONT></I>
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

--=-Y+mgLKnbMUCVAQi+laMR--


