From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: h323
Date: Tue, 12 Aug 2003 20:48:34 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDOEEJNFAA.georgev@citadelcomputer.com.au>
References: <3F3800BB.6060603@flashmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0008_01C36113.19090400"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F3800BB.6060603@flashmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: dalive@flashmail.com, netfilter@lists.netfilter.org
Cc: "Morrison, Trevor (Trevor)" <tmorrison@avaya.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0008_01C36113.19090400
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Just use the H323 patch in p-o-m... I use it and it works fine for me..
I don't know what this gatekeeper is.. but it's not needed if you can
successfully patch in the pom module.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of DALive Editor
Sent: Tuesday, August 12, 2003 6:47 AM
To: netfilter@lists.netfilter.org
Cc: Morrison, Trevor (Trevor)
Subject: Re: h323


Hello to this mailinglist,

I'd also really like an awnser to the question bellow about H323, you have
no idea how long I've toiled unsuccessfully. What is this about a patch? And
I've read a little about the gatekeeper, could someone cluse me in further?

Thanks alot - I'd given up hope


Morrison, Trevor (Trevor) wrote:

  Hi,

  I have a RH 9.0 box running iptables-1.2.8 and a 2.4.20 kernel with the
h323 patch applied and recompiled.  My network looks like this:

                                      dhcp from ISP
  Win 2000 box <--------------------------->RH 9.0
Box<---------------------->Internet
  192.168.1.0/24                          NAT       12.207.X.X/32



  I have searched the archives back to September of last year trying to find
what rules I need to apply to my iptables to allow h323 traffic through my
NAT'd box.  I am now more confused then before because the threads mentioned
something about a gatekeeper that I need to run on a NAT box?

  What I am looking for is what are the rules that I need to put into my
filter file and what other programs or procedures do I need to add to that I
have the full features and functionality of Microsoft's Net Meeting from my
Win 2k box.

  Thanks in Advance and sorry for bring this subject up again but I could
not find the information in the previous threads.

  Trevor Morrison

------=_NextPart_000_0008_01C36113.19090400
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE></TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR></HEAD>
<BODY text=3D#000000 bgColor=3D#ffffff>
<DIV><SPAN class=3D728514710-12082003><FONT face=3DArial color=3D#0000ff =
size=3D2>Just=20
use the H323 patch in p-o-m... I use it and it works fine for=20
me..</FONT></SPAN></DIV>
<DIV><SPAN class=3D728514710-12082003><FONT face=3DArial color=3D#0000ff =
size=3D2>I=20
don't know what this gatekeeper is.. but it's not needed if you can =
successfully=20
patch in the pom module.</FONT></SPAN></DIV>
<DIV><SPAN class=3D728514710-12082003></SPAN>&nbsp;</DIV>
<DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
size=3D2>-----Original Message-----<BR><B>From:</B>=20
netfilter-admin@lists.netfilter.org=20
[mailto:netfilter-admin@lists.netfilter.org]<B>On Behalf Of </B>DALive=20
Editor<BR><B>Sent:</B> Tuesday, August 12, 2003 6:47 AM<BR><B>To:</B>=20
netfilter@lists.netfilter.org<BR><B>Cc:</B> Morrison, Trevor=20
(Trevor)<BR><B>Subject:</B> Re: h323<BR><BR></FONT></DIV>Hello to this=20
mailinglist, <BR><BR>I'd also really like an awnser to the question =
bellow about=20
H323, you have no idea how long I've toiled unsuccessfully. What is this =
about a=20
patch? And I've read a little about the gatekeeper, could someone cluse =
me in=20
further? <BR><BR>Thanks alot - I'd given up hope<BR><BR><BR>Morrison, =
Trevor=20
(Trevor) wrote:<BR>
<BLOCKQUOTE=20
cite=3Dmid2C8B3976EDADFD41950F8C628F3E255A06B56626@co9510avexu2.global.av=
aya.com=20
type=3D"cite">
  <META content=3D"MS Exchange Server version 6.0.6389.0" =
name=3DGenerator><!-- Converted from text/rtf format -->
  <P><FONT face=3DArial size=3D2>Hi,</FONT> </P>
  <P><FONT face=3DArial size=3D2>I have a RH 9.0 box running =
iptables-1.2.8 and a=20
  2.4.20 kernel with the h323 patch applied and recompiled.&nbsp; My =
network=20
  looks like this:</FONT></P>
  <P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT face=3DArial=20
  size=3D2>&nbsp;&nbsp;&nbsp; dhcp from ISP</FONT> <BR><FONT =
face=3DArial size=3D2>Win=20
  2000 box &lt;---------------------------&gt;RH 9.0=20
  Box&lt;----------------------&gt;Internet</FONT> <BR><FONT =
face=3DArial=20
  size=3D2>192.168.1.0/24&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  NAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12.207.X.X/32</FONT> </P><BR>
  <P><FONT face=3DArial size=3D2>I have searched the archives back to =
September of=20
  last year trying to find what rules I need to apply to my iptables to =
allow=20
  h323 traffic through my NAT'd box.&nbsp; I am now more confused then =
before=20
  because the threads mentioned something about a gatekeeper that I need =
to run=20
  on a NAT box?</FONT></P>
  <P><FONT face=3DArial size=3D2>What I am looking for is what are the =
rules that I=20
  need to put into my filter file and what other programs or procedures =
do I=20
  need to add to that I have the full features and functionality of =
Microsoft's=20
  Net Meeting from my Win 2k box.&nbsp; </FONT></P>
  <P><FONT face=3DArial size=3D2>Thanks in Advance and sorry for bring =
this subject=20
  up again but I could not find the information in the previous=20
  threads.</FONT></P>
  <P><FONT face=3DArial size=3D2>Trevor Morrison</FONT>=20
</P></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0008_01C36113.19090400--


