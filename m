From: "Davide" <daveriboldi@infinito.it>
Subject: Re: Need Help
Date: Mon, 30 Sep 2002 00:26:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002601c26807$3c41cc00$5120a8c0@mmx>
References: <F270kuutSgcOrBLSAQV00000096@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0023_01C26817.FAF9B300"
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
To: Mohammad Shakir <shakirz1@hotmail.com>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0023_01C26817.FAF9B300
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hello,
   this is the iptables version

/sbin/iptables -F=20
/sbin/iptables -t nat -F=20
=20
/sbin/iptables -P INPUT ACCEPT
/sbin/iptables -P FORWARD ACCEPT
/sbin/iptables -P OUTPUT ACCEPT

echo "1" > /proc/sys/net/ipv4/ip_forward

# for trasparent proxy
/sbin/iptables -t nat -A PREROUTING -p tcp -s 0.0.0.0/0 --dport 80 -j =
REDIRECT --to-ports 8080
# for direct connection excluding HTTP
/sbin/iptables -A FORWARD -p tcp -s 0.0.0.0/0 --dport 80 -j DROP

=20
Davide



  ----- Original Message -----=20
  From: Mohammad Shakir=20
  To: netfilter@lists.samba.org=20
  Sent: Friday, September 27, 2002 1:08 PM
  Subject: Need Help


  Dear Russell,

  I have this setup in ipchains and now I want to convert in iptables. =
plz help me.=20

  /sbin/ipchains  -F forward  =20
  /sbin/ipchains  -F input    =20
  /sbin/ipchains  -F output   =20

  /sbin/ipchains  -P forward   ACCEPT
  /sbin/ipchains  -P input     ACCEPT
  /sbin/ipchains  -P output    ACCEPT

  echo "1" > /proc/sys/net/ipv4/ip_forward

  # for transparent proxy
  /sbin/ipchains -A input -j REDIRECT 8080 -p tcp -s 0.0.0.0/0 -d =
0.0.0.0/0 80
  # for direct connection excluding HTTP
  /sbin/ipchains  -A forward -j -p all -s 0.0.0.0/0 -d 0.0.0.0/0

  It was my old setup in RedHat Linux 7.0Rel.

  Now I have installed new verions of RedHat Linux 7.2, with Kernel =
2.4.7-10 and iptables version 1.2.3.


  thanks in advance=20

  shakir=20



-------------------------------------------------------------------------=
-----
  Join the world's largest e-mail service with MSN Hotmail. Click Here


------=_NextPart_000_0023_01C26817.FAF9B300
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp; this is the iptables=20
version</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>/sbin/iptables -F </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/sbin/iptables -t =
nat&nbsp;-F&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/sbin/iptables -P INPUT =
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/sbin/iptables -P FORWARD =
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/sbin/iptables -P OUTPUT =
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>echo "1" &gt; /proc/sys/net/ipv4/ip_forward</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># for trasparent proxy</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/sbin/iptables -t nat -A PREROUTING -p =
tcp -s=20
0.0.0.0/0 --dport 80 -j REDIRECT --to-ports 8080</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3># for direct=20
connection excluding HTTP</FONT><BR></FONT><FONT face=3DArial=20
size=3D2>/sbin/iptables -A FORWARD -p tcp -s 0.0.0.0/0 --dport 80 -j=20
DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Davide</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dshakirz1@hotmail.com =
href=3D"mailto:shakirz1@hotmail.com">Mohammad=20
  Shakir</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Dnetfilter@lists.samba.org=20
  =
href=3D"mailto:netfilter@lists.samba.org">netfilter@lists.samba.org</A> =
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Friday, September 27, =
2002 1:08=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Need Help</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT><FONT face=3DArial =
size=3D2></FONT><FONT=20
  face=3DArial size=3D2></FONT><FONT face=3DArial =
size=3D2></FONT><BR></DIV>
  <DIV>
  <DIV>Dear Russell,</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV>I have this setup in ipchains and now I want to convert in =
iptables. plz=20
  help me. <BR></DIV>
  <DIV>
  <DIV>/sbin/ipchains&nbsp; -F forward&nbsp;&nbsp; </DIV>
  <DIV>/sbin/ipchains&nbsp; -F input&nbsp;&nbsp;&nbsp;&nbsp; </DIV>
  <DIV>/sbin/ipchains&nbsp; -F output&nbsp;&nbsp;&nbsp; </DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></DIV>
  <DIV>/sbin/ipchains&nbsp; -P forward&nbsp;&nbsp;=20
  ACCEPT<BR>/sbin/ipchains&nbsp; -P input&nbsp;&nbsp;&nbsp;&nbsp;=20
  ACCEPT<BR>/sbin/ipchains&nbsp; -P output&nbsp;&nbsp;&nbsp; =
ACCEPT</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT><FONT face=3DArial =
size=3D2></FONT><BR>echo=20
  "1" &gt; /proc/sys/net/ipv4/ip_forward</DIV>
  <DIV>&nbsp;</DIV>
  <DIV># for transparent proxy<BR>/sbin/ipchains -A input -j REDIRECT =
8080 -p=20
  tcp -s 0.0.0.0/0 -d 0.0.0.0/0 80</DIV>
  <DIV># for direct connection excluding HTTP<BR>/sbin/ipchains&nbsp; -A =
forward=20
  -j -p all -s 0.0.0.0/0 -d 0.0.0.0/0</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>It was my old setup in RedHat Linux 7.0Rel.</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV>Now I have installed new verions of RedHat Linux 7.2, with Kernel =

  2.4.7-10 and iptables version 1.2.3.</DIV>
  <DIV>&nbsp;</DIV>
  <DIV><BR>thanks in advance </DIV>
  <DIV>&nbsp;</DIV>
  <DIV>shakir <BR></DIV></DIV><BR clear=3Dall>
  <HR>
  Join the world=92s largest e-mail service with MSN Hotmail. <A=20
  href=3D"http://g.msn.com/1HM1ENXX/c157??PI=3D31901">Click=20
Here</A><BR></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0023_01C26817.FAF9B300--


