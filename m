From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: from iptable user
Date: Thu, 20 Feb 2003 13:58:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608FD77845@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2D8DF.BA0A41FA"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: nikita <admin@getsense.net>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C2D8DF.BA0A41FA
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

>Hello,
>My name is Nikita
>I have made the following command
>
>iptable -A FORWARD -m mac -mac-source 00:C0:DF:10:4D:99 -j REJECT
>
>and=20
>
>i have been answered the following
>
>
>Couldn't load match ac-source:
>/lib/iptables/libipt_ac-source.so ....
>
>Please,
>What shell i do in that case?
>
You need to use two dashes '--', not one, like this: "--mac-source"

Regards,
Filip




------_=_NextPart_001_01C2D8DF.BA0A41FA
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6249.1">
<TITLE>RE: from iptable user</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Hi,<BR>
<BR>
&gt;Hello,<BR>
&gt;My name is Nikita<BR>
&gt;I have made the following command<BR>
&gt;<BR>
&gt;iptable -A FORWARD -m mac -mac-source 00:C0:DF:10:4D:99 -j =
REJECT<BR>
&gt;<BR>
&gt;and<BR>
&gt;<BR>
&gt;i have been answered the following<BR>
&gt;<BR>
&gt;<BR>
&gt;Couldn't load match ac-source:<BR>
&gt;/lib/iptables/libipt_ac-source.so ....<BR>
&gt;<BR>
&gt;Please,<BR>
&gt;What shell i do in that case?<BR>
&gt;<BR>
You need to use two dashes '--', not one, like this: =
&quot;--mac-source&quot;<BR>
<BR>
Regards,<BR>
Filip<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2D8DF.BA0A41FA--

