From: "Nikodim Nikodimov" <nick@riskeng.bg>
Subject: Re: MASQUERADE for 2 Internet connections
Date: Mon, 9 Sep 2002 16:53:38 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d101c25808$4c867ca0$37d2a8c0@nikodimov>
References: <005a01c257f7$e2e51dc0$6e69690a@rimas>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00CE_01C25821.71C2EBC0"
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

------=_NextPart_000_00CE_01C25821.71C2EBC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Why you don't maquerade the hole net?

 iptables -A POSTROUTING -t nat -s 10.105.105.0/24 -d 0.0.0.0/0.0.0.0 -o =
eth0 -j MASQUERADE

----- Original Message -----=20
  From: Rimas=20
  To: netfilter@lists.netfilter.org=20
  Sent: Monday, September 09, 2002 2:56 PM
  Subject: MASQUERADE for 2 Internet connections


  Hi folks,

  I have configured NAT for 1 Inet connection :=20
  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE - working =
solution

  I use 10.105.105.x internal IP addresing

  Now I have a second one Inet connection (eth2).

  How to make MASQUERADE like this:
  1st Inet - MASQUERADE for 10.105.105.100-105
  2nd Inet - MASQUERADE for 10.105.105.xx for all except 100-105

  Basicly to use the same IP addresing for both Inet connections



  Thanks in advance

  Rimas


------=_NextPart_000_00CE_01C25821.71C2EBC0
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
<DIV><FONT face=3DArial size=3D2>Why you don't maquerade the hole =
net?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;iptables -A POSTROUTING -t nat -s =

10.105.105.0/24 -d 0.0.0.0/0.0.0.0 -o eth0 -j MASQUERADE</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>----- Original Message ----- </DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Drmocius@auste.elnet.lt =
href=3D"mailto:rmocius@auste.elnet.lt">Rimas</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Monday, September 09, =
2002 2:56=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> MASQUERADE for 2 =
Internet=20
  connections</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>Hi folks,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I have configured NAT for 1 Inet =
connection :=20
  </FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING =
-o&nbsp;eth0 -j=20
  MASQUERADE - working solution</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I use 10.105.105.x internal IP=20
  addresing</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Now I have a second one Inet =
connection=20
  (eth2).</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>How to make MASQUERADE like =
this:</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>1st Inet - MASQUERADE for=20
  10.105.105.100-105</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>2nd Inet - MASQUERADE for =
10.105.105.xx for all=20
  except 100-105</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Basicly to use the same IP addresing =
for both=20
  Inet connections</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Thanks in advance</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Rimas</FONT></DIV>
  <DIV><FONT face=3DArial =
size=3D2></FONT>&nbsp;</DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_00CE_01C25821.71C2EBC0--


