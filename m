From: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>
Subject: RE: Stopping greedy http clients!
Date: Tue, 24 Sep 2002 15:15:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B3210198A0@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C263CC.7B68D020"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C263CC.7B68D020
Content-Type: text/plain;
	charset="iso-8859-1"

> > Is there a way to set a "speed limit" on tcp port 80 

> I would take a look at iplimit from patch-o-matic, which 
> "allows you to
> restrict the number of parallel TCP connections to a server 
> per client IP
> address (or address block)". It will not block the access to 

Or use something (not netfilter related) like CBQ or HTB which implement
bandwidth throttling.
I found CBQ more difficult to setup than HTB, but the choice is yours.


Rob

------_=_NextPart_001_01C263CC.7B68D020
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<META NAME="Generator" CONTENT="MS Exchange Server version 5.5.2653.12">
<TITLE>RE: Stopping greedy http clients!</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=2>&gt; &gt; Is there a way to set a &quot;speed limit&quot; on tcp port 80 </FONT>
</P>

<P><FONT SIZE=2>&gt; I would take a look at iplimit from patch-o-matic, which </FONT>
<BR><FONT SIZE=2>&gt; &quot;allows you to</FONT>
<BR><FONT SIZE=2>&gt; restrict the number of parallel TCP connections to a server </FONT>
<BR><FONT SIZE=2>&gt; per client IP</FONT>
<BR><FONT SIZE=2>&gt; address (or address block)&quot;. It will not block the access to </FONT>
</P>

<P><FONT SIZE=2>Or use something (not netfilter related) like CBQ or HTB which implement bandwidth throttling.</FONT>
<BR><FONT SIZE=2>I found CBQ more difficult to setup than HTB, but the choice is yours.</FONT>
</P>
<BR>

<P><FONT SIZE=2>Rob</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C263CC.7B68D020--

