From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: load balanced adsl lines
Date: Mon, 5 Jul 2004 10:30:53 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <019c01c46238$181ab2b0$0100a8c0@redtone.com>
References: <01dc01c461b4$f0828670$fe00000a@citadel>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPartTM-000-5682ed8e-13d1-46fa-a098-75583c4947a7"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.


------=_NextPartTM-000-5682ed8e-13d1-46fa-a098-75583c4947a7
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0199_01C4627B.263AE570"

------=_NextPart_000_0199_01C4627B.263AE570
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


I struggled on this for a few months and I finally throw away the=20
"multiple weight" default route method. FWMARK/CONNMARK=20
is the way to go. More information, read this=20

           http://www.geocities.com/mctiew/ffw/dual.htm

You may not want to use it for whatever reason you think
appropriate but please read the 'Introduction' where I=20
explained how I failed badly using that method.


  ----- Original Message -----=20
  From: Mark Coetser=20
  To: netfilter@lists.netfilter.org=20
  Sent: Sunday, July 04, 2004 6:52 PM
  Subject: load balanced adsl lines


  Hi Ppl

  I have 5 adsl lines that after reading quite a bit i managed to get =
load balanced now abvoiusly it doesnt load balance evenly and this works =
on what routes are still in the routing cache. my question is my =
outbound masquerading had to be modified to use snat in iptables instead =
of just plain masquerading my outbound masquerading now works but my =
inbound port forwarding doesnt work would this be an iptables problem or =
a routing issue...

  i have opened all the relavent ports on each of the interfaces and I =
am not getting any logged denies the connection just never opens

  I am running the following

  debian woody

  kernel 2.6.6


------=_NextPart_000_0199_01C4627B.263AE570
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I struggled on this for a few months =
and I finally=20
throw away the </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>"multiple weight" default route method. =

FWMARK/CONNMARK </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>is the way to go. </FONT><FONT =
face=3DArial=20
size=3D2>More information, read this </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A =

href=3D"http://www.geocities.com/mctiew/ffw/dual.htm">http://www.geocitie=
s.com/mctiew/ffw/dual.htm</A></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>You may not want to use it for whatever =
reason you=20
think</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>appropriate but please read the =
'Introduction'=20
where I </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>explained how I failed badly using that =

method.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dmark@thummb.com href=3D"mailto:mark@thummb.com">Mark =
Coetser</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Sunday, July 04, 2004 =
6:52 PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> load balanced adsl =
lines</DIV>
  <DIV><BR></DIV>
  <DIV>
  <DIV><FONT face=3DArial size=3D2>Hi Ppl</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I have 5 adsl lines that after =
reading quite a=20
  bit i managed to get load balanced now abvoiusly it doesnt load =
balance evenly=20
  and this works on what routes are still in the routing cache. my =
question is=20
  my outbound masquerading had to be modified to use snat in iptables =
instead of=20
  just plain masquerading my outbound masquerading now works but my =
inbound port=20
  forwarding doesnt work would this be an iptables problem or a routing=20
  issue...</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>i have opened all the relavent ports =
on each of=20
  the interfaces and I am not getting any logged denies the connection =
just=20
  never opens</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I am running the =
following</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>debian woody</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>kernel 2.6.6</FONT></DIV>
  <DIV><FONT face=3DArial=20
size=3D2></FONT>&nbsp;</DIV></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0199_01C4627B.263AE570--





------=_NextPartTM-000-5682ed8e-13d1-46fa-a098-75583c4947a7
Content-Type: text/plain;
	name="InterScan_SafeStamp.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="InterScan_SafeStamp.txt"

****** Message from InterScan E-Mail VirusWall NT ******

** No virus found in attached file noname.htm
** No virus found in attached file noname.htm

This mail has been scanned by InterScan.
*****************     End of message     ***************


------=_NextPartTM-000-5682ed8e-13d1-46fa-a098-75583c4947a7--

