From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: tftp conntrack
Date: Mon, 10 Jun 2002 15:22:35 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615DA7@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C21081.E282C620"
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
To: Skull <skull@skullkrusher.net>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C21081.E282C620
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Skull [mailto:skull@skullkrusher.net] wrote:

>Hi all,
>I've just downloaded the tftp-conntrack patch, but seems i'm not good=20
>enough to let it patch correctly for me... :-)
>Is there anybody who already correctly applied it and could tell me =
what=20
>to put care on?

Hi Emanuele,

the tftp conntracker, like all conntrackers nowadays requires that
the kernel is patched for newnat support.

Did you apply the necessary patch(es) for newnat before applying the
tftp connectrack helper ?

Kind regards,
Filip






------_=_NextPart_001_01C21081.E282C620
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
<TITLE>RE: tftp conntrack</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Skull [<A =
HREF=3D"mailto:skull@skullkrusher.net">mailto:skull@skullkrusher.net</A>]=
 wrote:<BR>
<BR>
&gt;Hi all,<BR>
&gt;I've just downloaded the tftp-conntrack patch, but seems i'm not =
good<BR>
&gt;enough to let it patch correctly for me... :-)<BR>
&gt;Is there anybody who already correctly applied it and could tell me =
what<BR>
&gt;to put care on?<BR>
<BR>
Hi Emanuele,<BR>
<BR>
the tftp conntracker, like all conntrackers nowadays requires that<BR>
the kernel is patched for newnat support.<BR>
<BR>
Did you apply the necessary patch(es) for newnat before applying the<BR>
tftp connectrack helper ?<BR>
<BR>
Kind regards,<BR>
Filip<BR>
<BR>
<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C21081.E282C620--

