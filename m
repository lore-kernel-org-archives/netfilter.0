From: "adburne" <adburne@asocmedrosario.com.ar>
Subject: NAT & MySQL
Date: Tue, 25 Nov 2003 09:17:32 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC3485C.000009.00204@adburne>
Mime-Version: 1.0
Content-Type: Multipart/related;
  type="multipart/alternative";
  boundary="------------Boundary-00=_85QWMY50000000000000"
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


--------------Boundary-00=_85QWMY50000000000000
Content-Type: Multipart/Alternative;
  boundary="------------Boundary-00=_85QWH890000000000000"


--------------Boundary-00=_85QWH890000000000000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Someone can make NAT with mysql? I've tried for a long time without make =
it
work.=0D
=0D
My natural language is spanish, sorry by mistakes writing in english.=0D
=0D
This is the situation:=0D
=0D
I've have a linux box as gateway between my lan and internet routing paqu=
ets
without problems, I need access from internet another linux box running
apache and mysql on my private lan.=0D
To do this work I try to use nat; with apache all works ok, but with mysq=
l
can't connect. I'll be looking on different network devices using tcpdump=
 to
find what's wrong.=0D
=0D
This is what tcpdump show on device eth0 on my mysql server (inside the l=
an)
 there is a petition from 200.10.10.1 (internet client) to 192.168.0.80
(mysql lan server), this reply with ack, but internet client don't =0D
reply. Any clue? =3D)=0D
=0D
200.10.10.1.56405 > 192.168.0.80.3306: S 2205542765:2205542765(0) win 584=
0
<mss=0D
1412,sackOK,timestamp 620645629 0,nop,wscale 0> (DF)=0D
192.168.0.80.3306 > 200.10.10.1.56405: S 2497023396:2497023396(0) ack
2205542766=0D
 win 5792 <mss 1460,sackOK,timestamp 95764658 620645629,nop,wscale 0> (DF=
)=0D
200.10.10.1.56405 > 192.168.0.80.3306: R 2205542766:2205542766(0) win 0 (=
DF)=0D
200.10.10.1.56405 > 192.168.0.80.3306: S 2205542765:2205542765(0) win 584=
0
<mss=0D
1412,sackOK,timestamp 620648701 0,nop,wscale 0> (DF)=0D
192.168.0.80.3306 > 200.10.10.1.56405: S 2503023731:2503023731(0) ack
2205542766=0D
 win 5792 <mss 1460,sackOK,timestamp 95765258 620648701,nop,wscale 0> (DF=
)=0D
200.10.10.1.56405 > 192.168.0.80.3306: R 2205542766:2205542766(0) win 0 (=
DF)=0D
=0D
=0D
The forward rules on the gateway are:=0D
=0D
# "Accept forward all connections to port 3306 on ppp0"=0D
iptables -A FORWARD -p tcp -i ppp0 --dport 3306 -o eth0 -j ACCEPT=0D
# "All stablished connections are ok"=0D
iptables -A FORWARD -i ppp0 -o eth0 -m state --state ESTABLISHED,RELATED =
-j
ACCEPT=0D
# "All connection from inside to outside are accepted"=0D
iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT=0D
# "Rest go away"=0D
iptables -A FORWARD -j REJECT=0D
=0D
NAT rule:=0D
iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 3306 -j DNAT --to 19=
2
168.0.80 -s 200.10.10.1=0D
=0D
If someone can make the light turn on, thanks!!!!=0D
=0D
Alejandro
--------------Boundary-00=_85QWH890000000000000
Content-Type: Text/HTML;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Diso-8859-=
1">
<META content=3D"IncrediMail 1.0" name=3DGENERATOR>
<!--IncrdiXMLRemarkStart>
<IncrdiX-Info>
<X-FID>FLAVOR00-NONE-0000-0000-000000000000</X-FID>
<X-FVER>3.0</X-FVER>
<X-CNT>;</X-CNT>
</IncrdiX-Info>
<IncrdiXMLRemarkEnd-->
</HEAD>
<BODY style=3D"BACKGROUND-POSITION: 0px 0px; FONT-SIZE: 12pt; MARGIN: 5px=
 10px 10px; FONT-FAMILY: Arial" bgColor=3D#ffffff background=3D"" scroll=3D=
yes ORGYPOS=3D"0" X-FVER=3D"3.0">
<TABLE id=3DINCREDIMAINTABLE cellSpacing=3D0 cellPadding=3D2 width=3D"100=
%" border=3D0>
<TBODY>
<TR>
<TD id=3DINCREDITEXTREGION style=3D"FONT-SIZE: 12pt; CURSOR: auto; FONT-F=
AMILY: Arial" width=3D"100%">
<DIV>Someone can make NAT with mysql? I've tried for a long time without =
make it work.</DIV>
<DIV>&nbsp;</DIV>
<DIV>My natural language is spanish, sorry by mistakes writing in english=
=2E</DIV>
<DIV>&nbsp;</DIV>
<DIV>This is the situation:</DIV>
<DIV>&nbsp;</DIV>
<DIV>I've have a linux box as gateway between my lan and internet routing=
 paquets without problems, I need access from internet another linux box =
running apache and mysql on my private lan.</DIV>
<DIV>To do this work I try to use nat; with apache all works ok, but with=
 mysql can't connect. I'll be looking on different network devices using =
tcpdump to find what's wrong.</DIV>
<DIV>&nbsp;</DIV>
<DIV>This is what tcpdump show on device eth0 on my mysql server (inside =
the lan), there is a petition from 200.10.10.1 (internet client) to 192.1=
68.0.80 (mysql lan server), this&nbsp;reply with ack, but internet client=
 don't </DIV>
