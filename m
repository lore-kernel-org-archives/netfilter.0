From: "Danila Octavian" <octavian@service.agress.ro>
Subject: Re: Hostname with DNAT  ? {OK}
Date: Wed, 28 Jul 2004 09:18:14 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <016b01c4746a$be09df90$da0da8c0@pisic>
References: <001701c4731e$8408f850$da0da8c0@pisic> <011401c473e4$5db3d1e0$5100a8c0@egp>
Reply-To: "Danila Octavian" <octavian@service.agress.ro>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0168_01C47483.CF5CA6B0"
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
To: Bruno Negrao <vpopmail@engepel.com.br>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0168_01C47483.CF5CA6B0
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable


  Hi Danila, there are some error in your rules, first i'll correct them, t=
hen i'll tell you about using names

  I know the rules were wrong ... i was in a rush ... u are right, but i wa=
s trying to do something else. I will give my setup just to see what i was =
asking :

  internet ---> public ip eth0 eth1 private ip --> mail.server1.com private=
 ip eth0 eth1 private ip ---> lan
                                                             --> mail.serve=
r2.com private ip eth0 eth1 private ip ---> lan
                                                             --> mail.serve=
r3.com private ip eth0 eth1 private ip ---> lan=20=20
  The problem is that i have 3 names on the same public IP and i want to se=
nd mail traffic to those servers which have private ips.
  I don't want to use smtp on the router with public ip , just redirrect na=
me based to the machines behind accordingly.
  thank you very much for your help,

  Danila Octavian=20
    ----- Original Message -----=20
    From: Danila Octavian=20
    To: netfilter@lists.netfilter.org=20
    Sent: Monday, July 26, 2004 11:40 AM
    Subject: Hostname with DNAT ? {OK}


    hello,

    I was wondering if you can guide me how to deal with my situation :
    I want to do something like :=20

    read carefully this rule:
    $IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server1.com --dpo=
rt 25 -j DNAT --to 192.168.14.254:25
    From now on, when the packet arrives the FORWARD chain of the filter ta=
ble, it is not destinated to mail.server1.com anymore, since you have just =
changed its destination IP with the rule above. it is destined to 192.168.1=
4.254.
    the '-d IP' in the rule bellow is wrong:
    $IPTABLES -A FORWARD -i eth0 -p tcp -d mail1.server.com --dport 25 -j A=
CCEPT
    You should write instead:
    $IPTABLES -A FORWARD -i eth0 -p tcp -d 192.168.14.254 --dport 25 -j ACC=
EPT

    did you got it?
    This applies for all these rules bellow:

    $IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server2.com --dpo=
rt 25 -j DNAT --to 192.168.14.251:25
    $IPTABLES -A FORWARD -i eth0 -p tcp -d mail.server2.com(wrong) --dport =
25 -j ACCEPT
    $IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d server3.com --dport 25=
 -j DNAT --to 192.168.14.253:25
    $IPTABLES -A FORWARD -i eth0 -p tcp -d server3.com(wrong) --dport 25 -j=
 ACCEPT
    $IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server3.com --dpo=
rt 25 -j DNAT --to 192.168.14.253:25
    $IPTABLES -A FORWARD -i eth0 -p tcp -d mail.server3.com(wrong) --dport =
25 -j ACCEPT

    Is posibble to use names instead of IP like in my situation ?=20
    Yes, it is *possible*. It depends of whether your firewall can access t=
he DNS server when it is loading those rules.
    In my firewall, when it is loading the PREROUTING rules, it didn't load=
 the INPUT and OUTPUT rules yet, so it is not permitted to send nor receive=
 any packet, so it can't contact the DNS server to resolve names.

    In my firewall I just load the FORWARD rules after i have loaded the IN=
PUT and OUTPUT chains, so my firewall already can access the DNS server.

    hope it helps,
    bruno

  --=20
  This message has been scanned for viruses and=20
  dangerous content, and is believed to be clean.=20
  Service.Agress.Ro E-Mail Scanning Service.=20
--=20
This message has been scanned for viruses and
dangerous content, and is believed to be clean.
Service.Agress.Ro E-Mail Scanning Service


------=_NextPart_000_0168_01C47483.CF5CA6B0
Content-Type: text/html;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Diso-8859-2">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LE=
FT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV><FONT face=3DArial size=3D2>Hi Danila, there are some error in your =
rules,=20
  first i'll correct them, then i'll tell you about using names</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I know the rules were wrong ... i was in=
 a rush=20
  ... u are right, but i was trying to do something else. I will give my se=
tup=20
  just to see what i was asking :</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>internet ---&gt; public ip eth0 eth1 pri=
vate ip=20
  --&gt; mail.server1.com private ip eth0 eth1 private ip ---&gt;=20
  lan</FONT></DIV>
  <DIV><FONT face=3DArial=20
  size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  --&gt; mail.server2.com private ip eth0 eth1 private ip ---&gt;=20
  lan</FONT></DIV>
  <DIV><FONT face=3DArial=20
  size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--&gt;&nbs=
p;mail.server3.com=20
  private ip eth0 eth1 private ip ---&gt; lan&nbsp; </FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>The problem is that i have 3 names on th=
e same=20
  public IP and i want to send mail traffic to those servers which have pri=
vate=20
  ips.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>I don't want to use smtp on the router w=
ith=20
  public ip , just redirrect&nbsp;name based to the machines&nbsp;behind=20
  accordingly.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>thank you very much for your help,</FONT=
></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Danila Octavian</FONT>&nbsp;</DIV>
  <BLOCKQUOTE=20
  style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-=
LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
    <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
    <DIV=20
    style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: black"><B>F=
rom:</B>=20
    <A title=3Doctavian@service.agress.ro=20
    href=3D"mailto:octavian@service.agress.ro">Danila Octavian</A> </DIV>
    <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
    title=3Dnetfilter@lists.netfilter.org=20
    href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter=
.org</A>=20
    </DIV>
    <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Monday, July 26, 2004 11:4=
0=20
    AM</DIV>
    <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Hostname with DNAT ?=20
{OK}</DIV>
    <DIV><BR></DIV>
    <DIV><FONT face=3DArial size=3D2>hello,</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>I was wondering if you can guide me ho=
w to deal=20
    with my situation :</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2>I want to do something like : </FONT><=
/DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial color=3D#0000ff size=3D2>read carefully this=20
    rule:</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2>$IPTABLES -A PREROUTING -t nat -i eth0=
 -p tcp=20
    -d mail.server1.com --dport 25 -j DNAT --to 192.168.14.254:25</FONT></D=
IV>
    <DIV><FONT face=3DArial size=3D2><FONT color=3D#0000ff>From now on, whe=
n the=20
    packet arrives the FORWARD chain of the filter table,&nbsp;it is not=20
    destinated to mail.server1.com anymore, since </FONT></FONT><FONT face=
=3DArial=20
    size=3D2><FONT color=3D#0000ff>you have just changed its destination IP=
 with the=20
    rule above. it is destined to 192.168.14.254.</FONT></FONT></DIV><FONT=
=20
    face=3DArial size=3D2><FONT color=3D#0000ff></FONT></FONT></BLOCKQUOTE>
  <BLOCKQUOTE=20
  style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-=
LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
    <DIV><FONT face=3DArial size=3D2><FONT color=3D#0000ff>the '-d IP' in t=
he rule=20
    bellow is wrong:</FONT></FONT></DIV>
    <DIV><FONT face=3DArial size=3D2>$IPTABLES -A FORWARD -i eth0 -p tcp=20
    -d&nbsp;mail1.server.com --dport 25 -j ACCEPT</FONT></DIV>
    <DIV><FONT face=3DArial color=3D#0000ff size=3D2>You should write=20
    instead:</FONT></DIV>
    <DIV><FONT face=3DArial color=3D#0000ff size=3D2>$IPTABLES -A FORWARD -=
i eth0 -p=20
    tcp -d 192.168.14.254 --dport 25 -j ACCEPT</FONT></DIV>
    <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial color=3D#0000ff size=3D2>did you got it?</FONT>=
</DIV>
    <DIV><FONT face=3DArial color=3D#0000ff size=3D2>This applies for all t=
hese rules=20
    bellow:</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>$IPTABLES -A PREROUTING -t nat -i eth0=
 -p tcp=20
    -d mail.server2.com --dport 25 -j DNAT --to 192.168.14.251:25<BR>$IPTAB=
LES=20
    -A FORWARD -i eth0 -p tcp -d&nbsp;mail.server2.com<FONT=20
    color=3D#0000ff>(wrong)</FONT> --dport 25 -j ACCEPT</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2>$IPTABLES -A PREROUTING -t nat -i eth0=
 -p tcp=20
    -d server3.com --dport 25 -j DNAT --to 192.168.14.253:25<BR>$IPTABLES -=
A=20
    FORWARD -i eth0 -p tcp -d server3.com<FONT color=3D#0000ff>(wrong)</FON=
T>=20
    --dport 25 -j ACCEPT<BR>$IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -=
d=20
    mail.server3.com --dport 25 -j DNAT --to 192.168.14.253:25<BR>$IPTABLES=
 -A=20
    FORWARD -i eth0 -p tcp -d mail.server3.com<FONT color=3D#0000ff>(wrong)=
</FONT>=20
    --dport 25 -j ACCEPT</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>Is posibble to use names instead of IP=
 like in=20
    my situation ? </FONT></DIV>
    <DIV><FONT face=3DArial color=3D#0000ff size=3D2>Yes, it is *possible*.=
 It=20
    depends&nbsp;of whether your firewall can access the DNS server when it=
 is=20
    loading those rules.</FONT></DIV>
    <DIV><FONT face=3DArial color=3D#0000ff size=3D2>In my firewall, when i=
t is=20
    loading the PREROUTING rules, it didn't load the INPUT and OUTPUT rules=
 yet,=20
    so it is not permitted to send nor receive any packet, so it can't cont=
act=20
    the DNS server to resolve names.</FONT></DIV>
    <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial color=3D#0000ff size=3D2>In my firewall I just =
load the=20
    FORWARD rules after i have loaded the INPUT and OUTPUT chains, so my=20
    firewall already can access the DNS server.</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial color=3D#0000ff size=3D2>hope it helps,</FONT><=
/DIV>
    <DIV><FONT face=3DArial color=3D#0000ff=20
  size=3D2>bruno</FONT></DIV></BLOCKQUOTE><BR>-- <BR>This message has been =
scanned=20
  for viruses and <BR>dangerous content, and is believed to be clean. <BR><=
A=20
  href=3D"http://service.agress.ro/">Service.Agress.Ro</A> E-Mail Scanning=
=20
  Service. </BLOCKQUOTE></BODY><br />--=20
<br />This message has been scanned for viruses and
<br />dangerous content, and is believed to be clean.
<br /><a href=3D"http://service.agress.ro/">Service.Agress.Ro</a> E-Mail Sc=
anning Service.
</HTML>

------=_NextPart_000_0168_01C47483.CF5CA6B0--



