From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: NAT & MySQL
Date: Tue, 25 Nov 2003 11:23:48 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311251923.hAPJNpiu001203@server5.bandwidthco.com>
References: <3FC3485C.000009.00204@adburne>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Type: multipart/related;
	boundary="----=_NextPart_000_001C_01C3B346.98669C50"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FC3485C.000009.00204@adburne>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'adburne' <adburne@asocmedrosario.com.ar>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_001C_01C3B346.98669C50
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_001D_01C3B346.98690D50"


------=_NextPart_001_001D_01C3B346.98690D50
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The ACK packets you see in your dump are probably being dropped at the
firewall because a state table entry does not exist.  So you need to add =
a
NEW rule to do this:
=20
iptables -A FORWARD -i ppp0 -o eth0 -m state --state NEW -j ACCEPT
=20
this rule will then allow your ESTABLISHED,RELATED rule to work and =
permit
those ACK packets to pass.


  _____ =20

From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of adburne
Sent: Tuesday, November 25, 2003 4:18 AM
To: netfilter@lists.netfilter.org
Subject: NAT & MySQL



Someone can make NAT with mysql? I've tried for a long time without make =
it
work.
=20
My natural language is spanish, sorry by mistakes writing in english.
=20
This is the situation:
=20
I've have a linux box as gateway between my lan and internet routing =
paquets
without problems, I need access from internet another linux box running
apache and mysql on my private lan.
To do this work I try to use nat; with apache all works ok, but with =
mysql
can't connect. I'll be looking on different network devices using =
tcpdump to
find what's wrong.
=20
This is what tcpdump show on device eth0 on my mysql server (inside the
lan), there is a petition from 200.10.10.1 (internet client) to =
192.168.0.80
(mysql lan server), this reply with ack, but internet client don't=20
reply. Any clue? =3D)
=20
200.10.10.1.56405 > 192.168.0.80.3306: S 2205542765:2205542765(0) win =
5840
<mss
1412,sackOK,timestamp 620645629 0,nop,wscale 0> (DF)
192.168.0.80.3306 > 200.10.10.1.56405: S 2497023396:2497023396(0) ack
2205542766
 win 5792 <mss 1460,sackOK,timestamp 95764658 620645629,nop,wscale 0> =
(DF)
200.10.10.1.56405 > 192.168.0.80.3306: R 2205542766:2205542766(0) win 0 =
(DF)
200.10.10.1.56405 > 192.168.0.80.3306: S 2205542765:2205542765(0) win =
5840
<mss
1412,sackOK,timestamp 620648701 0,nop,wscale 0> (DF)
192.168.0.80.3306 > 200.10.10.1.56405: S 2503023731:2503023731(0) ack
2205542766
 win 5792 <mss 1460,sackOK,timestamp 95765258 620648701,nop,wscale 0> =
(DF)
200.10.10.1.56405 > 192.168.0.80.3306: R 2205542766:2205542766(0) win 0 =
(DF)

=20
The forward rules on the gateway are:
=20
# "Accept forward all connections to port 3306 on ppp0"
iptables -A FORWARD -p tcp -i ppp0 --dport 3306 -o eth0 -j ACCEPT
# "All stablished connections are ok"
iptables -A FORWARD -i ppp0 -o eth0 -m state --state ESTABLISHED,RELATED =
-j
ACCEPT
# "All connection from inside to outside are accepted"
iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT
# "Rest go away"
iptables -A FORWARD -j REJECT
=20
NAT rule:
iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 3306 -j DNAT --to
192.168.0.80 -s 200.10.10.1
=20
If someone can make the light turn on, thanks!!!!
=20
Alejandro
=20

		=09
_________________________________________________________________
 <http://www.incredimail.com/redir.asp?ad_id=3D310&lang=3D10>   =
IncrediMail - El
E-mail ha evolucionado finalmente -
<http://www.incredimail.com/redir.asp?ad_id=3D310&lang=3D10> Haga clic =
aqu=ED

