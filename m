From: "Kevork" <rxlm@comintec.com.ar>
Subject: Re: Did MASQUERADE not work ?
Date: Wed, 10 Mar 2004 20:39:50 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <013401c406f8$fb20bfa0$6cfaa8c0@Defiant>
References: <OF39E09FC8.8C65F535-ON65256E53.0032AB6B@pricol.co.in>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0131_01C406DF.D55AD530"
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

------=_NextPart_000_0131_01C406DF.D55AD530
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The only thing I did not try was SNAT as you advise here ... I will try =
this
today, but (always there is a "but"), when I post this mail masquering =
was
not working as I described ... that was yesterday night.

Today morning (no change in the meanwhile), masquering was working  :S

No FORWARD policy is active.
DHCP leasing is OK
I put "-o eth1" also.
$internet is "0.0.0.0/0" (I copy the entire script bellow)

I will try SNAT then, but now I must wait for "not working again"  ... =
This
has life !  :-))

Thank you all off you for your help ... I will keep you updated about =
this
fight.

Kevork.


  ----- Original Message -----=20
  From: hclfm@pricol.co.in=20
  To: Rob Sterenborg=20
  Cc: 'Kevork' ; netfilter@lists.netfilter.org=20
  Sent: Wednesday, March 10, 2004 6:13 AM
  Subject: RE: Did MASQUERADE not work ?


  > Iptables script is the same as when it worked.
  > MASQ line is:
  > iptables -t nat -A POSTROUTING -s 192.168.250.0/24 -d
  > $internet -j MASQUERADE


  Hi ,

  You have missed the outgoing interface "-o" option ( Internet =
Interface )

  iptables -t nat -A POSTROUTING -o eth1 -s 192.168.250.0/24 -d
  $internet -j MASQUERADE

  must work.


  regards,

  U.SivaKumar,
  Networking & E-Security,
  HCL INFOSYSTEMS LIMITED,

  "The Purpose of Computing is Insight, Not Numbers"=20





  "Rob Sterenborg" <rob@sterenborg.info>
  Sent by: netfilter-admin@lists.netfilter.org
  03/10/2004 08:52 AM CET

  To: "'Kevork'" <rxlm@comintec.com.ar>, <netfilter@lists.netfilter.org>
  cc:=20
  bcc:=20
  Subject: RE: Did MASQUERADE not work ?




  > Iptables script is the same as when it worked.
  > MASQ line is:
  > iptables -t nat -A POSTROUTING -s 192.168.250.0/24 -d
  > $internet -j MASQUERADE

  What is "-d $internet" ?
  If $internet is 0.0.0.0 (as it should be) then you don't need to =
specify it
  as this is assumed.

  Did you try SNAT :
  iptables -t nat -A POSTROUTING -o <if_inet> \
   -s 192.168.250.0/24 -j SNAT --to-source <ip_inet>

  Do you have a FORWARD rule in place that allows MASQ/SNAT, or do you =
have
  FORWARD policy set to ACCEPT (which you should not do) ?

  Do you have "echo 1 > /proc/sys/net/ipv4/ip_forward" ?


  Gr,
  Rob


  =3D
------=_NextPart_000_0131_01C406DF.D55AD530
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>The only thing=20
I did not try was SNAT as you advise here ... I will try this<BR>today, =
but=20
(always there is a "but"), when I post this mail masquering was<BR>not =
working=20
as I described ... that was yesterday night.<BR><BR>Today morning (no =
change in=20
the meanwhile), masquering was working&nbsp; :S<BR><BR>No FORWARD policy =
is=20
active.<BR>DHCP leasing is OK<BR>I put "-o eth1" also.<BR>$internet is=20
"0.0.0.0/0" (I copy the entire script bellow)<BR><BR>I will try SNAT =
then, but=20
now I must wait for "not working again"&nbsp; ... This<BR>has life =
!&nbsp;=20
:-))<BR><BR>Thank you all off you for your help ... I will keep you =
updated=20
about this<BR>fight.<BR><BR>Kevork.</FONT><BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dhclfm@pricol.co.in=20
  href=3D"mailto:hclfm@pricol.co.in">hclfm@pricol.co.in</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Drob@sterenborg.info=20
  href=3D"mailto:rob@sterenborg.info">Rob Sterenborg</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Cc:</B> <A =
