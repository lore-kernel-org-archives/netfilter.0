From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: ping to internet address
Date: Mon, 11 Aug 2003 20:02:10 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DKEDJAAMDCDBHFKPBEMPKEADCHAA.markee@bandwidthco.com>
References: <007e01c36075$9fddf6f0$7700000a@lawrencewin2k>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0006_01C36043.72FA7DC0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007e01c36075$9fddf6f0$7700000a@lawrencewin2k>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Lawrence - D <ingsiong@daltron.com.pg>, Netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0006_01C36043.72FA7DC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

You provide little information on your setup, but I guess my first question
would be Do you have IP_FORWARDING set to the value of 1?  Assuming
everything else is in order and properly configured, it sounds like your
firewall is not able to forward packets from one interface to another.
  -----Original Message-----
  From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Lawrence - D
  Sent: Monday, August 11, 2003 7:01 PM
  To: Netfilter
  Subject: ping to internet address


  Hi,
      I have a problem on ping to external ip address. I install RedHat 8.0
on my proxy/mail/firewall PC.
      My internal address is 192.168.1.X and external address is 202.61.0.X.
Even I set my workstation PC gateway to 192.168.1.1, but still couldn't ping
to external address. This make my ISP email can't check on my Windows
Workstation. But I can check my domain email from workstation.
      Any advice on this matter ?

  Best Regards,

  Lawrence Tang
  Comserv (PNG) Ltd
  Lot 21, Sect. 59, Gabaka St., Gordon
  P.O.Box 2292, Boroko
  Port Moresby, Papua New Guinea
  Tel: 675-3233330 Fax: 675-3250673
  Email: ingsiong@daltron.com.pg

  =======================================================================
  This message contains privileged and confidential information intended
only for the use
  of the named recipient(s). Any unauthorised use of the contents of this
message is
  expressly prohibited. If you have received this message in error, please
notify the sender
  immediately by return email and destroy the original message. Thank you
for your co-operation.
  =======================================================================

------=_NextPart_000_0006_01C36043.72FA7DC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D851565902-12082003><FONT face=3DArial color=3D#0000ff =
size=3D2>You=20
provide little information on your setup, but I guess my first question =
would be=20
Do you have IP_FORWARDING set to the value of 1?&nbsp; Assuming =
everything else=20
is in order and properly configured, it sounds like your firewall is not =
able=20
to&nbsp;forward packets from one interface to =
another.</FONT></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B>=20
  netfilter-admin@lists.netfilter.org=20
  [mailto:netfilter-admin@lists.netfilter.org]<B>On Behalf Of =
</B>Lawrence -=20
  D<BR><B>Sent:</B> Monday, August 11, 2003 7:01 PM<BR><B>To:</B>=20
  Netfilter<BR><B>Subject:</B> ping to internet =
address<BR><BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I have a problem =
on ping to=20
  external ip address. I install RedHat 8.0 on my proxy/mail/firewall=20
  PC.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; My internal =
address is=20
  192.168.1.X and external address is 202.61.0.X. Even I set my =
workstation PC=20
  gateway to 192.168.1.1, but still couldn't ping to external address. =
This make=20
  my ISP email can't check on my Windows Workstation. But I can check my =
domain=20
  email from workstation.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Any advice on this =
matter=20
  ?</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Best Regards,<BR>&nbsp;<BR>Lawrence =
Tang=20
  <BR>Comserv (PNG) Ltd <BR>Lot 21, Sect. 59, Gabaka St., Gordon =
<BR>P.O.Box=20
  2292, Boroko <BR>Port Moresby, Papua New Guinea <BR>Tel: 675-3233330 =
Fax:=20
  675-3250673 <BR>Email: <A=20
  =
href=3D"mailto:ingsiong@daltron.com.pg">ingsiong@daltron.com.pg</A><BR>&n=
bsp;<BR>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<=
BR>This=20
  message contains privileged and confidential information intended only =
for the=20
  use<BR>of the named recipient(s). Any unauthorised use of the contents =
of this=20
  message is<BR>expressly prohibited. If you have received this message =
in=20
  error, please notify the sender<BR>immediately by return email and =
destroy the=20
  original message. Thank you for your=20
  =
co-operation.<BR>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D</FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0006_01C36043.72FA7DC0--



