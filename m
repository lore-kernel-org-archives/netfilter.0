From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: Re: h323
Date: Fri, 15 Aug 2003 09:34:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004b01c36332$04c83490$8c01a8c0@RSUNDARAM>
References: <FDEMKKNJDLAJDPNDPCDDOEEJNFAA.georgev@citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0048_01C36310.7B704E10"
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
To: George Vieira <georgev@citadelcomputer.com.au>, dalive@flashmail.com, netfilter@lists.netfilter.org
Cc: "Morrison, Trevor (Trevor)" <tmorrison@avaya.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0048_01C36310.7B704E10
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Can you post your iptables rules for this?
  ----- Original Message -----=20
  From: George Vieira=20
  To: dalive@flashmail.com ; netfilter@lists.netfilter.org=20
  Cc: Morrison, Trevor (Trevor)=20
  Sent: Tuesday, August 12, 2003 6:48 AM
  Subject: RE: h323


  Just use the H323 patch in p-o-m... I use it and it works fine for =
me..
  I don't know what this gatekeeper is.. but it's not needed if you can =
successfully patch in the pom module.

  -----Original Message-----
  From: netfilter-admin@lists.netfilter.org =
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of DALive Editor
  Sent: Tuesday, August 12, 2003 6:47 AM
  To: netfilter@lists.netfilter.org
  Cc: Morrison, Trevor (Trevor)
  Subject: Re: h323


  Hello to this mailinglist,=20

  I'd also really like an awnser to the question bellow about H323, you =
have no idea how long I've toiled unsuccessfully. What is this about a =
patch? And I've read a little about the gatekeeper, could someone cluse =
me in further?=20

  Thanks alot - I'd given up hope


  Morrison, Trevor (Trevor) wrote:

    Hi,=20

    I have a RH 9.0 box running iptables-1.2.8 and a 2.4.20 kernel with =
the h323 patch applied and recompiled.  My network looks like this:

                                        dhcp from ISP=20
    Win 2000 box <--------------------------->RH 9.0 =
Box<---------------------->Internet=20
    192.168.1.0/24                          NAT       12.207.X.X/32=20



    I have searched the archives back to September of last year trying =
to find what rules I need to apply to my iptables to allow h323 traffic =
through my NAT'd box.  I am now more confused then before because the =
threads mentioned something about a gatekeeper that I need to run on a =
NAT box?

    What I am looking for is what are the rules that I need to put into =
my filter file and what other programs or procedures do I need to add to =
that I have the full features and functionality of Microsoft's Net =
Meeting from my Win 2k box. =20

    Thanks in Advance and sorry for bring this subject up again but I =
could not find the information in the previous threads.

    Trevor Morrison=20

------=_NextPart_000_0048_01C36310.7B704E10
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE></TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY text=3D#000000 bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Can you post your iptables rules for=20
this?</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dgeorgev@citadelcomputer.com.au=20
  href=3D"mailto:georgev@citadelcomputer.com.au">George Vieira</A> =
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Ddalive@flashmail.com=20
  href=3D"mailto:dalive@flashmail.com">dalive@flashmail.com</A> ; <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Cc:</B> <A =
title=3Dtmorrison@avaya.com=20
  href=3D"mailto:tmorrison@avaya.com">Morrison, Trevor (Trevor)</A> =
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Tuesday, August 12, 2003 =
6:48=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: h323</DIV>
  <DIV><BR></DIV>
  <DIV><SPAN class=3D728514710-12082003><FONT face=3DArial =
color=3D#0000ff size=3D2>Just=20
  use the H323 patch in p-o-m... I use it and it works fine for=20
  me..</FONT></SPAN></DIV>
  <DIV><SPAN class=3D728514710-12082003><FONT face=3DArial =
color=3D#0000ff size=3D2>I=20
  don't know what this gatekeeper is.. but it's not needed if you can=20
  successfully patch in the pom module.</FONT></SPAN></DIV>
  <DIV><SPAN class=3D728514710-12082003></SPAN>&nbsp;</DIV>
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> <A=20
  =
href=3D"mailto:netfilter-admin@lists.netfilter.org">netfilter-admin@lists=
.netfilter.org</A>=20
  [mailto:netfilter-admin@lists.netfilter.org]<B>On Behalf Of </B>DALive =

  Editor<BR><B>Sent:</B> Tuesday, August 12, 2003 6:47 AM<BR><B>To:</B> =
<A=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A><BR><B>Cc:</B>=20
  Morrison, Trevor (Trevor)<BR><B>Subject:</B> Re:=20
  h323<BR><BR></FONT></DIV>Hello to this mailinglist, <BR><BR>I'd also =
really=20
  like an awnser to the question bellow about H323, you have no idea how =
long=20
  I've toiled unsuccessfully. What is this about a patch? And I've read =
a little=20
  about the gatekeeper, could someone cluse me in further? =
<BR><BR>Thanks alot -=20
  I'd given up hope<BR><BR><BR>Morrison, Trevor (Trevor) wrote:<BR>
  <BLOCKQUOTE=20
  =
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
face=3DArial=20
    size=3D2>Win 2000 box &lt;---------------------------&gt;RH 9.0=20
    Box&lt;----------------------&gt;Internet</FONT> <BR><FONT =
face=3DArial=20
    size=3D2>192.168.1.0/24&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    NAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12.207.X.X/32</FONT> =
</P><BR>
    <P><FONT face=3DArial size=3D2>I have searched the archives back to =
September of=20
    last year trying to find what rules I need to apply to my iptables =
to allow=20
    h323 traffic through my NAT'd box.&nbsp; I am now more confused then =
before=20
    because the threads mentioned something about a gatekeeper that I =
need to=20
    run on a NAT box?</FONT></P>
    <P><FONT face=3DArial size=3D2>What I am looking for is what are the =
rules that=20
    I need to put into my filter file and what other programs or =
procedures do I=20
    need to add to that I have the full features and functionality of=20
    Microsoft's Net Meeting from my Win 2k box.&nbsp; </FONT></P>
    <P><FONT face=3DArial size=3D2>Thanks in Advance and sorry for bring =
this=20
    subject up again but I could not find the information in the =
previous=20
    threads.</FONT></P>
    <P><FONT face=3DArial size=3D2>Trevor Morrison</FONT>=20
</P></BLOCKQUOTE></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0048_01C36310.7B704E10--


