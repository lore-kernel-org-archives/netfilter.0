From: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>
Subject: RE: problems filtering ppp devices
Date: Mon, 9 Sep 2002 12:40:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019834@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C257ED.5C985CF0"
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

------_=_NextPart_001_01C257ED.5C985CF0
Content-Type: text/plain;
	charset="iso-8859-1"

> I am encountering some weird stuff while filtering a ppp device.
> It seems like traffic from the ppp device does not enter the
> INPUT or OUTPUT table.  Only when the destination of the traffic

When configuring the kernel (compile your own) you have an option in the
section "Network device support" : PPP Filtering (CONFIG_PPP_FILTER).
The help for this item says that you need this for filtering PPP devices.
Maybe you have to compile your kernel with CONFIG_PPP_FILTER=y.


Rob

------_=_NextPart_001_01C257ED.5C985CF0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2650.12">
<TITLE>RE: problems filtering ppp devices</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; I am encountering some weird stuff while =
filtering a ppp device.</FONT>
<BR><FONT SIZE=3D2>&gt; It seems like traffic from the ppp device does =
not enter the</FONT>
<BR><FONT SIZE=3D2>&gt; INPUT or OUTPUT table.&nbsp; Only when the =
destination of the traffic</FONT>
</P>

<P><FONT SIZE=3D2>When configuring the kernel (compile your own) you =
have an option in the section &quot;Network device support&quot; : PPP =
Filtering (CONFIG_PPP_FILTER).</FONT></P>

<P><FONT SIZE=3D2>The help for this item says that you need this for =
filtering PPP devices.</FONT>
<BR><FONT SIZE=3D2>Maybe you have to compile your kernel with =
CONFIG_PPP_FILTER=3Dy.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Rob</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C257ED.5C985CF0--

