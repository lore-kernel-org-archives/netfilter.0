From: "Milan Pavlovic" <mann@e-caffe.net>
Subject: DNAT 'problem'
Date: Fri, 14 Jun 2002 02:51:59 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <008201c2133d$b0978cd0$1e03a8c0@blickompanija.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_007F_01C2134E.73EF88D0"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_007F_01C2134E.73EF88D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
This is a little problem I can't solve for now; so I'm asking for help =
if something simple and obvious I have missed to do...

Well, on the x.x.x.x  box, for locally generated traffic, there should =
be dst address changed for every  packet going for y.y.y.y:25 (tcp) to =
z.z.z.z:25.=20
And i did:

#> iptables -I OUTPUT -t nat -p tcp -d y.y.y.y --dport 25 -j DNAT --to =
z.z.z.z:25

Now, when I try if this is working, there is no connection made:
#> telnet y.y.y.y 25  =20
Trying y.y.y.y ....


On the other hand, tethereal on the output interface (eth5) shows that =
first packet goes OK (dst changed, SYN flag set), 2nd get back also good =
(SYN,ACK, to the same source port), but the 3rd one, going out of box, =
put RST flag, and new source port........
=20
1.  X.X.X.X -> Z.Z.Z.Z TCP 50384 > 25 [SYN] Seq=3D1195885807 Ack=3D0 =
Win=3D5840 Len=3D0
2.  Z.Z.Z.Z -> X.X.X.X TCP 25 > 50384 [SYN, ACK] Seq=3D2431219150 =
Ack=3D1195885808 Win=3D8760 Len=3D0
3.  X.X.X.X -> Z.Z.Z.Z TCP 1037 > 25 [RST] Seq=3D1195885808 Ack=3D0 =
Win=3D0 Len=3D0
                                       ^^^^           ^^^^^
4.  Z.Z.Z.Z -> X.X.X.X TCP 25 > 50384 [SYN, ACK] Seq=3D2431219150 =
Ack=3D1195885808 Win=3D8760 Len=3D0
5.  X.X.X.X -> Z.Z.Z.Z TCP 1037 > 25 [RST] Seq=3D1195885808 Ack=3D0 =
Win=3D0 Len=3D0
6.  X.X.X.X -> Z.Z.Z.ZTCP 50384 > 25 [SYN] Seq=3D1195885807 Ack=3D0 =
Win=3D5840 Len=3D0
7.  Z.Z.Z.Z -> X.X.X.X TCP 25 > 50384 [ACK] Seq=3D2431219151 =
Ack=3D1195885808 Win=3D8760 Len=3D0
8.  X.X.X.X -> Z.Z.Z.ZTCP 1037 > 25 [RST] Seq=3D1195885808 Ack=3D0 =
Win=3D0 Len=3D0
9.  Z.Z.Z.Z -> X.X.X.XTCP 25 > 50384 [SYN, ACK] Seq=3D2431219150 =
Ack=3D1195885808 Win=3D8760 Len=3D0=20
10. X.X.X.X -> Z.Z.Z.ZTCP 1037 > 25 [RST] Seq=3D1195885808 Ack=3D0 =
Win=3D0 Len=3D0
...
...

By the way,this box has several interfaces, among which one is on local =
network eth0 (192.168.3.3), and  other, eth5 (x.x.x.x) is on ISP's LAN, =
so SNAT is done:

#> iptables -I POSTROUTING -t nat -i eth0 -o eth5 -d x.x.x.0/24 -j SNAT =
--to x.x.x.x=20

Also, (static) routing is ok...

So how can I transfer traffic destined to one mail server to other one, =
without changing DNS data for specific domain (ie MX record)??

