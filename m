From: "Chris Partsenidis" <Chris@firewall.cx>
Subject: Re: Allowing select IPs access to a single port
Date: Sun, 9 Feb 2003 17:58:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c2d054$24171d00$0100a8c0@admin>
References: <020901c2cfc7$9d1955c0$52453e44@cc292729a>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000C_01C2D064.E5475700"
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
To: security@grossepointe.com, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_000C_01C2D064.E5475700
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Assining the service your remote hosts are trying to access are on the =
firewall box and its a service that uses the TCP transport protocol, you =
could try something like the following:


iptables -A INPUT  -s remoteip -p tcp -d yourfirewallip --dport 3306 -j =
ACCEPT

If the service is on another pc on the internal network:

iptables -A PREROUTING -t nat -s remoteip -p tcp -d yourfirewallip =
--dport 3306 -j DNAT --to internalhostip

and in the case your internal service is running on a different port, =
e.g 4000:

iptables -A PREROUTING -t nat -s remoteip -p tcp -d yourfirewallip =
--dport 3306 -j DNAT --to internalhostip:4000

Hope this helps. I'll soon be covering IPTables on my website so you can =
check in a few weeks times, hopefully I'll have it posted by then:
www.Firewall.cx

Cheers,
__________________________
Chris Partsenidis.
Systems Network Administrator
Email: Chris@firewall.cx
http://www.firewall.cx =20
__________________________
  ----- Original Message -----=20
  From: security@grossepointe.com=20
  To: netfilter@lists.netfilter.org=20
  Sent: Sunday, February 09, 2003 1:12 AM
  Subject: Allowing select IPs access to a single port=20


  Hello,=20

  What would be the best way to only open port 3306 to 1 or 2 IPs for =
remote connection? I was hoping someone could provide an iptable command =
that would achieve this.

  I have tried a few things but I am a newbie and have yet to figure =
this one out.  Any resources or assistance would be appreciated.

  Thanks in advance.=20

  Doug


------=_NextPart_000_000C_01C2D064.E5475700
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
<DIV><FONT size=3D2>Assining the service your remote hosts are trying to =
access=20
are on the firewall box and its a service that uses the TCP transport =
protocol,=20
you could try something like the following:</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>iptables -A INPUT&nbsp; -s remoteip -p tcp -d =
yourfirewallip=20
--dport 3306 -j ACCEPT</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>If the service is on another pc on the internal=20
network:</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>iptables -A PREROUTING -t nat -s remoteip -p tcp -d=20
yourfirewallip --dport 3306 -j DNAT --to internalhostip</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>and in the case your internal service is running on =
a=20
different port, e.g 4000:</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>iptables -A PREROUTING -t nat -s remoteip -p tcp -d=20
yourfirewallip --dport 3306 -j DNAT --to =
internalhostip:4000</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Hope this helps. I'll soon be covering IPTables on =
my website=20
so you can check in a few weeks times, hopefully I'll have it posted by=20
then:</FONT></DIV>
<DIV><FONT size=3D2><A=20
href=3D"http://www.Firewall.cx">www.Firewall.cx</A></FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Cheers,</FONT></DIV>
<DIV>__________________________<BR>Chris Partsenidis.<BR>Systems Network =

Administrator<BR>Email: <A=20
href=3D"mailto:Chris@firewall.cx">Chris@firewall.cx</A><BR><A=20
href=3D"http://www.firewall.cx">http://www.firewall.cx</A>&nbsp;=20
<BR>__________________________</DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dsecurity@grossepointe.com=20
  =
href=3D"mailto:security@grossepointe.com">security@grossepointe.com</A> =
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Sunday, February 09, 2003 =
1:12=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Allowing select IPs =
access to a=20
  single port </DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>
  <P><FONT face=3D"verdana, arial, helvetica" size=3D2>Hello, =
<BR><BR>What would be=20
  the best way to only open port 3306 to 1 or 2 IPs for remote =
connection? I was=20
  hoping someone could provide an iptable command that would achieve=20
  this.</FONT></P>
  <P><FONT face=3DVerdana>I have tried a few things but I am a newbie =
and have yet=20
  to figure this one out.&nbsp; Any resources or assistance would be=20
  appreciated.</FONT></P>
  <P></FONT><FONT face=3DArial size=3D2><FONT face=3D"verdana, arial, =
helvetica"=20
  size=3D2>Thanks in advance.=20
<BR><BR>Doug</FONT></P></DIV></BLOCKQUOTE></FONT></BODY></HTML>

------=_NextPart_000_000C_01C2D064.E5475700--


