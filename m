From: "..." <betolourenco@ig.com.br>
Subject: Re: NAT Information
Date: Wed, 29 Jan 2003 09:39:13 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001601c2c78b$11339550$0a01a8c0@rlourenco>
References: <5.2.0.9.0.20030129110905.058ac020@imap4.plugit.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0011_01C2C77A.48B36890"
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

------=_NextPart_000_0011_01C2C77A.48B36890
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Try to use squid...

...
  ----- Original Message -----=20
  From: Simone Sestini=20
  To: netfilter@lists.netfilter.org=20
  Sent: Wednesday, January 29, 2003 8:13 AM
  Subject: NAT Information


  Hi folks....

  I did a special NAT-Firewall box for a dialup server..

  I use the rules like that..

  /usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.2.0/23 -o eth0 =
-j SNAT --to PUBLIC_IP1
  /usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.4.0/23 -o eth0 =
-j SNAT --to PUBLIC_IP2
  /usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.6.0/23 -o eth0 =
-j SNAT --to PUBLIC_IP3
  /usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.8.0/23 -o eth0 =
-j SNAT --to PUBLIC_IP4
  /usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.10.0/23 -o =
eth0 -j SNAT --to PUBLIC_IP5
  /usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.12.0/23 -o =
eth0 -j SNAT --to PUBLIC_IP6

  now.. i need to set for examples the class 10.20.10.0/23 to browse =
only www.microsoft.com and www.ibm.com.

  How can i modify my chain ?

  I have try to insert a -t nat -A OUTPUT or a -t nat -A PREROUTING =
rules but nothing is blocking the browsinf over internet..

  Any idea ?



  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  Simone Sestini [ SS971-RIPE ]

  Plug IT s.p.a. - Technical Office
  Via Galileo Ferraris 216
  52100 Arezzo

  Titles:
  System and Network Administrator
  Data Transmission Manager

  Fax             +39 199 440088
  E-mail  simone.sestini@plugit.net
  Web             http://www.plugit.it

  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: =



------=_NextPart_000_0011_01C2C77A.48B36890
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Try to use squid...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>...</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dsimone.sestini@plugit.net=20
  href=3D"mailto:simone.sestini@plugit.net">Simone Sestini</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Wednesday, January 29, =
2003 8:13=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> NAT Information</DIV>
  <DIV><BR></DIV>Hi folks....<BR><BR>I did a special NAT-Firewall box =
for a=20
  dialup server..<BR><BR>I use the rules like=20
  that..<BR><BR>/usr/local/sbin/iptables -t nat -A POSTROUTING -s =
10.20.2.0/23=20
  -o eth0 -j SNAT --to PUBLIC_IP1<BR>/usr/local/sbin/iptables -t nat -A=20
  POSTROUTING -s 10.20.4.0/23 -o eth0 -j SNAT --to=20
  PUBLIC_IP2<BR>/usr/local/sbin/iptables -t nat -A POSTROUTING -s =
10.20.6.0/23=20
  -o eth0 -j SNAT --to PUBLIC_IP3<BR>/usr/local/sbin/iptables -t nat -A=20
  POSTROUTING -s 10.20.8.0/23 -o eth0 -j SNAT --to=20
  PUBLIC_IP4<BR>/usr/local/sbin/iptables -t nat -A POSTROUTING -s =
10.20.10.0/23=20
  -o eth0 -j SNAT --to PUBLIC_IP5<BR>/usr/local/sbin/iptables -t nat -A=20
  POSTROUTING -s 10.20.12.0/23 -o eth0 -j SNAT --to =
PUBLIC_IP6<BR><BR>now.. i=20
  need to set for examples the class 10.20.10.0/23 to browse only <A=20
  href=3D"http://www.microsoft.com/" =
eudora=3D"autourl">www.microsoft.com</A> and <A=20
  href=3D"http://www.ibm.com/" =
eudora=3D"autourl">www.ibm.com</A>.<BR><BR>How can i=20
  modify my chain ?<BR><BR>I have try to insert a -t nat -A OUTPUT or a =
-t nat=20
  -A PREROUTING rules but nothing is blocking the browsinf over=20
  internet..<BR><BR>Any idea ?<BR><BR><BR><X-SIGSEP>
  <P></X-SIGSEP><FONT=20
  =
face=3DVerdana>::::::::::::::::::::::::::::::::::::::::::::::::::::::::::=
::::::::::::<BR><BR></FONT><FONT=20
  face=3DVerdana color=3D#ff0000><B>Simone Sestini </FONT><FONT =
face=3DVerdana=20
  color=3D#ff0000 size=3D2>[ SS971-RIPE ]<BR><BR></B></FONT>Plug IT =
s.p.a. -=20
  Technical Office<BR>Via Galileo Ferraris 216<BR>52100 =
Arezzo<BR><BR><TT><FONT=20
  face=3D"Courier New, Courier" color=3D#0000ff>Titles:<BR>System and =
Network=20
  Administrator<BR>Data Transmission=20
  =
Manager<BR><BR>Fax<X-TAB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</X-TAB><X-TAB>&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</X-TAB>+39=20
  199=20
  =
440088<BR>E-mail<X-TAB>&nbsp;&nbsp;</X-TAB>simone.sestini@plugit.net<BR>W=
eb<X-TAB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</X-TAB><X-TAB>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</X-TAB><A=20
  href=3D"http://www.plugit.it/"=20
  eudora=3D"autourl">http://www.plugit.it</A><BR><BR></FONT></TT><FONT=20
  =
face=3DVerdana><U>:::::::::::::::::::::::::::::::::::::::::::::::::::::::=
:::::::::::::::=20
  <BR></FONT></U></P></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0011_01C2C77A.48B36890--


