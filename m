From: "eNet" <nt@enet.org.al>
Subject: iptables delay connection phase
Date: Mon, 30 Jun 2003 09:14:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002d01c33ed7$360fc600$8101a8c0@tani>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002A_01C33EE7.F98DE7A0"
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

------=_NextPart_000_002A_01C33EE7.F98DE7A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello List,

I am new in iptables and list.

I have problem when my dialup clients trying to check their emails. =
There is a delay because of iptables. On that box I use linux kernel =
2.4.19 and rc.firewall=20

Here are more details of what is happening:


Case  1. without iptables . It is OK. No delay.

19:45:51.756818 arp who-has xxx.xxx.xxx.1 tell xxx.xxx.xxx.129
19:45:51.756837 arp reply xxx.xxx.xxx.1 is-at yy:yy:yy:yy:yy
19:45:51.756920 xxx.xxx.xxx.129.2814 > NS1.enet.org.al.pop3: S =
1490445489:1490445489(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)
19:45:51.756988 NS1.enet.org.al.pop3 > xxx.xxx.xxx.129.2814: S =
401842756:401842756(0) ack 1490445490 win 5840 <mss 1460,nop,nop,sackOK> =

(DF)
19:45:51.757102 xxx.xxx.xxx.129.2814 > NS1.enet.org.al.pop3: . ack 1 win =
17520 (DF)
19:45:51.761677 xxx.xxx.xxx.1.48021 > xxx.xxx.xxx.129.auth: S =
387191140:387191140(0) win 5840 <mss 1460,sackOK,timestamp 251690774=20
0,nop,wscale 0> (DF) 19:45:51.761856 xxx.xxx.xxx.129.auth > =
xxx.xxx.xxx.1.48021: R 0:0(0) ack 387191141 win 0
=20
etc...

Case 2.  iptables activated. Problem: delay

20:00:43.670848 xxx.xxx.xxx.129.2824 > NS1.enet.org.al.pop3: S =
1713847144:1713847144(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)
20:00:43.670903 NS1.enet.org.al.pop3 > xxx.xxx.xxx.129.2824: S =
1342878817:1342878817(0) ack 1713847145 win 5840 <mss =
1460,nop,nop,sackOK>=20
(DF)
20:00:43.671015 xxx.xxx.xxx.129.2824 > NS1.enet.org.al.pop3: . ack 1 win =
17520 (DF)
20:00:43.672185 xxx.xxx.xxx.1.48326 > xxx.xxx.xxx.129.auth: S =
1340299399:1340299399(0) win 5840 <mss 1460,sackOK,timestamp 251779965=20
0,nop,wscale 0> (DF)


now it goes around (!!!!!??)
=20
20:00:43.672291 xxx.xxx.xxx.129.auth > xxx.xxx.xxx.1.48326: R 0:0(0) ack =
1340299400 win 0
20:00:46.666594 xxx.xxx.xxx.1.48326 > xxx.xxx.xxx.129.auth: S =
1340299399:1340299399(0) win 5840 <mss 1460,sackOK,timestamp 251780265=20
0,nop,wscale 0> (DF)
20:00:46.666744 192.168.1.129.auth > xxx.xxx.xxx.1.48326: R 0:0(0) ack 1 =
win=20
0
20:00:52.666607 192.168.1.1.48326 > xxx.xxx.xxx.129.auth: S=20
1340299399:1340299399(0) win 5840 <mss 1460,sackOK,timestamp 251780865=20
0,nop,wscale 0> (DF)
20:00:52.666754 xxx.xxx.xxx.129.auth > xxx.xxx.xxx.1.48326: R 0:0(0) ack =
1 win=20
0

untill here:

20:01:04.666637 xxx.xxx.xxx.1.48326 > xxx.xxx.xxx.129.auth: S =
1340299399:1340299399(0) win 5840 <mss 1460,sackOK,timestamp 251782065=20
0,nop,wscale 0> (DF)

etc....=20

Any help appreciated.

Tani