------=_NextPart_000_007F_01C2134E.73EF88D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>This is a little problem I can't solve =
for now; so=20
I'm asking for help if something simple and obvious I have missed to=20
do...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Well, on the&nbsp;x.x.x.x&nbsp; box, =
for locally=20
generated traffic,&nbsp;there should be dst address changed for=20
every&nbsp;&nbsp;packet going for y.y.y.y:25 (tcp) to=20
z.z.z.z:25.&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>And i did:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>#&gt; iptables -I OUTPUT -t nat -p tcp =
-d=20
y.y.y.y&nbsp;--dport 25 -j DNAT --to z.z.z.z:25</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Now, when I try&nbsp;if this is =
working, there is=20
no connection made:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>#&gt; telnet y.y.y.y=20
25&nbsp;&nbsp;&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Trying y.y.y.y ....</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>On the other hand, tethereal on the =
output=20
interface (eth5)&nbsp;shows that first packet goes OK (dst changed, SYN =
flag=20
set), 2nd get back also good (SYN,ACK, to the same source port), but the =
3rd=20
one, going out of box, put RST flag, and new source =
port........</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>1.&nbsp; =
X.X.X.X&nbsp;-&gt;&nbsp;Z.Z.Z.Z TCP 50384=20
&gt; 25 [SYN] Seq=3D1195885807 Ack=3D0 Win=3D5840 Len=3D0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>2.&nbsp; Z.Z.Z.Z -&gt; X.X.X.X TCP 25 =
&gt; 50384=20
[SYN, ACK] Seq=3D2431219150 Ack=3D1195885808 Win=3D8760 =
Len=3D0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>3.&nbsp; X.X.X.X -&gt; Z.Z.Z.Z TCP 1037 =
&gt; 25=20
[RST] Seq=3D1195885808 Ack=3D0 Win=3D0 Len=3D0</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;^^^^&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
^^^^^</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>4.&nbsp; Z.Z.Z.Z -&gt; X.X.X.X TCP 25 =
&gt; 50384=20
[SYN, ACK] Seq=3D2431219150 Ack=3D1195885808 Win=3D8760 =
Len=3D0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>5.&nbsp; X.X.X.X -&gt; Z.Z.Z.Z TCP 1037 =
&gt; 25=20
[RST] Seq=3D1195885808 Ack=3D0 Win=3D0 Len=3D0<BR>6.&nbsp; X.X.X.X -&gt; =
Z.Z.Z.ZTCP=20
50384 &gt; 25 [SYN] Seq=3D1195885807 Ack=3D0 Win=3D5840 =
Len=3D0<BR>7.&nbsp; Z.Z.Z.Z=20
-&gt; X.X.X.X TCP 25 &gt; 50384 [ACK] Seq=3D2431219151 Ack=3D1195885808 =
Win=3D8760=20
Len=3D0<BR>8.&nbsp; X.X.X.X -&gt; Z.Z.Z.ZTCP 1037 &gt; 25 [RST] =
Seq=3D1195885808=20
Ack=3D0 Win=3D0 Len=3D0<BR>9.&nbsp; Z.Z.Z.Z -&gt; X.X.X.XTCP 25 &gt; =
50384 [SYN, ACK]=20
Seq=3D2431219150 Ack=3D1195885808 Win=3D8760 Len=3D0 </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>10. X.X.X.X -&gt; Z.Z.Z.ZTCP 1037 &gt; =
25 [RST]=20
Seq=3D1195885808 Ack=3D0 Win=3D0 Len=3D0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>By the way,t</FONT><FONT face=3DArial =
size=3D2>his box=20
has several interfaces, among which one is on local network eth0 =
(192.168.3.3),=20
and&nbsp; other, eth5 (x.x.x.x)&nbsp;is on&nbsp;ISP's LAN, so SNAT is=20
done:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>#&gt; iptables&nbsp;-I POSTROUTING -t =
nat -i eth0=20
-o eth5 -d x.x.x.0/24 -j SNAT --to x.x.x.x&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Also, (static) routing is =
ok...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So how can I transfer =
traffic&nbsp;destined=20
to&nbsp;one mail server to other one, without changing DNS data for =
specific=20
domain (ie MX record)??</FONT></DIV></BODY></HTML>

------=_NextPart_000_007F_01C2134E.73EF88D0--



