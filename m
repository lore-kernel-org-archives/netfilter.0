From: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>
Subject: RE: Qos using htb and transparent squid proxy
Date: Wed, 29 Jan 2003 11:33:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321685F3F@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2C781.E3B05D10"
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

------_=_NextPart_001_01C2C781.E3B05D10
Content-Type: text/plain

> > But in squid you should be able to throttle the bandwidth 
> when you use 
> > delay pools.
> 
> Thanks for all the help so far Rob. Yes, delay pools can be 
> used to some extent, but I need to throttle according to the 
> source ip before it gets SNATed, i.e the internal IPs. I need 
> squid to download at the rate that the client is allowed.

If I'm not mistaken you can use acl's with delay pools.
If you put source IP's in an acl, you can do what you want, right ?? Or am I
terribly wrong here..


Gr,
Rob

------_=_NextPart_001_01C2C781.E3B05D10
Content-Type: text/html

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=us-ascii">
<META NAME="Generator" CONTENT="MS Exchange Server version 5.5.2653.12">
<TITLE>RE: Qos using htb and transparent squid proxy</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=2>&gt; &gt; But in squid you should be able to throttle the bandwidth </FONT>
<BR><FONT SIZE=2>&gt; when you use </FONT>
<BR><FONT SIZE=2>&gt; &gt; delay pools.</FONT>
<BR><FONT SIZE=2>&gt; </FONT>
<BR><FONT SIZE=2>&gt; Thanks for all the help so far Rob. Yes, delay pools can be </FONT>
<BR><FONT SIZE=2>&gt; used to some extent, but I need to throttle according to the </FONT>
<BR><FONT SIZE=2>&gt; source ip before it gets SNATed, i.e the internal IPs. I need </FONT>
<BR><FONT SIZE=2>&gt; squid to download at the rate that the client is allowed.</FONT>
</P>

<P><FONT SIZE=2>If I'm not mistaken you can use acl's with delay pools.</FONT>
<BR><FONT SIZE=2>If you put source IP's in an acl, you can do what you want, right ?? Or am I terribly wrong here..</FONT>
</P>
<BR>

<P><FONT SIZE=2>Gr,</FONT>
<BR><FONT SIZE=2>Rob</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2C781.E3B05D10--