------=_NextPart_001_001D_01C3B346.98690D50
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1264" =
name=3DGENERATOR><!--IncrdiXMLRemarkStart>
<IncrdiX-Info>
<X-FID>FLAVOR00-NONE-0000-0000-000000000000</X-FID>
<X-FVER>3.0</X-FVER>
<X-CNT>;</X-CNT>
</IncrdiX-Info>
<IncrdiXMLRemarkEnd--></HEAD>
<BODY=20
style=3D"BACKGROUND-POSITION: 0px 0px; FONT-SIZE: 12pt; MARGIN: 5px 10px =
10px; FONT-FAMILY: Arial"=20
bgColor=3D#ffffff background=3D"" scroll=3Dyes X-FVER=3D"3.0" =
ORGYPOS=3D"0">
<DIV dir=3Dltr align=3Dleft><SPAN class=3D268012019-25112003><FONT =
size=3D2>The ACK=20
packets you see in your dump are probably being dropped at the firewall =
because=20
a state table entry does not exist.&nbsp; So you need to add a NEW rule =
to do=20
this:</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D268012019-25112003><FONT=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D268012019-25112003><FONT =
size=3D2><FONT=20
size=3D3>iptables&nbsp;-A FORWARD -i&nbsp;ppp0 -o&nbsp;eth0 -m state =
--state NEW=20
-j ACCEPT</FONT></FONT></SPAN></DIV>
<DIV><SPAN class=3D268012019-25112003><FONT size=3D2><FONT=20
size=3D3></FONT></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D268012019-25112003><FONT size=3D2><FONT size=3D3>this =
rule will=20
then allow your ESTABLISHED,RELATED rule to work and permit those ACK =
packets to=20
pass.</FONT></DIV>
<DIV dir=3Dltr align=3Dleft><BR></DIV></FONT></SPAN><BR>
<DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr align=3Dleft>
<HR tabIndex=3D-1>
<FONT face=3DTahoma size=3D2><B>From:</B> =
netfilter-admin@lists.netfilter.org=20
[mailto:netfilter-admin@lists.netfilter.org] <B>On Behalf Of=20
</B>adburne<BR><B>Sent:</B> Tuesday, November 25, 2003 4:18 =
AM<BR><B>To:</B>=20
netfilter@lists.netfilter.org<BR><B>Subject:</B> NAT &amp;=20
MySQL<BR></FONT><BR></DIV>
<DIV></DIV>
<TABLE id=3DINCREDIMAINTABLE cellSpacing=3D0 cellPadding=3D2 =
width=3D"100%" border=3D0>
  <TBODY>
  <TR>
    <TD id=3DINCREDITEXTREGION=20
    style=3D"FONT-SIZE: 12pt; CURSOR: auto; FONT-FAMILY: Arial" =
width=3D"100%">
      <DIV>Someone can make NAT with mysql? I've tried for a long time =
without=20
      make it work.</DIV>
      <DIV>&nbsp;</DIV>
      <DIV>My natural language is spanish, sorry by mistakes writing in=20
      english.</DIV>
      <DIV>&nbsp;</DIV>
      <DIV>This is the situation:</DIV>
      <DIV>&nbsp;</DIV>
      <DIV>I've have a linux box as gateway between my lan and internet =
routing=20
      paquets without problems, I need access from internet another =
linux box=20
      running apache and mysql on my private lan.</DIV>
      <DIV>To do this work I try to use nat; with apache all works ok, =
but with=20
      mysql can't connect. I'll be looking on different network devices =
using=20
      tcpdump to find what's wrong.</DIV>
      <DIV>&nbsp;</DIV>
      <DIV>This is what tcpdump show on device eth0 on my mysql server =
(inside=20
      the lan), there is a petition from 200.10.10.1 (internet client) =
to=20
      192.168.0.80 (mysql lan server), this&nbsp;reply with ack, but =
internet=20
      client don't </DIV>
      <DIV>reply. Any clue? =3D)</DIV>
      <DIV>&nbsp;</DIV>
      <DIV>200.10.10.1.56405 &gt; 192.168.0.80.3306: S =
2205542765:2205542765(0)=20
      win 5840 &lt;mss<BR>1412,sackOK,timestamp 620645629 0,nop,wscale =
0&gt;=20
      (DF)<BR>192.168.0.80.3306 &gt; 200.10.10.1.56405: S=20
      2497023396:2497023396(0) ack 2205542766<BR>&nbsp;win 5792 &lt;mss=20
      1460,sackOK,timestamp 95764658 620645629,nop,wscale 0&gt;=20
      (DF)<BR>200.10.10.1.56405 &gt; 192.168.0.80.3306: R=20
      2205542766:2205542766(0) win 0 (DF)<BR>200.10.10.1.56405 &gt;=20
      192.168.0.80.3306: S 2205542765:2205542765(0) win 5840=20
      &lt;mss<BR>1412,sackOK,timestamp 620648701 0,nop,wscale 0&gt;=20
      (DF)<BR>192.168.0.80.3306 &gt; 200.10.10.1.56405: S=20
      2503023731:2503023731(0) ack 2205542766<BR>&nbsp;win 5792 &lt;mss=20
      1460,sackOK,timestamp 95765258 620648701,nop,wscale 0&gt;=20
      (DF)<BR>200.10.10.1.56405 &gt; 192.168.0.80.3306: R=20
      2205542766:2205542766(0) win 0 (DF)<BR></DIV>
      <DIV>&nbsp;</DIV>
      <DIV>The forward rules on the gateway are:</DIV>
      <DIV>&nbsp;</DIV>
      <DIV>
      <DIV>#&nbsp;"Accept forward all connections to port 3306 on=20
      ppp0"<BR>iptables -A FORWARD -p tcp -i ppp0 --dport 3306 -o eth0 =