title=3Drxlm@comintec.com.ar=20
  href=3D"mailto:rxlm@comintec.com.ar">'Kevork'</A> ; <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Wednesday, March 10, 2004 =
6:13=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: Did MASQUERADE not =
work=20
  ?</DIV>
  <DIV><BR></DIV>
  <P><FONT face=3DCourier>&gt; Iptables script is the same as when it=20
  worked.<BR>&gt; MASQ line is:<BR>&gt; iptables -t nat -A POSTROUTING =
-s=20
  192.168.250.0/24 -d<BR>&gt; $internet -j MASQUERADE<BR></FONT></P>
  <P><FONT face=3DCourier>Hi ,</FONT></P>
  <P><FONT face=3DCourier>You have missed the outgoing interface "-o" =
option (=20
  Internet Interface )</FONT></P>
  <P><FONT face=3DCourier>iptables -t nat -A POSTROUTING -o eth1 -s=20
  192.168.250.0/24 -d<BR>$internet -j MASQUERADE</FONT></P>
  <P><FONT face=3DCourier>must work.<BR></FONT></P>
  <P>regards,<BR><BR>U.SivaKumar,<BR>Networking &amp; E-Security,<BR>HCL =

  INFOSYSTEMS LIMITED,<BR><BR>"The Purpose of Computing is Insight, Not =
Numbers"=20
  <BR><BR><BR></P>
  <P><BR><FONT size=3D2><B>"Rob Sterenborg" &lt;<A=20
  =
href=3D"mailto:rob@sterenborg.info">rob@sterenborg.info</A>&gt;</B></FONT=
><BR><FONT=20
  size=3D2>Sent by: <A=20
  =
href=3D"mailto:netfilter-admin@lists.netfilter.org">netfilter-admin@lists=
.netfilter.org</A></FONT><BR><FONT=20
  size=3D2>03/10/2004 08:52 AM CET</FONT><BR><BR><FONT =
size=3D2>To:</FONT> <FONT=20
  size=3D2>"'Kevork'" &lt;rxlm@comintec.com.ar&gt;,=20
  &lt;netfilter@lists.netfilter.org&gt;</FONT><BR><FONT =
size=3D2>cc:</FONT>=20
  <BR><FONT size=3D2>bcc:</FONT> <BR><FONT size=3D2>Subject:</FONT> =
<FONT size=3D2>RE:=20
  Did MASQUERADE not work ?</FONT><BR><BR><BR></P>
  <P><FONT face=3DMonospace,Courier>&gt; Iptables script is the same as =
when it=20
  worked.<BR>&gt; MASQ line is:<BR>&gt; iptables -t nat -A POSTROUTING =
-s=20
  192.168.250.0/24 -d<BR>&gt; $internet -j =
MASQUERADE<BR></FONT><BR><FONT=20
  face=3DMonospace,Courier>What is "-d $internet" ?<BR>If $internet is =
0.0.0.0 (as=20
  it should be) then you don't need to specify it<BR>as this is=20
  assumed.<BR></FONT><BR><FONT face=3DMonospace,Courier>Did you try SNAT =

  :<BR>iptables -t nat -A POSTROUTING -o &lt;if_inet&gt; \<BR>&nbsp;-s=20
  192.168.250.0/24 -j SNAT --to-source =
&lt;ip_inet&gt;<BR></FONT><BR><FONT=20
  face=3DMonospace,Courier>Do you have a FORWARD rule in place that =
allows=20
  MASQ/SNAT, or do you have<BR>FORWARD policy set to ACCEPT (which you =
should=20
  not do) ?<BR></FONT><BR><FONT face=3DMonospace,Courier>Do you have =
"echo 1 &gt;=20
  /proc/sys/net/ipv4/ip_forward" ?<BR></FONT><BR><BR><FONT=20
  =
face=3DMonospace,Courier>Gr,<BR>Rob<BR></FONT></P>=3D</BLOCKQUOTE></BODY>=
</HTML>

------=_NextPart_000_0131_01C406DF.D55AD530--


