From: Ben Russo <ben@umialumni.com>
Subject: Re: Link redundance question
Date: 10 Nov 2002 20:40:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036978816.1246.6.camel@athlon.home.foo>
References: <F91A4h4dMDbl71Ri4wX0000614a@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-d+tiQISlnAV2+Y09XWsw"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F91A4h4dMDbl71Ri4wX0000614a@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Andrew Magnus <xanadian9@hotmail.com>
Cc: netfilter@lists.netfilter.org


--=-d+tiQISlnAV2+Y09XWsw
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


> What I'm trying to do is this:  if the high speed connection goes down
(which it seems to do 
> frequently :-P ) I want iptables to default to the dialup connection. 
And vice versa (I have 
> iptables set up to use a particular link for a particular service). 
Is this possible?  And if it is 
> possible, how do I do it/where do I look to learn/etc.  Thanks.

Let's say that your internal interface is eth0, your WAN is eth1, and
your modem is ppp0
You can set up your iptables rules so that instead of referring to "-i
eth1" or "-i ppp0"
they refer to "-i ! eth0"

As far as changing your routes, that is not up to iptables, that is up
to the way that you 
programatically determine if the WAN interface is up.

-Ben.

--=-d+tiQISlnAV2+Y09XWsw
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>

<BR>
&gt; What I'm trying to do is this:&nbsp; if the high speed connection goes down (which it seems to do 
<BR>
&gt; frequently :-P ) I want iptables to default to the dialup connection.&nbsp; And vice versa (I have 
<BR>
&gt; iptables set up to use a particular link for a particular service).&nbsp; Is this possible?&nbsp; And if it is 
<BR>
&gt; possible, how do I do it/where do I look to learn/etc.&nbsp; Thanks.
<BR>

<BR>
Let's say that your internal interface is eth0, your WAN is eth1, and your modem is ppp0
<BR>
You can set up your iptables rules so that instead of referring to &quot;-i eth1&quot; or &quot;-i ppp0&quot;
<BR>
they refer to &quot;-i ! eth0&quot;
<BR>

<BR>
As far as changing your routes, that is not up to iptables, that is up to the way that you 
<BR>
programatically determine if the WAN interface is up.
<BR>

<BR>
-Ben.
</BODY>
</HTML>

--=-d+tiQISlnAV2+Y09XWsw--

