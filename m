From: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>
Subject: RE: PPTP+NAT+MASQ anyone?
Date: Mon, 9 Dec 2002 12:57:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B32154A614@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C29F7A.1A3B0FE0"
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
To: 'Roy Sigurd Karlsbakk' <roy@karlsbakk.net>, 'Netfilter mailinglist' <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C29F7A.1A3B0FE0
Content-Type: text/plain

> I've kept trying now. many times, to do NAT+MASQ+PPTP, but as 
> soon as I 
> compile 2.4.18 (the only one I've managed to patch-o-matic) 
> and boot it, it 
> refuses to -j MASQUERADE. (invalid argument). Are anyone running this?

Yup, on my test-box : 2.4.20-rc1 (still, but it's doing nothing at the
moment).
I had no problems patching it however.


Rob

------_=_NextPart_001_01C29F7A.1A3B0FE0
Content-Type: text/html

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=us-ascii">
<META NAME="Generator" CONTENT="MS Exchange Server version 5.5.2653.12">
<TITLE>RE: PPTP+NAT+MASQ anyone?</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=2>&gt; I've kept trying now. many times, to do NAT+MASQ+PPTP, but as </FONT>
<BR><FONT SIZE=2>&gt; soon as I </FONT>
<BR><FONT SIZE=2>&gt; compile 2.4.18 (the only one I've managed to patch-o-matic) </FONT>
<BR><FONT SIZE=2>&gt; and boot it, it </FONT>
<BR><FONT SIZE=2>&gt; refuses to -j MASQUERADE. (invalid argument). Are anyone running this?</FONT>
</P>

<P><FONT SIZE=2>Yup, on my test-box : 2.4.20-rc1 (still, but it's doing nothing at the moment).</FONT>
<BR><FONT SIZE=2>I had no problems patching it however.</FONT>
</P>
<BR>

<P><FONT SIZE=2>Rob</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C29F7A.1A3B0FE0--