------=_NextPart_000_002A_01C33EE7.F98DE7A0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello List,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am new in iptables and =
list.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have problem when my dialup clients =
trying to=20
check their emails. There is a delay because of iptables. On that box I =
use=20
linux kernel 2.4.19 and rc.firewall </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here are more details of what is=20
happening:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><BR>Case&nbsp; 1. without iptables . It =
is OK. No=20
delay.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><BR>19:45:51.756818 arp who-has =
xxx.xxx.xxx.1 tell=20
xxx.xxx.xxx.129<BR>19:45:51.756837 arp reply xxx.xxx.xxx.1 is-at=20
yy:yy:yy:yy:yy<BR>19:45:51.756920 <STRONG>xxx.xxx.xxx.129.2814 &gt;=20
NS1.enet.org.al.pop3: </STRONG>S 1490445489:1490445489(0) win 16384 =
&lt;mss=20
1460,nop,nop,sackOK&gt; (DF)<BR>19:45:51.756988 =
<STRONG>NS1.enet.org.al.pop3=20
&gt; xxx.xxx.xxx.129.2814</STRONG>: S 401842756:401842756(0) ack =
1490445490 win=20
5840 &lt;mss 1460,nop,nop,sackOK&gt; <BR>(DF)<BR>19:45:51.757102=20
<STRONG>xxx.xxx.xxx.129.2814 &gt; NS1.enet.org.al.pop3: </STRONG>. ack 1 =
win=20
17520 (DF)<BR>19:45:51.761677 <STRONG>xxx.xxx.xxx.1.48021 &gt;=20
xxx.xxx.xxx.129.auth: </STRONG>S 387191140:387191140(0) win 5840 &lt;mss =

1460,sackOK,timestamp 251690774 <BR>0,nop,wscale 0&gt; (DF) =
19:45:51.761856=20
<STRONG>xxx.xxx.xxx.129.auth &gt; xxx.xxx.xxx.1.48021</STRONG>: R 0:0(0) =
ack=20
387191141 win 0</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>etc...<BR><BR>Case 2.  iptables =
activated. Problem:=20
delay</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><BR>20:00:43.670848 =
<STRONG>xxx.xxx.xxx.129.2824=20
&gt; NS1.enet.org.al.pop3:</STRONG> S 1713847144:1713847144(0) win 16384 =
&lt;mss=20
1460,nop,nop,sackOK&gt; (DF)<BR>20:00:43.670903 =
<STRONG>NS1.enet.org.al.pop3=20
&gt; xxx.xxx.xxx.129.2824: </STRONG>S 1342878817:1342878817(0) ack =
1713847145=20
win 5840 &lt;mss 1460,nop,nop,sackOK&gt; <BR>(DF)<BR>20:00:43.671015=20
<STRONG>xxx.xxx.xxx.129.2824 &gt; NS1.enet.org.al.pop3: </STRONG>. ack 1 =
win=20
17520 (DF)<BR>20:00:43.672185 <STRONG>xxx.xxx.xxx.1.48326 &gt;=20
xxx.xxx.xxx.129.auth:</STRONG> S 1340299399:1340299399(0) win 5840 =
&lt;mss=20
1460,sackOK,timestamp 251779965 <BR>0,nop,wscale 0&gt; =
(DF)<BR></DIV></FONT>
<DIV>&nbsp;</DIV>
<DIV>now it goes around (!!!!!??)</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT>
<DIV><FONT face=3DArial size=3D2>20:00:43.672291 xxx.xxx.xxx.129.auth =
&gt;=20
xxx.xxx.xxx.1.48326: R 0:0(0) ack 1340299400 win 0<BR>20:00:46.666594=20
xxx.xxx.xxx.1.48326 &gt; xxx.xxx.xxx.129.auth: S =
1340299399:1340299399(0) win=20
5840 &lt;mss 1460,sackOK,timestamp 251780265 <BR>0,nop,wscale 0&gt;=20
(DF)<BR>20:00:46.666744 192.168.1.129.auth &gt; xxx.xxx.xxx.1.48326: R =
0:0(0)=20
ack 1 win <BR>0<BR>20:00:52.666607 192.168.1.1.48326 &gt; =
xxx.xxx.xxx.129.auth:=20
S <BR>1340299399:1340299399(0) win 5840 &lt;mss 1460,sackOK,timestamp =
251780865=20
<BR>0,nop,wscale 0&gt; (DF)<BR>20:00:52.666754 xxx.xxx.xxx.129.auth &gt; =

xxx.xxx.xxx.1.48326: R 0:0(0) ack 1 win <BR>0<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>untill here:</DIV></FONT>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>20:01:04.666637 =
<STRONG>xxx.xxx.xxx.1.48326 &gt;=20
xxx.xxx.xxx.129.auth: </STRONG>S 1340299399:1340299399(0) win 5840 =
&lt;mss=20
1460,sackOK,timestamp 251782065 <BR>0,nop,wscale 0&gt; =
(DF)<BR></DIV></FONT>
<DIV><FONT face=3DArial size=3D2>etc.... </DIV></FONT>
<DIV>&nbsp;</DIV>
<DIV>Any help appreciated.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Tani</DIV>
<DIV>&nbsp;</DIV></FONT>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_002A_01C33EE7.F98DE7A0--


