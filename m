From: "david" <david@aid.inf.cu>
Subject: Re: I need help , please
Date: Thu, 4 Jul 2002 10:38:39 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <002801c22336$32460150$8703000a@aid.inf.cu>
References: <001e01c22321$e86018a0$2400a8c0@inq7.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0024_01C22346.F5A72510"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: "jesse.linux" <jdelima@inq7.net>
Cc: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0024_01C22346.F5A72510
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0025_01C22346.F5A72510"


------=_NextPart_001_0025_01C22346.F5A72510
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It was a mistake.What I do is

# service iptables save
after that  I got a new file in /etc/sysconfig/iptables .
and then :
#/etc/rc.d/init.d/iptables restart 2>salida8
.And here you see all the errors.

david





  ----- Original Message -----=20
  From: jesse.linux=20
  To: david@aid.inf.cu=20
  Sent: Thursday, July 04, 2002 8:13 AM
  Subject: RE: I need help , please


  if u want to use iptables, why did u restart ipchains?...
  =20
  pls give more info...
  =20
  From: "david" <david@aid.inf.cu>
  To: <netfilter@lists.samba.org>
  Subject:  I need help , please
  Date: Wed, 3 Jul 2002 08:47:57 +0200

  This is a multi-part message in MIME format.

  ------=3D_NextPart_000_0053_01C2226E.542764D0
  Content-Type: multipart/alternative;
  boundary=3D"----=3D_NextPart_001_0054_01C2226E.542764D0"


  ------=3D_NextPart_001_0054_01C2226E.542764D0
  Content-Type: text/plain;
  charset=3D"iso-8859-1"
  Content-Transfer-Encoding: quoted-printable

  Hi:
  =3D20
  I have been using ipchains for a long time , but know i want to turn =
to =3D
  iptables.
  I have a script file in /etc/rc.d/init.d/iptables

  What I do is :

  # service iptables save
  =3D20
  after that  I got a new file in /etc/sysconfig/iptables .
  and then :

  #/etc/rc.d/init.d/ipchains restart
  =3D20
  First I got a lot of errrors and  it does not seem to apply my rules, =
=3D
  because if for example ,I comment (#) the rules for http client , it =
=3D
  allow me to get the web anyway.

------=_NextPart_001_0025_01C22346.F5A72510
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2920.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>It was a mistake.What I do =
is</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># service iptables save<BR>after =
that&nbsp; I got a=20
new file in /etc/sysconfig/iptables .<BR>and then=20
:<BR>#/etc/rc.d/init.d/iptables restart 2&gt;salida8<BR></FONT><FONT =
face=3DArial=20
size=3D2>.And here you see all the errors.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>david</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<BLOCKQUOTE=20
style=3D"BORDER-LEFT: #000000 2px solid; MARGIN-LEFT: 5px; MARGIN-RIGHT: =
0px; PADDING-LEFT: 5px; PADDING-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A href=3D"mailto:jdelima@inq7.net" =
title=3Djdelima@inq7.net>jesse.linux</A>=20
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
href=3D"mailto:david@aid.inf.cu"=20
  title=3Ddavid@aid.inf.cu>david@aid.inf.cu</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Thursday, July 04, 2002 =
8:13=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: I need help , =
please</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>if u want to use iptables, why did u =
restart=20
  ipchains?...</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>pls give more info...</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV>From: "david" &lt;<A=20
  href=3D"mailto:david@aid.inf.cu">david@aid.inf.cu</A>&gt;<BR>To: =
&lt;<A=20
  =
href=3D"mailto:netfilter@lists.samba.org">netfilter@lists.samba.org</A>&g=
t;<BR>Subject:&nbsp;=20
  I need help , please<BR>Date: Wed, 3 Jul 2002 08:47:57 =
+0200<BR><BR>This is a=20
  multi-part message in MIME=20
  =
format.<BR><BR>------=3D_NextPart_000_0053_01C2226E.542764D0<BR>Content-T=
ype:=20
  =
multipart/alternative;<BR>boundary=3D"----=3D_NextPart_001_0054_01C2226E.=
542764D0"<BR><BR><BR>------=3D_NextPart_001_0054_01C2226E.542764D0<BR>Con=
tent-Type:=20
  text/plain;<BR>charset=3D"iso-8859-1"<BR>Content-Transfer-Encoding:=20
  quoted-printable<BR><BR>Hi:<BR>=3D20<BR>I have been using ipchains for =
a long=20
  time , but know i want to turn to =3D<BR>iptables.<BR>I have a script =
file in=20
  /etc/rc.d/init.d/iptables<BR><BR>What I do is :<BR><BR># service =
iptables=20
  save<BR>=3D20<BR>after that&nbsp; I got a new file in =
/etc/sysconfig/iptables=20
  .<BR>and then :<BR><BR>#/etc/rc.d/init.d/ipchains =
restart<BR>=3D20<BR>First I=20
  got a lot of errrors and&nbsp; it does not seem to apply my rules,=20
  =3D<BR>because if for example ,I comment (#) the rules for http client =
, it=20
  =3D<BR>allow me to get the web =
anyway.<A></A></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_001_0025_01C22346.F5A72510--

------=_NextPart_000_0024_01C22346.F5A72510
Content-Type: application/octet-stream;
	name="salida8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="salida8"

/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables: No chain/target/match by that name=0A=
iptables v1.2.3: can't initialize iptables table `nat=0D': Table does =
not exist (do you need to insmod?)=0A=
Perhaps iptables or your kernel needs to be upgraded.=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables: Table does not exist (do you need to insmod?)=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables: Bad policy name=0A=
iptables: Bad policy name=0A=
iptables: Bad policy name=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables v1.2.3: Invalid target name `ACCEPT=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
iptables v1.2.3: Invalid target name `ACCEPT=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables v1.2.3: Invalid target name `ACCEPT=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
iptables v1.2.3: Invalid target name `ACCEPT=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: -s: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: -i: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables v1.2.3: Invalid target name `MASQUERADE=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
iptables v1.2.3: Invalid target name `DROP=0D'=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: --source-port: command not found=0A=
/etc/rc.d/init.d/iptables: -d: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=
Try `iptables -h' or 'iptables --help' for more information.=0A=
/etc/rc.d/init.d/iptables: -s: command not found=0A=
/etc/rc.d/init.d/iptables: --destination-port: command not found=0A=
/etc/rc.d/init.d/iptables: =0D: command not found=0A=

------=_NextPart_000_0024_01C22346.F5A72510--


