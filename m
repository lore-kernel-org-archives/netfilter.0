From: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>
Subject: RE: Qos using htb and transparent squid proxy
Date: Wed, 29 Jan 2003 11:02:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321685F37@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2C77D.7C27FCB0"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2C77D.7C27FCB0
Content-Type: text/plain

> ip basis while going through the transparent proxy. I think 
> the proxy is doing all the downloading (as it should be) and 
> therefore does not obey the bandwidth limits imposed on the 
> requesting user.

But in squid you should be able to throttle the bandwidth when you use delay
pools.


Rob

------_=_NextPart_001_01C2C77D.7C27FCB0
Content-Type: text/html

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=us-ascii">
<META NAME="Generator" CONTENT="MS Exchange Server version 5.5.2653.12">
<TITLE>RE: Qos using htb and transparent squid proxy</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=2>&gt; ip basis while going through the transparent proxy. I think </FONT>
<BR><FONT SIZE=2>&gt; the proxy is doing all the downloading (as it should be) and </FONT>
<BR><FONT SIZE=2>&gt; therefore does not obey the bandwidth limits imposed on the </FONT>
<BR><FONT SIZE=2>&gt; requesting user.</FONT>
</P>

<P><FONT SIZE=2>But in squid you should be able to throttle the bandwidth when you use delay pools.</FONT>
</P>
<BR>

<P><FONT SIZE=2>Rob</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2C77D.7C27FCB0--

