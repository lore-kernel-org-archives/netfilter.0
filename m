From: "Jeroen van Leeuwen" <omzig@hetnet.nl>
Subject: Re: SSH dnat
Date: Sun, 1 Dec 2002 10:44:18 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000c01c29969$a8617410$0a0a0a0a@windblows>
References: <000801c29949$359d2a70$02a8a8c0@hades>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0009_01C29926.99F03B20"
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
To: Ambor <ambor@alternity.net>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0009_01C29926.99F03B20
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

are you sure that your server is listening on port 2323?
The rule as i use it is:
iptables -t nat -A PREROUTING -p tcp --dport 2000 -i eth2 -j DNAT --to =
10.10.10.1:22

the server is listening on port 22 of 10.10.10.1
reachable from externel on port 2000

grtn jeroen
  ----- Original Message -----=20
  From: Ambor=20
  To: netfilter@lists.netfilter.org=20
  Sent: Sunday, December 01, 2002 6:52 AM
  Subject: SSH dnat


  Hello everyone,

  I'm trying to dnat SSH throught the firewall to an internal machine.
   I use following Rule

  iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2323 -j DNAT =
--to-destination internal_IP:2323

  eth0 is connected to internet

  The problem is that the connection is allrght it just seems that I =
don't get an answer from the ssh server.
  (I'm getting a connection timeout, ot a connection refused)

  To be sure I don't filter anything, so all trafic is accepted

  Can someone help me?

  thx

  Ronny


  ---
  Outgoing mail is certified Virus Free.
  Checked by AVG anti-virus system (http://www.grisoft.com).
  Version: 6.0.422 / Virus Database: 237 - Release Date: 20-11-2002

------=_NextPart_000_0009_01C29926.99F03B20
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
<DIV><FONT face=3DArial size=3D2>are you sure that your server is =
listening on port=20
2323?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The rule as i use it is:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -p tcp =
--dport 2000=20
-i eth2 -j DNAT --to 10.10.10.1:22<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>the server is listening on port 22 of=20
10.10.10.1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>reachable from externel on port =
2000</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>grtn jeroen</DIV></FONT>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dambor@alternity.net =
href=3D"mailto:ambor@alternity.net">Ambor</A>=20
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Sunday, December 01, 2002 =
6:52=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> SSH dnat</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT><FONT face=3DArial =
size=3D2></FONT><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>Hello everyone,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I'm trying to dnat SSH throught the =
firewall to=20
  an internal machine.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;I use following =
Rule</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -i eth0 =
-p tcp=20
  --dport 2323&nbsp;-j DNAT --to-destination =
internal_IP:2323</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>eth0 is connected to =
internet</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>The problem is that the connection is =
allrght it=20
  just seems that I don't get an answer from the ssh =
server.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>(I'm getting a connection timeout, ot =
a=20
  connection refused)</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>To be sure I don't filter anything, =
so all trafic=20
  is accepted</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Can someone help me?</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>thx</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Ronny</FONT></DIV>
  <DIV>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2><BR>---<BR>Outgoing mail is certified =
Virus=20
  Free.<BR>Checked by AVG anti-virus system (<A=20
  =
href=3D"http://www.grisoft.com">http://www.grisoft.com</A>).<BR>Version: =
6.0.422=20
  / Virus Database: 237 - Release Date:=20
20-11-2002</FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0009_01C29926.99F03B20--


