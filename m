From: "hare ram" <hareram@sol.net.in>
Subject: Re: Problems loading a Patch-O-Matic match
Date: Mon, 17 Mar 2003 20:59:30 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00e401c2ec9a$031dd280$13fcc5cb@Housecall>
References: <001201c2ec8b$f03e01c0$0300000a@juan>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00E1_01C2ECC8.1AF874E0"
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
To: Juan Torres <islero77@telefonica.net>, Netfilter-users <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_00E1_01C2ECC8.1AF874E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Problems loading a Patch-O-Matic matchHi

AFAIK

i have done the following steps, so  its working for me
you can also try

Download P-O-M

extract POM
go to the POM Directory

./runme --batch base/mport.patch

it will patch the kernel

then select option in kernel config mport

and compile the kernel ( see kernel how-to)


good luck
hare
  ----- Original Message -----=20
  From: Juan Torres=20
  To: Netfilter-users=20
  Sent: Monday, March 17, 2003 7:18 PM
  Subject: Problems loading a Patch-O-Matic match




  Hi, I'm trying to load a new match which comes in the Patch-O-Matic =
package. I have run Patch-O-Matic and I have selected the match I'm =
interested in (mport), then I have compiled the new kernel selecting in =
the xconfig the new option. But after all of these steps I can't use the =
new match. I have seen in the documentation that I have to go to the =
userspace/ directory (I suppose that it is the "userspace" directory =
into the Patch-O-Matic package) and execute make all install, but, when =
I do that the response is the next:

  make: *** No rule to make target 'all'. Stop.

  Can anybody tell me what it's my problem?

  Thank you very much.

          Juan.


------=_NextPart_000_00E1_01C2ECC8.1AF874E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Problems loading a Patch-O-Matic match</TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>AFAIK</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>i have done the following steps, =
so&nbsp; its=20
working for me</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>you can also try</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Download P-O-M</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>extract POM</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>go to the POM Directory</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>./runme --batch =
base/mport.patch</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>it will patch the kernel</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>then select option in kernel config=20
mport</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>and compile the kernel ( see kernel=20
how-to)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>good luck</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>hare</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dislero77@telefonica.net =
href=3D"mailto:islero77@telefonica.net">Juan=20
  Torres</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  href=3D"mailto:netfilter@lists.netfilter.org">Netfilter-users</A> =
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Monday, March 17, 2003 =
7:18=20
PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Problems loading a =
Patch-O-Matic=20
  match</DIV>
  <DIV><BR></DIV><!-- Converted from text/rtf format --><BR>
  <P align=3Djustify><SPAN lang=3Den-gb><FONT face=3DArial size=3D2>Hi,=20
  I</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN=20
  lang=3Den-gb><FONT face=3DArial size=3D2>=92</FONT></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Den-gb><FONT face=3DArial size=3D2>m =
trying to load a new=20
  matc</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN=20
  lang=3Den-gb><FONT face=3DArial size=3D2>h</FONT></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Den-gb><FONT face=3DArial size=3D2> which =
comes in the=20
  Patch-O-Matic package.</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Den-gb> <FONT face=3DArial size=3D2>I=20
  ha</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN=20
  lang=3Den-gb><FONT face=3DArial size=3D2>ve</FONT></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Den-gb><FONT face=3DArial size=3D2>=20
  run</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Den-gb>=20
  <FONT face=3DArial size=3D2>Patch-O-Matic and I ha</FONT></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Den-gb><FONT =
face=3DArial=20
  size=3D2>ve</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Den-gb><FONT face=3DArial size=3D2> selected =
the</FONT></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Den-gb><FONT =
face=3DArial size=3D2>=20
  match I</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Den-gb><FONT face=3DArial size=3D2>=92</FONT></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Den-gb><FONT face=3DArial size=3D2>m =
interested=20
  in</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN=20
  lang=3Den-gb><FONT face=3DArial size=3D2> (mport)</FONT></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Den-gb><FONT =
face=3DArial size=3D2>,=20
  then I ha</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Den-gb><FONT face=3DArial size=3D2>ve</FONT></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Den-gb><FONT face=3DArial size=3D2> =
compiled the new=20
  kernel selecting in the xconfig the new option.</FONT></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Den-gb> <FONT =
face=3DArial=20
  size=3D2>But after all of these steps I can</FONT></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Den-gb><FONT =
face=3DArial=20
  size=3D2>=92</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Den-gb><FONT face=3DArial size=3D2>t use the new match. I have =
seen in the=20
  documentation that I ha</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Den-gb><FONT face=3DArial =
size=3D2>ve</FONT></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Den-gb><FONT =
face=3DArial size=3D2>=20
  to</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Den-gb>=20
  <FONT face=3DArial size=3D2>go to the userspace/ =
directory</FONT></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Den-gb><FONT =
face=3DArial size=3D2>=20
  (I</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Den-gb>=20
  <FONT face=3DArial size=3D2>suppose</FONT></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Den-gb><FONT face=3DArial size=3D2> that =
it is=20
  the</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Den-gb>=20
  <FONT face=3DArial size=3D2>=93</FONT></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Den-gb><FONT face=3DArial=20
  size=3D2>userspace</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Den-gb><FONT face=3DArial size=3D2>=94</FONT></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Den-gb><FONT face=3DArial size=3D2> =
directory into the=20
  Patch-O-Matic package)</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Den-gb><FONT face=3DArial size=3D2> and=20
  execute</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Den-gb> <FONT face=3DArial size=3D2>make all install, but, when =
I do that the=20
  response is the next:</FONT></SPAN></P>
  <P align=3Djustify><SPAN lang=3Den-gb><FONT face=3DArial =
size=3D2>make: *** No rule to=20
  make target</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Den-gb> <FONT face=3DArial size=3D2>=91</FONT></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Den-gb><FONT face=3DArial =
size=3D2>all</FONT></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Den-gb><FONT =
face=3DArial=20
  size=3D2>=92</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Den-gb><FONT face=3DArial size=3D2>. Stop.</FONT></SPAN></P>
  <P align=3Djustify><SPAN lang=3Den-gb><FONT face=3DArial size=3D2>Can =
anybody tell me=20
  what</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Den-gb>=20
  <FONT face=3DArial size=3D2>it</FONT></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Den-gb><FONT face=3DArial =
size=3D2>=92</FONT></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Den-gb><FONT =
face=3DArial=20
  size=3D2>s</FONT></SPAN><SPAN lang=3Des></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Den-gb><FONT face=3DArial size=3D2> my =
problem</FONT></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN lang=3Des></SPAN><SPAN lang=3Den-gb><FONT =
face=3DArial=20
  size=3D2>?</FONT></SPAN></P>
  <P align=3Djustify><SPAN lang=3Den-gb><FONT face=3DArial =
size=3D2>Thank you very=20
  much.</FONT></SPAN></P>
  <P align=3Djustify><SPAN =
lang=3Den-gb>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  <FONT face=3DArial size=3D2>Juan.</FONT></SPAN><SPAN =
lang=3Des></SPAN><SPAN=20
  lang=3Des></SPAN><SPAN =
lang=3Den-gb></SPAN></P></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_00E1_01C2ECC8.1AF874E0--


