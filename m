From: "Matteo" <matteo@oldamerika.com>
Subject: Re: Info about H.323
Date: Wed, 2 Apr 2003 19:04:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002d01c2f939$f455c8f0$0101a8c0@matteocasa>
References: <008c01c2f89d$f6556260$0101a8c0@matteocasa> <3E8B1297.E9B91696@abc.at>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002A_01C2F94A.B7D23CE0"
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
To: Emanoil Kotsev <emanuel@abc.at>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_002A_01C2F94A.B7D23CE0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

Now I set my firewall so:

DNAT    net    loc:192.168.1.1    udp    1720
DNAT    net    loc:192.168.1.1    udp    5003:5005
DNAT    net    loc:192.168.1.1    udp    30000:30010

but the stream video UDP/RTP Multicast don't work.....

Why ??

Bye

Mat
  ----- Original Message -----=20
  From: Emanoil Kotsev=20
  To: Matteo=20
  Cc: netfilter@lists.netfilter.org=20
  Sent: Wednesday, April 02, 2003 6:40 PM
  Subject: Re: Info about H.323


  Hi,=20
  forgot to tell you in case you don't know, that if your machine is the =
onlyone behind the firewall, you can just forward Port 1720 to the =
Client=20
  Also 30000:30010 and 5003:5005 whould be open accepting =
RELATED,ESTABLISHED traffic=20

  in this case you should be able to receive voice&video to and only to =
your client that you are forwarding to.=20

  good luck=20

  Matteo wrote:=20

     Dear, the patch for Kernel is P-O-M ??? so it is I try install and =
then I tell you if it work... Bye Mat=20
    ----- Original Message -----
    I have the same problem and no time to work on solution.=20
    As far as I know there is a patch for the kernel to add support =
H.323 into iptables.=20
    As I said I don't have anytime to work on a kernel and iptables =
configuration but if you manage to compile and configure H.323 support =
with IPtables me  and my friends are going to be ver thankful if you =
post a mail.=20
    good luck=20

    Matteo wrote:=20

      Hello,I have a server linux with redhat 7.3 and shorewall as =
firewall, now I try to set protocol H.323 becouse I must receive strem =
video in multicast that use H.323....Now infact when I try to connect to =
Strem video I don't see anythings when if I try connect my pc directly =
to modem cable that it support h.323 strem video work at 100%.Now I want =
use firewall in front of my pc and so I must set H.323.... How set it =
??? how set iptable ?? I must use P-O-M ?? If yes, How I use P-O-M ??? =
Thank youMatteo
--=20
+ Emanoil Kotsev - - - - -+
| tel. 0043(1)9253175     |
| cel. --------------     |
+ E-Mail: emanuel@abc.at  +=20
--=20
+ Emanoil Kotsev - - - - -+
| tel. 0043(1)9253175     |
| cel. --------------     |
+ E-Mail: emanuel@abc.at  +  
------=_NextPart_000_002A_01C2F94A.B7D23CE0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR></HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Now I set my firewall so:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>DNAT&nbsp;&nbsp;&nbsp; =
net&nbsp;&nbsp;&nbsp;=20
loc:192.168.1.1&nbsp;&nbsp;&nbsp; udp&nbsp;&nbsp;&nbsp; =
1720</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>DNAT&nbsp;&nbsp;&nbsp; =
net&nbsp;&nbsp;&nbsp;=20
loc:192.168.1.1&nbsp;&nbsp;&nbsp; udp&nbsp;&nbsp;&nbsp; =
5003:5005</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>DNAT&nbsp;&nbsp;&nbsp; =
net&nbsp;&nbsp;&nbsp;=20
loc:192.168.1.1&nbsp;&nbsp;&nbsp; udp&nbsp;&nbsp;&nbsp; =
30000:30010</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>but the stream video UDP/RTP Multicast =
don't=20
work.....</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Why ??</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Bye</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Mat</FONT></DIV>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Demanuel@abc.at href=3D"mailto:emanuel@abc.at">Emanoil =
Kotsev</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Dmatteo@oldamerika.com=20
  href=3D"mailto:matteo@oldamerika.com">Matteo</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Cc:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Wednesday, April 02, 2003 =
6:40=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Re: Info about =
H.323</DIV>
  <DIV><BR></DIV>Hi, <BR>forgot to tell you in case you don't know, that =
if your=20
  machine is the onlyone behind the firewall, you can just forward Port =
1720 to=20
  the Client=20
  <P>Also 30000:30010 and 5003:5005 whould be open accepting =
RELATED,ESTABLISHED=20
  traffic=20
  <P>in this case you should be able to receive voice&amp;video to and =
only to=20
  your client that you are forwarding to.=20
  <P>good luck=20
  <P>Matteo wrote:=20
  <BLOCKQUOTE TYPE=3D"CITE">&nbsp;<FONT face=3DArial><FONT=20
    size=3D-1>Dear,</FONT></FONT> <FONT face=3DArial><FONT size=3D-1>the =
patch for=20
    Kernel is P-O-M ??? so it is I try install and then I tell you if it =

    work...</FONT></FONT> <FONT face=3DArial><FONT =
size=3D-1>Bye</FONT></FONT> <FONT=20
    face=3DArial><FONT size=3D-1>Mat</FONT></FONT>=20
    <DIV style=3D"FONT: 10pt arial">----- Original Message -----</DIV>I =
have the=20
    same problem and no time to work on solution. <BR>As far as I know =
there is=20
    a patch for the kernel to add support H.323 into iptables. <BR>As I =
said I=20
    don't have anytime to work on a kernel and iptables configuration =
but if you=20
    manage to compile and configure H.323 support with IPtables me&nbsp; =
and my=20
    friends are going to be ver thankful if you post a mail.=20
    <P>good luck=20
    <P>Matteo wrote:=20
    <BLOCKQUOTE TYPE=3D"CITE">
      <STYLE></STYLE>
      <FONT face=3DArial><FONT size=3D-1>Hello,I have a server linux =
with redhat 7.3=20
      and shorewall as firewall, now I try to set protocol H.323 becouse =
I must=20
      receive strem video in multicast that use H.323....Now infact when =
I try=20
      to connect to Strem video I don't see anythings when if I try =
connect my=20
      pc directly to modem cable that it support h.323 strem video work =
at=20
      100%.Now I want use firewall in front of my pc and so I must set=20
      H.323....</FONT></FONT> <FONT face=3DArial><FONT size=3D-1>How set =
it ??? how=20
      set iptable ?? I must use P-O-M ?? If yes, How I use P-O-M=20
      ???</FONT></FONT> <FONT face=3DArial><FONT size=3D-1>Thank=20
      youMatteo</FONT></FONT></BLOCKQUOTE><PRE>--&nbsp;
+ Emanoil Kotsev - - - - -+
| tel. 0043(1)9253175&nbsp;&nbsp;&nbsp;&nbsp; |
| cel. --------------&nbsp;&nbsp;&nbsp;&nbsp; |
+ E-Mail: emanuel@abc.at&nbsp; +</PRE>&nbsp;</BLOCKQUOTE><PRE>--&nbsp;
+ Emanoil Kotsev - - - - -+
| tel. 0043(1)9253175&nbsp;&nbsp;&nbsp;&nbsp; |
| cel. --------------&nbsp;&nbsp;&nbsp;&nbsp; |
+ E-Mail: emanuel@abc.at&nbsp; +</PRE>&nbsp; </BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_002A_01C2F94A.B7D23CE0--


