From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: AW: natting help needed urgently.
Date: 08 Sep 2003 11:01:44 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062999111.960.11.camel@india.nsecure.net>
References: <65F646CE24EBF24AA3714070D537988E06FA62@gargoyle.seaan.net>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-dSbgEdW0qZWwpzqAMCWl"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <65F646CE24EBF24AA3714070D537988E06FA62@gargoyle.seaan.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: mailinglists <mailinglists@belfin.ch>
Cc: Payal Rathod <payal-iptables@staticky.com>, netfilter@lists.netfilter.org


--=-dSbgEdW0qZWwpzqAMCWl
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

But it is not recommended to route the packets from external to internal
servers. There are chances that the attacker gets the details on the
internal network which most admins don't want to do. 

-- 
Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Administrator.

On Sat, 2003-09-06 at 17:27, mailinglists wrote:

    Hi Payal,
    
    just a quick one before I go home again.
    
    In this scenario I woudln't use NAT on the Linux box. Makes things more difficult. Don't forget to set a route on your router with gw linuxbox to subnet windowsbox. 
    
    HTH
    Philipp
    
    > I have asked this before but nobody responded. Is this un-do-able?
    > I have a windows box which is on intertnal ip 192.168.10.3. I want the
    > outside world to access the servers (ftp, http, smtp, pop3) from it.
    > The scene is something like this,
    > 
    > 
    > +----------+       +--------------+         +---------------+
    > |          +---><--+ Linux        +---->--<-+win2k          |
    > |router    |       |  (1.2.3.4)   |         | (192.168.10.3)|
    > +----------+       +--------------+         +---------------+
    >                                   
    > I am not able to redirect any request for windows box from 
    > outside world
    > to internal machine 192.168.10.3
    > 
    > Please help me to solve this problem.
    > 
    > Waiting eagerly for any help on this.
    > 
    > With warm regards,
    > -Payal
    > 
    > -- 
    > "Visit GNU/Linux Success Stories"
    > http://payal.staticky.com
    > Guest-Book Section Updated.
    > 
    > 
    



--=-dSbgEdW0qZWwpzqAMCWl
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
But it is not recommended to route the packets from external to internal servers. There are chances that the attacker gets the details on the internal network which most admins don't want to do. 
<BR>

<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Administrator.</PRE>
</TD>
</TR>
</TABLE>

<BR>

<BR>
On Sat, 2003-09-06 at 17:27, mailinglists wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>Hi Payal,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>just a quick one before I go home again.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>In this scenario I woudln't use NAT on the Linux box. Makes things more difficult. Don't forget to set a route on your router with gw linuxbox to subnet windowsbox. </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>HTH</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Philipp</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; I have asked this before but nobody responded. Is this un-do-able?</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; I have a windows box which is on intertnal ip 192.168.10.3. I want the</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; outside world to access the servers (ftp, http, smtp, pop3) from it.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; The scene is something like this,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; +----------+       +--------------+         +---------------+</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; |          +---&gt;&lt;--+ Linux        +----&gt;--&lt;-+win2k          |</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; |router    |       |  (1.2.3.4)   |         | (192.168.10.3)|</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; +----------+       +--------------+         +---------------+</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt;                                   </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; I am not able to redirect any request for windows box from </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; outside world</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; to internal machine 192.168.10.3</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Please help me to solve this problem.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Waiting eagerly for any help on this.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; With warm regards,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; -Payal</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; -- </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; &quot;Visit GNU/Linux Success Stories&quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; http://payal.staticky.com</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Guest-Book Section Updated.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE></PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-dSbgEdW0qZWwpzqAMCWl--


