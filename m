From: "Paul Cousins" <paul@pimper.fsnet.co.uk>
Subject: Re: [iptables] howto bind Mac to ip address
Date: Mon, 11 Aug 2003 11:33:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001101c35ff4$025cc900$0300a8c0@frodo>
References: <007601c35fe1$01eb3d20$142a45ca@shahid>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000E_01C35FFC.63E73540"
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

------=_NextPart_000_000E_01C35FFC.63E73540
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

.>  I want to bind each MAC address to his or her assigned IP address so =
nobody should mess around to change his or her IP's.

look into dhcpd from the internet consortium www.isc.org/products/DHCP/ =
99.9% of all linux release's come with so its a case of RTM and go from =
there but its very easy to configure espically with something like =
webmin.

2.> I want to allow selective MAC addresses each time, so they are not =
allowed to use it all the time or I can block them whenever I want to.



iptables can filter by mac address and ip adress so deny all users but =
those you wish to allow. A script with an allow variable in it would be =
you best bet as you coud add and remove users very quickly form the =
script then simply run and you new rules will be implemented =
immediately.



simple cron scripts with drop or deny rules set to run at times you wish =
to deny access will restrict the users. there may be an easy way not =
sure?.=20





hope this points you in the rigth direction.

------------------------------------------------
Paul Cousins
Canterbury Computer Services
paul@canterburycomputerservices.co.uk


  ----- Original Message -----=20
  From: Tariq Anwer=20
  To: netfilter@lists.netfilter.org=20
  Sent: Monday, August 11, 2003 9:17 AM
  Subject: [iptables] howto bind Mac to ip address


  Hi!

  I'm a new to Linux, I want to setup Linux NAT box for a small LAN with =
selective services to allow like only browsing for staff and other =
services for management like ftp msn chatting etc.

  =20

  1.>  I want to bind each MAC address to his or her assigned IP address =
so nobody should mess around to change his or her IP's.

  =20

  2.> I want to allow selective MAC addresses each time, so they are not =
allowed to use it all the time or I can block them whenever I want to.

  =20

  I will highly appreciate if anybody could help me or direct me to any =
web site or article to build this Box successfully.

  =20

  Best regards,

  =20

  Alien

------=_NextPart_000_000E_01C35FFC.63E73540
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns:o =3D "urn:schemas-microsoft-com:office:office"><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>.&gt; <SPAN style=3D"mso-spacerun: yes">&nbsp;</SPAN>I want to bind =
each MAC=20
address to his or her assigned IP address so nobody should mess around =
to change=20
his or her IP=92s.</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2><FONT face=3DTahoma><FONT color=3D#0000ff>look into =
dhcpd from the=20
internet consortium </FONT><A=20
href=3D"http://www.isc.org/products/DHCP/">www.isc.org/products/DHCP/</A>=
<FONT=20
color=3D#0000ff> 99.9% of all linux release's come with so its a case of =
RTM and=20
go from there but its very easy to configure espically with something =
like=20
webmin.</FONT></FONT></FONT></DIV>
<DIV><FONT face=3DTahoma color=3D#008000 size=3D2></FONT>&nbsp;</DIV>
<DIV>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt">2.&gt; I want to =
allow selective=20
MAC addresses each time, so they are not allowed to use it all the time =
or I can=20
block them whenever I want to.</P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2>iptables can filter by mac address and ip adress so deny all =
users but=20
those you wish to allow. A script with an allow variable in it would be =
you best=20
bet as you coud add and remove users very quickly form the script then=20
simply&nbsp;run and you new rules will be implemented =
immediately.</FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2>simple cron scripts with drop or deny rules set to run at times =
you wish=20
to deny access will restrict the users. there may be an easy way not =
sure?.=20
</FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2>hope this points you in the rigth direction.</FONT></P></DIV>
<DIV>------------------------------------------------<BR>Paul=20
Cousins<BR>Canterbury Computer Services<BR><A=20
href=3D"mailto:paul@canterburycomputerservices.co.uk">paul@canterburycomp=
uterservices.co.uk</A></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #0000ff 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dalien@aol.com.pk href=3D"mailto:alien@aol.com.pk">Tariq =
Anwer</A>=20
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Monday, August 11, 2003 =
9:17=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> [iptables] howto bind =
Mac to ip=20
  address</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>Hi!</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt">I=92m a new to =
Linux, I want to=20
  setup Linux NAT box for a small LAN with selective services to allow =
like only=20
  browsing for staff and other services for management like ftp msn =
chatting=20
  etc.</P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in =
0pt">&nbsp;<o:p></o:p></P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt">1.&gt; <SPAN=20
  style=3D"mso-spacerun: yes">&nbsp;</SPAN>I want to bind each MAC =
address to his=20
  or her assigned IP address so nobody should mess around to change his =
or her=20
  IP=92s.</P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in =
0pt">&nbsp;<o:p></o:p></P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt">2.&gt; I want to =
allow=20
  selective MAC addresses each time, so they are not allowed to use it =
all the=20
  time or I can block them whenever I want to.</P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in =
0pt">&nbsp;<o:p></o:p></P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt">I will highly =
appreciate if=20
  anybody could help me or direct me to any web site or article to build =
this=20
  Box successfully.</P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in =
0pt">&nbsp;<o:p></o:p></P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt">Best regards,</P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in =
0pt">&nbsp;<o:p></o:p></P>
  <P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt">Alien</P></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_000E_01C35FFC.63E73540--



