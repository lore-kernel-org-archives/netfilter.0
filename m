From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: problems with multiple pptp connections behind iptables to remote vpn servers
Date: Thu, 6 Jun 2002 00:01:00 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615D93@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C20CDC.7A7A0880"
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Hue Truong <HueT@CarParts.com>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C20CDC.7A7A0880
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hue Truong [mailto:HueT@CarParts.com] wrote:
>
>I am having problems with multiple Microsoft users using Microsoft =
pptp/vpn
>clients connecting to external vpn servers. The clients are behind =
iptables
>and only one client is able to make one connection, when two or more =
tries
>to connect, it fails.=20

Hi,

You need the pptp/gre nat/conntrack module. It's currently in=20
CVS (patch-o-matic) and will be in iptables 1.2.7 if you don't
want to compile from CVS.

Regards,
Filip



------_=_NextPart_001_01C20CDC.7A7A0880
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.5762.3">
<TITLE>RE: problems with multiple pptp connections behind iptables to =
remote vpn servers</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Hue Truong [<A =
HREF=3D"mailto:HueT@CarParts.com">mailto:HueT@CarParts.com</A>] =
wrote:<BR>
&gt;<BR>
&gt;I am having problems with multiple Microsoft users using Microsoft =
pptp/vpn<BR>
&gt;clients connecting to external vpn servers. The clients are behind =
iptables<BR>
&gt;and only one client is able to make one connection, when two or more =
tries<BR>
&gt;to connect, it fails.<BR>
<BR>
Hi,<BR>
<BR>
You need the pptp/gre nat/conntrack module. It's currently in<BR>
CVS (patch-o-matic) and will be in iptables 1.2.7 if you don't<BR>
want to compile from CVS.<BR>
<BR>
Regards,<BR>
Filip<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C20CDC.7A7A0880--

