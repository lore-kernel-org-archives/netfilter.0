From: "Bruno Negrao" <vpopmail@engepel.com.br>
Subject: Re: Hostname with DNAT  ? {OK}
Date: Tue, 27 Jul 2004 11:16:53 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <011401c473e4$5db3d1e0$5100a8c0@egp>
References: <001701c4731e$8408f850$da0da8c0@pisic>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0111_01C473CB.382D6170"
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
To: Danila Octavian <octavian@service.agress.ro>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0111_01C473CB.382D6170
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi Danila, there are some error in your rules, first i'll correct them, =
then i'll tell you about using names
  ----- Original Message -----=20
  From: Danila Octavian=20
  To: netfilter@lists.netfilter.org=20
  Sent: Monday, July 26, 2004 11:40 AM
  Subject: Hostname with DNAT ? {OK}


  hello,

  I was wondering if you can guide me how to deal with my situation :
  I want to do something like :=20

  read carefully this rule:
  $IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server1.com =
--dport 25 -j DNAT --to 192.168.14.254:25
  From now on, when the packet arrives the FORWARD chain of the filter =
table, it is not destinated to mail.server1.com anymore, since you have =
just changed its destination IP with the rule above. it is destined to =
192.168.14.254.
  the '-d IP' in the rule bellow is wrong:
  $IPTABLES -A FORWARD -i eth0 -p tcp -d mail1.server.com --dport 25 -j =
ACCEPT
  You should write instead:
  $IPTABLES -A FORWARD -i eth0 -p tcp -d 192.168.14.254 --dport 25 -j =
ACCEPT

  did you got it?
  This applies for all these rules bellow:

  $IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server2.com =
--dport 25 -j DNAT --to 192.168.14.251:25
  $IPTABLES -A FORWARD -i eth0 -p tcp -d mail.server2.com(wrong) --dport =
25 -j ACCEPT
  $IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d server3.com --dport =
25 -j DNAT --to 192.168.14.253:25
  $IPTABLES -A FORWARD -i eth0 -p tcp -d server3.com(wrong) --dport 25 =
-j ACCEPT
  $IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server3.com =
--dport 25 -j DNAT --to 192.168.14.253:25
  $IPTABLES -A FORWARD -i eth0 -p tcp -d mail.server3.com(wrong) --dport =
25 -j ACCEPT

  Is posibble to use names instead of IP like in my situation ?=20
  Yes, it is *possible*. It depends of whether your firewall can access =
the DNS server when it is loading those rules.
  In my firewall, when it is loading the PREROUTING rules, it didn't =
load the INPUT and OUTPUT rules yet, so it is not permitted to send nor =
receive any packet, so it can't contact the DNS server to resolve names.

  In my firewall I just load the FORWARD rules after i have loaded the =
INPUT and OUTPUT chains, so my firewall already can access the DNS =
server.

  hope it helps,
  bruno
------=_NextPart_000_0111_01C473CB.382D6170
Content-Type: text/html;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-2">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi Danila, there are some error in your =
rules,=20
first i'll correct them, then i'll tell you about using =
names</FONT></DIV>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Doctavian@service.agress.ro=20
  href=3D"mailto:octavian@service.agress.ro">Danila Octavian</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Monday, July 26, 2004 =
11:40=20
AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Hostname with DNAT ? =
{OK}</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>hello,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I was wondering if you can guide me =
how to deal=20
  with my situation :</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>I want to do something like : =
</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2>read carefully this=20
  rule:</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>$IPTABLES -A PREROUTING -t nat -i =
eth0 -p tcp -d=20
  mail.server1.com --dport 25 -j DNAT --to =
192.168.14.254:25</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><FONT color=3D#0000ff>From now on, =
when the packet=20
  arrives the FORWARD chain of the filter table,&nbsp;it is not =
destinated to=20
  mail.server1.com anymore, since </FONT></FONT><FONT face=3DArial =
size=3D2><FONT=20
  color=3D#0000ff>you have just changed its destination IP with the rule =
above. it=20
  is destined to 192.168.14.254.</FONT></FONT></DIV><FONT face=3DArial=20
  size=3D2><FONT color=3D#0000ff></FONT></FONT></BLOCKQUOTE>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV><FONT face=3DArial size=3D2><FONT color=3D#0000ff>the '-d IP' in =
the rule=20
  bellow is wrong:</FONT></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>$IPTABLES -A FORWARD -i eth0 -p tcp=20
  -d&nbsp;mail1.server.com --dport 25 -j ACCEPT</FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2>You should write=20
  instead:</FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2>$IPTABLES -A FORWARD =
-i eth0 -p tcp=20
  -d 192.168.14.254 --dport 25 -j ACCEPT</FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2>did you got =
it?</FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2>This applies for all =
these rules=20
  bellow:</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>$IPTABLES -A PREROUTING -t nat -i =
eth0 -p tcp -d=20
  mail.server2.com --dport 25 -j DNAT --to =
192.168.14.251:25<BR>$IPTABLES -A=20
  FORWARD -i eth0 -p tcp -d&nbsp;mail.server2.com<FONT=20
  color=3D#0000ff>(wrong)</FONT> --dport 25 -j ACCEPT</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>$IPTABLES -A PREROUTING -t nat -i =
eth0 -p tcp -d=20
  server3.com --dport 25 -j DNAT --to 192.168.14.253:25<BR>$IPTABLES -A =
FORWARD=20
  -i eth0 -p tcp -d server3.com<FONT color=3D#0000ff>(wrong)</FONT> =
--dport 25 -j=20
  ACCEPT<BR>$IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d =
mail.server3.com=20
  --dport 25 -j DNAT --to 192.168.14.253:25<BR>$IPTABLES -A FORWARD -i =
eth0 -p=20
  tcp -d mail.server3.com<FONT color=3D#0000ff>(wrong)</FONT> --dport 25 =
-j=20
  ACCEPT</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Is posibble to use names instead of =
IP like in my=20
  situation ? </FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2>Yes, it is =
*possible*. It=20
  depends&nbsp;of whether your firewall can access the DNS server when =
it is=20
  loading those rules.</FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2>In my firewall, when =
it is loading=20
  the PREROUTING rules, it didn't load the INPUT and OUTPUT rules yet, =
so it is=20
  not permitted to send nor receive any packet, so it can't contact the =
DNS=20
  server to resolve names.</FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2>In my firewall I just =
load the=20
  FORWARD rules after i have loaded the INPUT and OUTPUT chains, so my =
firewall=20
  already can access the DNS server.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2>hope it =
helps,</FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff=20
size=3D2>bruno</FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0111_01C473CB.382D6170--