-j=20
      ACCEPT</DIV>
      <DIV>#&nbsp;"All stablished connections are =
ok"<BR>iptables&nbsp;-A=20
      FORWARD -i&nbsp;ppp0 -o&nbsp;eth0 -m state --state=20
      ESTABLISHED,RELATED&nbsp;-j ACCEPT<BR>#&nbsp;"All connection from =
inside=20
      to outside are accepted"<BR>iptables&nbsp;-A FORWARD -i&nbsp;eth0=20
      -o&nbsp;ppp0 -j ACCEPT</DIV>
      <DIV>#&nbsp;"Rest go away"</DIV>
      <DIV>iptables&nbsp;-A FORWARD -j REJECT</DIV>
      <DIV>&nbsp;</DIV>
      <DIV>NAT rule:</DIV>
      <DIV>iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 3306 -j =
DNAT=20
      --to 192.168.0.80 -s 200.10.10.1</DIV>
      <DIV>&nbsp;</DIV>
      <DIV>If someone can make the light turn on, thanks!!!!</DIV>
      <DIV>&nbsp;</DIV>
      <DIV>Alejandro</DIV>
      <DIV>&nbsp;</DIV></DIV></TD></TR>
  <TR>
    <TD id=3DINCREDIFOOTER width=3D"100%">
      <TABLE cellSpacing=3D0 cellPadding=3D0 width=3D"100%">
        <TBODY>
        <TR>
          <TD width=3D"100%"></TD>
          <TD id=3DINCREDISOUND vAlign=3Dbottom align=3Dmiddle></TD>
          <TD id=3DINCREDIANIM vAlign=3Dbottom=20
  =
align=3Dmiddle></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><SPAN =

id=3DIncrediStamp><SPAN dir=3Dltr><FONT face=3D"Arial, Helvetica, =
sans-serif"=20
size=3D2>________________________________________________________________=
_<BR><FONT=20
face=3D"Comic Sans MS" size=3D2><A=20
href=3D"http://www.incredimail.com/redir.asp?ad_id=3D310&amp;lang=3D10"><=
IMG alt=3D""=20
hspace=3D0 src=3D"cid:268012019@25112003-2959" align=3Dbaseline =
border=3D0></A>&nbsp;=20
<I>IncrediMail</I> - <B>El E-mail ha evolucionado finalmente</B> - =
</FONT><A=20
href=3D"http://www.incredimail.com/redir.asp?ad_id=3D310&amp;lang=3D10"><=
FONT=20
face=3D"Times New Roman" size=3D3><B><U>Haga clic=20
aqu=ED</U></B></FONT></A></SPAN></SPAN></FONT></BODY></HTML>

------=_NextPart_001_001D_01C3B346.98690D50--

------=_NextPart_000_001C_01C3B346.98669C50
Content-Type: image/gif;
	name="IMSTP.gif"
Content-Transfer-Encoding: base64
Content-ID: <268012019@25112003-2959>

R0lGODlhFAAPALMIAP9gAM9gAM8vAM9gL/+QL5AvAGAvAP9gL////wAAAAAAAAAAAAAAAAAAAAAA
AAAAACH/C05FVFNDQVBFMi4wAwEAAAAh+QQJFAAIACwAAAAAFAAPAAAEVRDJSaudJuudrxlEKI6B
URlCUYyjKpgYAKSgOBSCDEuGDKgrAtC3Q/R+hkPJEDgYCjpKr5A8WK9OaPFZwHoPqm3366VKyeRt
E30tVVRscMHDqV/u+AgAIfkEBWQACAAsAAAAABQADwAABBIQyUmrvTjrzbv/YCiOZGmeaAQAIfkE
CRQACAAsAgABABAADQAABEoQIUOrpXIOwrsPxiQUheeRAgUA49YNhbCqK1kS9grQhXGAhsDBUJgZ
AL2Dcqkk7ogFpvRAokSn0p4PO6UIuUsQggSmFjKXdAgRAQAh+QQFCgAIACwAAAAAFAAPAAAEEhDJ
Sau9OOvNu/9gKI5kaZ5oBAAh+QQJFAAIACwCAAEAEAANAAAEShAhQ6ulcg7Cuw/GJBSF55ECBQDj
1g2FsKorWRL2CtCFcYCGwMFQmBkAvYNyqSTuiAWm9ECiRKfSng87pQi5SxCCBKYWMpd0CBEBACH5
BAVkAAgALAAAAAAUAA8AAAQSEMlJq7046827/2AojmRpnmgEADs=

------=_NextPart_000_001C_01C3B346.98669C50--



