From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: MS Messenger
Date: Tue, 12 Nov 2002 23:17:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608FD77706@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C28A99.449DECA8"
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
To: Aaron Clausen <maureen-taocow@alberni.net>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C28A99.449DECA8
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Aaron Clausen [mailto:maureen-taocow@alberni.net] wrote:
>
>I'm running iptables, and have a user claiming that they cannot use MS
>Messenger.  I have no other complaints, but I'm not exactly sure if any
>other users are actually using MS Messenger?  Does there have to be =
special
>connection tracking.
>

Hi Aaron,

You need a connection tracking helper module if you want to do
file transfers, as these open random ports. That module has not been
written yet for netfilter/iptables.

>
>I'm also blocking the MS file sharing ports at the router.  Would this =
cause
>the problem?
>

Well, if you block tcp port 1863, or if you block access to the MSN
login servers, your clients won't be able to sign in. 1863 Is the port
were everything except file transfers happen, AFAIK.

Regards,
Filip





------_=_NextPart_001_01C28A99.449DECA8
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
<TITLE>RE: MS Messenger</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Aaron Clausen [<A =
HREF=3D"mailto:maureen-taocow@alberni.net">mailto:maureen-taocow@alberni.=
net</A>] wrote:<BR>
&gt;<BR>
&gt;I'm running iptables, and have a user claiming that they cannot use =
MS<BR>
&gt;Messenger.&nbsp; I have no other complaints, but I'm not exactly =
sure if any<BR>
&gt;other users are actually using MS Messenger?&nbsp; Does there have =
to be special<BR>
&gt;connection tracking.<BR>
&gt;<BR>
<BR>
Hi Aaron,<BR>
<BR>
You need a connection tracking helper module if you want to do<BR>
file transfers, as these open random ports. That module has not been<BR>
written yet for netfilter/iptables.<BR>
<BR>
&gt;<BR>
&gt;I'm also blocking the MS file sharing ports at the router.&nbsp; =
Would this cause<BR>
&gt;the problem?<BR>
&gt;<BR>
<BR>
Well, if you block tcp port 1863, or if you block access to the MSN<BR>
login servers, your clients won't be able to sign in. 1863 Is the =
port<BR>
were everything except file transfers happen, AFAIK.<BR>
<BR>
Regards,<BR>
Filip<BR>
<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C28A99.449DECA8--