<DIV>reply. Any clue? =3D)</DIV>
<DIV>&nbsp;</DIV>
<DIV>200.10.10.1.56405 &gt; 192.168.0.80.3306: S 2205542765:2205542765(0)=
 win 5840 &lt;mss<BR>1412,sackOK,timestamp 620645629 0,nop,wscale 0&gt; (=
DF)<BR>192.168.0.80.3306 &gt; 200.10.10.1.56405: S 2497023396:2497023396(=
0) ack 2205542766<BR>&nbsp;win 5792 &lt;mss 1460,sackOK,timestamp 9576465=
8 620645629,nop,wscale 0&gt; (DF)<BR>200.10.10.1.56405 &gt; 192.168.0.80.=
3306: R 2205542766:2205542766(0) win 0 (DF)<BR>200.10.10.1.56405 &gt; 192=
=2E168.0.80.3306: S 2205542765:2205542765(0) win 5840 &lt;mss<BR>1412,sac=
kOK,timestamp 620648701 0,nop,wscale 0&gt; (DF)<BR>192.168.0.80.3306 &gt;=
 200.10.10.1.56405: S 2503023731:2503023731(0) ack 2205542766<BR>&nbsp;wi=
n 5792 &lt;mss 1460,sackOK,timestamp 95765258 620648701,nop,wscale 0&gt; =
(DF)<BR>200.10.10.1.56405 &gt; 192.168.0.80.3306: R 2205542766:2205542766=
(0) win 0 (DF)<BR></DIV>
<DIV>&nbsp;</DIV>
<DIV>The forward rules on the gateway are:</DIV>
<DIV>&nbsp;</DIV>
<DIV>
<DIV>#&nbsp;"Accept forward all connections to port 3306 on ppp0"<BR>ipta=
bles -A FORWARD -p tcp -i ppp0 --dport 3306 -o eth0 -j ACCEPT</DIV>
<DIV>#&nbsp;"All stablished connections are ok"<BR>iptables&nbsp;-A FORWA=
RD -i&nbsp;ppp0 -o&nbsp;eth0 -m state --state ESTABLISHED,RELATED&nbsp;-j=
 ACCEPT<BR>#&nbsp;"All connection from inside to outside are accepted"<BR=
>iptables&nbsp;-A FORWARD -i&nbsp;eth0 -o&nbsp;ppp0 -j ACCEPT</DIV>
<DIV>#&nbsp;"Rest go away"</DIV>
<DIV>iptables&nbsp;-A FORWARD -j REJECT</DIV>
<DIV>&nbsp;</DIV>
<DIV>NAT rule:</DIV>
<DIV>iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 3306 -j DNAT --=
to 192.168.0.80 -s 200.10.10.1</DIV>
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
<TD id=3DINCREDIANIM vAlign=3Dbottom align=3Dmiddle></TD></TR></TBODY></T=
ABLE></TD></TR></TBODY></TABLE><SPAN id=3DIncrediStamp><SPAN dir=3Dltr><F=
ONT face=3D"Arial, Helvetica, sans-serif" size=3D2>______________________=
___________________________________________<BR><FONT face=3D"Comic Sans M=
S" size=3D2><A href=3D"http://www.incredimail.com/redir.asp?ad_id=3D310&a=
mp;lang=3D10"><IMG alt=3D"" hspace=3D0 src=3D"cid:0E1EA367-1F3C-11D8-B817=
-00805F579555" align=3Dbaseline border=3D0></A>&nbsp; <I>IncrediMail</I> =
- <B>El E-mail ha evolucionado finalmente</B> - </FONT><A href=3D"http://=
www.incredimail.com/redir.asp?ad_id=3D310&amp;lang=3D10"><FONT face=3D"Ti=
mes New Roman" size=3D3><B><U>Haga clic aqu=ED</U></B></FONT></A></SPAN><=
/SPAN></FONT></BODY></HTML>
--------------Boundary-00=_85QWH890000000000000--

--------------Boundary-00=_85QWMY50000000000000
Content-Type: image/gif;
  name="IMSTP.gif"
Content-Transfer-Encoding: base64
Content-ID: <0E1EA367-1F3C-11D8-B817-00805F579555>

R0lGODlhFAAPALMIAP9gAM9gAM8vAM9gL/+QL5AvAGAvAP9gL////wAAAAAAAAAAAAAAAAAAAAAA
AAAAACH/C05FVFNDQVBFMi4wAwEAAAAh+QQJFAAIACwAAAAAFAAPAAAEVRDJSaudJuudrxlEKI6B
URlCUYyjKpgYAKSgOBSCDEuGDKgrAtC3Q/R+hkPJEDgYCjpKr5A8WK9OaPFZwHoPqm3366VKyeRt
E30tVVRscMHDqV/u+AgAIfkEBWQACAAsAAAAABQADwAABBIQyUmrvTjrzbv/YCiOZGmeaAQAIfkE
CRQACAAsAgABABAADQAABEoQIUOrpXIOwrsPxiQUheeRAgUA49YNhbCqK1kS9grQhXGAhsDBUJgZ
AL2Dcqkk7ogFpvRAokSn0p4PO6UIuUsQggSmFjKXdAgRAQAh+QQFCgAIACwAAAAAFAAPAAAEEhDJ
Sau9OOvNu/9gKI5kaZ5oBAAh+QQJFAAIACwCAAEAEAANAAAEShAhQ6ulcg7Cuw/GJBSF55ECBQDj
1g2FsKorWRL2CtCFcYCGwMFQmBkAvYNyqSTuiAWm9ECiRKfSng87pQi5SxCCBKYWMpd0CBEBACH5
BAVkAAgALAAAAAAUAA8AAAQSEMlJq7046827/2AojmRpnmgEADs=

--------------Boundary-00=_85QWMY50000000000000--


