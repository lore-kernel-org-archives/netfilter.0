From: "Daniel Beckham" <danbeck-netfilter@dealnews.com>
Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but doesn't check out
Date: Wed, 5 Mar 2003 10:38:53 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005001c2e335$bee844a0$0a02010a@danbeck>
References: <OFB7840FE4.C0F00E27-ON80256CE0.0031E466@start-global.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0041_01C2E303.6AC46CA0"
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
To: Netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0041_01C2E303.6AC46CA0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm sending this in html format, hoping the dump lines won't wrap.   =
LOL, also, my original message was too long, so I've shortened it.. =
sorry if you all get one of these twice.

Using the configuration you suggested below, (the original configuration =
I tried and the one that made the most sense to me also) I've dumped =
both sides of the tunnel.  Below is the output.   From the data below, =
it's obvious that any outgoing packets with a full payload (the payload =
size is 1460)

i.e. 09:29:05.797718 10.1.2.10.3969 > 129.41.69.137.smtp: . =
165:1625(1460) ack 125 win 64116 (DF)

never make it to the tunnel interface.   This is why incoming imap =
appears to work just fine, but sending mail doesn't.

Again, this seems a bit crazy as my FORWARD chain specifically allows =
any traffic to and from eth1 and tun0.

$IPTABLES -A FORWARD -i tun+ -j ACCEPT       =20
$IPTABLES -A FORWARD -i tap+ -j ACCEPT
$IPTABLES -A FORWARD -i eth1 -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT


tcpdump data:

Firewall on the local side of the tunnel: (tun0)

09:29:04.986164 10.1.2.10.3969 > 10.1.1.7.smtp: S 266730469:266730469(0) =
win 64240 <mss 1460,nop,nop,sackOK> (DF)
09:29:05.031684 10.1.1.7.smtp > 10.1.2.10.3969: S 361700781:361700781(0) =
ack 266730470 win 5840 <mss 1460,nop,nop,sackOK> (DF)
09:29:05.032048 10.1.2.10.3969 > 10.1.1.7.smtp: . ack 1 win 64240 (DF)
09:29:05.070314 10.1.1.7.smtp > 10.1.2.10.3969: P 1:30(29) ack 1 win =
5840 (DF)
09:29:05.071048 10.1.2.10.3969 > 10.1.1.7.smtp: P 1:15(14) ack 30 win =
64211 (DF)
09:29:05.116340 10.1.1.7.smtp > 10.1.2.10.3969: . ack 15 win 5840 (DF)
09:29:05.117105 10.1.1.7.smtp > 10.1.2.10.3969: P 30:53(23) ack 15 win =
5840 (DF)
09:29:05.122915 10.1.2.10.3969 > 10.1.1.7.smtp: P 15:50(35) ack 53 win =
64188 (DF)
09:29:05.158822 10.1.1.7.smtp > 10.1.2.10.3969: P 53:61(8) ack 50 win =
5840 (DF)
09:29:05.159389 10.1.2.10.3969 > 10.1.1.7.smtp: P 50:81(31) ack 61 win =
64180 (DF)
09:29:05.199339 10.1.1.7.smtp > 10.1.2.10.3969: P 61:69(8) ack 81 win =
5840 (DF)
09:29:05.217269 10.1.2.10.3969 > 10.1.1.7.smtp: P 81:87(6) ack 69 win =
64172 (DF)
09:29:05.253722 10.1.1.7.smtp > 10.1.2.10.3969: P 69:82(13) ack 87 win =
5840 (DF)
09:29:05.461527 10.1.2.10.3969 > 10.1.1.7.smtp: . ack 82 win 64159 (DF)
09:29:05.489089 10.1.1.7.smtp > 10.1.2.10.3969: P 69:82(13) ack 87 win =
5840 (DF)
09:29:05.489324 10.1.2.10.3969 > 10.1.1.7.smtp: . ack 82 win 64159 (DF)
09:29:05.637836 10.1.2.10.3969 > 10.1.1.7.smtp: P 87:93(6) ack 82 win =
64159 (DF)
09:29:05.674820 10.1.1.7.smtp > 10.1.2.10.3969: P 82:95(13) ack 93 win =
5840 (DF)
09:29:05.675137 10.1.2.10.3969 > 10.1.1.7.smtp: P 93:128(35) ack 95 win =
64146 (DF)
09:29:05.711645 10.1.1.7.smtp > 10.1.2.10.3969: P 95:103(8) ack 128 win =
5840 (DF)
09:29:05.712153 10.1.2.10.3969 > 10.1.1.7.smtp: P 128:159(31) ack 103 =
win 64138 (DF)
09:29:05.760162 10.1.1.7.smtp > 10.1.2.10.3969: P 103:111(8) ack 159 win =
5840 (DF)
09:29:05.760485 10.1.2.10.3969 > 10.1.1.7.smtp: P 159:165(6) ack 111 win =
64130 (DF)
09:29:05.796928 10.1.1.7.smtp > 10.1.2.10.3969: P 111:125(14) ack 165 =
win 5840 (DF)
09:29:05.798040 10.1.2.10.3969 > 10.1.1.7.smtp: P 4545:4763(218) ack 125 =
win 64116 (DF)
09:29:05.798086 10.1.2.10.3969 > 10.1.1.7.smtp: P 4763:4768(5) ack 125 =
win 64116 (DF)
09:29:05.834350 10.1.1.7.smtp > 10.1.2.10.3969: . ack 165 win 5840 =
<nop,nop,sack sack 1 {4545:4763} > (DF)
09:29:05.846786 10.1.1.7.smtp > 10.1.2.10.3969: . ack 165 win 5840 =
<nop,nop,sack sack 1 {4545:4768} > (DF)

Remote side of the tunnel: (tun0)

12:08:10.673521 10.1.2.10.3969 > 10.1.1.7.smtp: S 266730469:266730469(0) =
win 64240 <mss 1460,nop,nop,sackOK> (DF)
12:08:10.674685 10.1.1.7.smtp > 10.1.2.10.3969: S 361700781:361700781(0) =
ack 266730470 win 5840 <mss 1460,nop,nop,sackOK> (DF)
12:08:10.718701 10.1.2.10.3969 > 10.1.1.7.smtp: . ack 1 win 64240 (DF)
12:08:10.722990 10.1.1.7.smtp > 10.1.2.10.3969: P 1:30(29) ack 1 win =
5840 (DF)
12:08:10.761777 10.1.2.10.3969 > 10.1.1.7.smtp: P 1:15(14) ack 30 win =
64211 (DF)
12:08:10.762026 10.1.1.7.smtp > 10.1.2.10.3969: . ack 15 win 5840 (DF)
12:08:10.762144 10.1.1.7.smtp > 10.1.2.10.3969: P 30:53(23) ack 15 win =
5840 (DF)
12:08:10.809779 10.1.2.10.3969 > 10.1.1.7.smtp: P 15:50(35) ack 53 win =
64188 (DF)
12:08:10.810126 10.1.1.7.smtp > 10.1.2.10.3969: P 53:61(8) ack 50 win =
5840 (DF)
12:08:10.846437 10.1.2.10.3969 > 10.1.1.7.smtp: P 50:81(31) ack 61 win =
64180 (DF)
12:08:10.851162 10.1.1.7.smtp > 10.1.2.10.3969: P 61:69(8) ack 81 win =
5840 (DF)
12:08:10.905777 10.1.2.10.3969 > 10.1.1.7.smtp: P 81:87(6) ack 69 win =
64172 (DF)
12:08:10.906068 10.1.1.7.smtp > 10.1.2.10.3969: P 69:82(13) ack 87 win =
5840 (DF)
12:08:11.139331 10.1.1.7.smtp > 10.1.2.10.3969: P 69:82(13) ack 87 win =
5840 (DF)
12:08:11.148104 10.1.2.10.3969 > 10.1.1.7.smtp: . ack 82 win 64159 (DF)
12:08:11.177095 10.1.2.10.3969 > 10.1.1.7.smtp: . ack 82 win 64159 (DF)
12:08:11.324853 10.1.2.10.3969 > 10.1.1.7.smtp: P 87:93(6) ack 82 win =
64159 (DF)
12:08:11.325240 10.1.1.7.smtp > 10.1.2.10.3969: P 82:95(13) ack 93 win =
5840 (DF)
12:08:11.363484 10.1.2.10.3969 > 10.1.1.7.smtp: P 93:128(35) ack 95 win =
64146 (DF)
12:08:11.363818 10.1.1.7.smtp > 10.1.2.10.3969: P 95:103(8) ack 128 win =
5840 (DF)
12:08:11.412066 10.1.2.10.3969 > 10.1.1.7.smtp: P 128:159(31) ack 103 =
win 64138 (DF)
12:08:11.412477 10.1.1.7.smtp > 10.1.2.10.3969: P 103:111(8) ack 159 win =
5840 (DF)
12:08:11.447083 10.1.2.10.3969 > 10.1.1.7.smtp: P 159:165(6) ack 111 win =
64130 (DF)
12:08:11.449412 10.1.1.7.smtp > 10.1.2.10.3969: P 111:125(14) ack 165 =
win 5840 (DF)
12:08:11.486836 10.1.2.10.3969 > 10.1.1.7.smtp: P 4545:4763(218) ack 125 =
win 64116 (DF)


Here is the interesting part:
Local side of the tunnel, but the eth1 (private network) interface:

09:29:04.986096 10.1.2.10.3969 > 129.41.69.137.smtp: S =
266730469:266730469(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
09:29:05.031723 129.41.69.137.smtp > 10.1.2.10.3969: S =
361700781:361700781(0) ack 266730470 win 5840 <mss 1460,nop,nop,sackOK> =
(DF)
09:29:05.032012 10.1.2.10.3969 > 129.41.69.137.smtp: . ack 1 win 64240 =
(DF)
09:29:05.070351 129.41.69.137.smtp > 10.1.2.10.3969: P 1:30(29) ack 1 =
win 5840 (DF)
09:29:05.071015 10.1.2.10.3969 > 129.41.69.137.smtp: P 1:15(14) ack 30 =
win 64211 (DF)
09:29:05.116376 129.41.69.137.smtp > 10.1.2.10.3969: . ack 15 win 5840 =
(DF)
09:29:05.117139 129.41.69.137.smtp > 10.1.2.10.3969: P 30:53(23) ack 15 =
win 5840 (DF)
09:29:05.122880 10.1.2.10.3969 > 129.41.69.137.smtp: P 15:50(35) ack 53 =
win 64188 (DF)
09:29:05.158861 129.41.69.137.smtp > 10.1.2.10.3969: P 53:61(8) ack 50 =
win 5840 (DF)
09:29:05.159354 10.1.2.10.3969 > 129.41.69.137.smtp: P 50:81(31) ack 61 =
win 64180 (DF)
09:29:05.199376 129.41.69.137.smtp > 10.1.2.10.3969: P 61:69(8) ack 81 =
win 5840 (DF)
09:29:05.217234 10.1.2.10.3969 > 129.41.69.137.smtp: P 81:87(6) ack 69 =
win 64172 (DF)
09:29:05.253760 129.41.69.137.smtp > 10.1.2.10.3969: P 69:82(13) ack 87 =
win 5840 (DF)
09:29:05.461468 10.1.2.10.3969 > 129.41.69.137.smtp: . ack 82 win 64159 =
(DF)
09:29:05.489124 129.41.69.137.smtp > 10.1.2.10.3969: P 69:82(13) ack 87 =
win 5840 (DF)
09:29:05.489289 10.1.2.10.3969 > 129.41.69.137.smtp: . ack 82 win 64159 =
(DF)
09:29:05.637796 10.1.2.10.3969 > 129.41.69.137.smtp: P 87:93(6) ack 82 =
win 64159 (DF)
09:29:05.674856 129.41.69.137.smtp > 10.1.2.10.3969: P 82:95(13) ack 93 =
win 5840 (DF)
09:29:05.675104 10.1.2.10.3969 > 129.41.69.137.smtp: P 93:128(35) ack 95 =
win 64146 (DF)
09:29:05.711681 129.41.69.137.smtp > 10.1.2.10.3969: P 95:103(8) ack 128 =
win 5840 (DF)
09:29:05.712122 10.1.2.10.3969 > 129.41.69.137.smtp: P 128:159(31) ack =
103 win 64138 (DF)
09:29:05.760198 129.41.69.137.smtp > 10.1.2.10.3969: P 103:111(8) ack =
159 win 5840 (DF)
09:29:05.760453 10.1.2.10.3969 > 129.41.69.137.smtp: P 159:165(6) ack =
111 win 64130 (DF)
09:29:05.796963 129.41.69.137.smtp > 10.1.2.10.3969: P 111:125(14) ack =
165 win 5840 (DF)
09:29:05.797718 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)
09:29:05.797843 10.1.2.10.3969 > 129.41.69.137.smtp: . 1625:3085(1460) =
ack 125 win 64116 (DF)
09:29:05.797966 10.1.2.10.3969 > 129.41.69.137.smtp: . 3085:4545(1460) =
ack 125 win 64116 (DF)
09:29:05.797994 10.1.2.10.3969 > 129.41.69.137.smtp: P 4545:4763(218) =
ack 125 win 64116 (DF)
09:29:05.798031 10.1.2.10.3969 > 129.41.69.137.smtp: P 4763:4768(5) ack =
125 win 64116 (DF)
09:29:05.834387 129.41.69.137.smtp > 10.1.2.10.3969: . ack 165 win 5840 =
<nop,nop,sack sack 1 {4545:4763} > (DF)
09:29:05.846822 129.41.69.137.smtp > 10.1.2.10.3969: . ack 165 win 5840 =
<nop,nop,sack sack 1 {4545:4768} > (DF)
09:29:05.847323 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)
09:29:05.847445 10.1.2.10.3969 > 129.41.69.137.smtp: . 1625:3085(1460) =
ack 125 win 64116 (DF)
09:29:05.847568 10.1.2.10.3969 > 129.41.69.137.smtp: . 3085:4545(1460) =
ack 125 win 64116 (DF)
09:29:06.555338 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)
09:29:08.195721 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)
09:29:11.367205 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)
09:29:17.819496 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)
09:29:30.614817 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)



------=_NextPart_000_0041_01C2E303.6AC46CA0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2723.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV><FONT face=3DArial size=3D2>I'm sending this in html format, hoping =
the dump=20
lines won't wrap.&nbsp; &nbsp;LOL, also, my original message was too =
long, so=20
I've shortened it.. sorry if you all get one of these =
twice.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Using the configuration you suggested=20
below,&nbsp;(the original configuration I tried and the one that made =
the most=20
sense to me also)&nbsp;I've dumped both sides of the tunnel.&nbsp; Below =
is the=20
output.&nbsp;&nbsp; From the data below, it's obvious that any outgoing =
packets=20
with a full payload (the payload&nbsp;size is 1460)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>i.e. 09:29:05.797718 10.1.2.10.3969 =
&gt;=20
129.41.69.137.smtp: . 165:1625(1460) ack 125 win 64116 (DF)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT>
<DIV><FONT face=3DArial size=3D2>never make it to the tunnel =
interface.&nbsp;&nbsp;=20
This is why incoming imap appears to work just fine, but sending mail=20
doesn't.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Again, this seems a bit crazy as my =
FORWARD chain=20
specifically allows any traffic to and from eth1 and tun0.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>$IPTABLES -A FORWARD -i tun+ -j=20
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR>$IPTABLES -A =
FORWARD -i=20
tap+ -j ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>$IPTABLES -A FORWARD -i eth1 -j =
ACCEPT<BR>$IPTABLES=20
-A FORWARD -m state --state ESTABLISHED,RELATED -j =
ACCEPT<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>tcpdump data:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Firewall on the local side of the =
tunnel:=20
(tun0)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>09:29:04.986164 10.1.2.10.3969 &gt; =
10.1.1.7.smtp:=20
S 266730469:266730469(0) win 64240 &lt;mss 1460,nop,nop,sackOK&gt;=20
(DF)<BR>09:29:05.031684 10.1.1.7.smtp &gt; 10.1.2.10.3969: S=20
361700781:361700781(0) ack 266730470 win 5840 &lt;mss =
1460,nop,nop,sackOK&gt;=20
(DF)<BR>09:29:05.032048 10.1.2.10.3969 &gt; 10.1.1.7.smtp: . ack 1 win =
64240=20
(DF)<BR>09:29:05.070314 10.1.1.7.smtp &gt; 10.1.2.10.3969: P 1:30(29) =
ack 1 win=20
5840 (DF)<BR>09:29:05.071048 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P =
1:15(14) ack=20
30 win 64211 (DF)<BR>09:29:05.116340 10.1.1.7.smtp &gt; 10.1.2.10.3969: =
. ack 15=20
win 5840 (DF)<BR>09:29:05.117105 10.1.1.7.smtp &gt; 10.1.2.10.3969: P =
30:53(23)=20
ack 15 win 5840 (DF)<BR>09:29:05.122915 10.1.2.10.3969 &gt; =
10.1.1.7.smtp: P=20
15:50(35) ack 53 win 64188 (DF)<BR>09:29:05.158822 10.1.1.7.smtp &gt;=20
10.1.2.10.3969: P 53:61(8) ack 50 win 5840 (DF)<BR>09:29:05.159389=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 50:81(31) ack 61 win 64180=20
(DF)<BR>09:29:05.199339 10.1.1.7.smtp &gt; 10.1.2.10.3969: P 61:69(8) =
ack 81 win=20
5840 (DF)<BR>09:29:05.217269 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P =
81:87(6) ack=20
69 win 64172 (DF)<BR>09:29:05.253722 10.1.1.7.smtp &gt; 10.1.2.10.3969: =
P=20
69:82(13) ack 87 win 5840 (DF)<BR>09:29:05.461527 10.1.2.10.3969 &gt;=20
10.1.1.7.smtp: . ack 82 win 64159 (DF)<BR>09:29:05.489089 10.1.1.7.smtp =
&gt;=20
10.1.2.10.3969: P 69:82(13) ack 87 win 5840 (DF)<BR>09:29:05.489324=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: . ack 82 win 64159 =
(DF)<BR>09:29:05.637836=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 87:93(6) ack 82 win 64159=20
(DF)<BR>09:29:05.674820 10.1.1.7.smtp &gt; 10.1.2.10.3969: P 82:95(13) =
ack 93=20
win 5840 (DF)<BR>09:29:05.675137 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P =
93:128(35)=20
ack 95 win 64146 (DF)<BR>09:29:05.711645 10.1.1.7.smtp &gt; =
10.1.2.10.3969: P=20
95:103(8) ack 128 win 5840 (DF)<BR>09:29:05.712153 10.1.2.10.3969 &gt;=20
10.1.1.7.smtp: P 128:159(31) ack 103 win 64138 (DF)<BR>09:29:05.760162=20
10.1.1.7.smtp &gt; 10.1.2.10.3969: P 103:111(8) ack 159 win 5840=20
(DF)<BR>09:29:05.760485 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 159:165(6) =
ack 111=20
win 64130 (DF)<BR>09:29:05.796928 10.1.1.7.smtp &gt; 10.1.2.10.3969: P=20
111:125(14) ack 165 win 5840 (DF)<BR>09:29:05.798040 10.1.2.10.3969 &gt; =

10.1.1.7.smtp: P 4545:4763(218) ack 125 win 64116 =
(DF)<BR>09:29:05.798086=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 4763:4768(5) ack 125 win 64116=20
(DF)<BR>09:29:05.834350 10.1.1.7.smtp &gt; 10.1.2.10.3969: . ack 165 win =
5840=20
&lt;nop,nop,sack sack 1 {4545:4763} &gt; (DF)<BR>09:29:05.846786 =
10.1.1.7.smtp=20
&gt; 10.1.2.10.3969: . ack 165 win 5840 &lt;nop,nop,sack sack 1 =
{4545:4768} &gt;=20
(DF)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT>
<DIV><FONT face=3DArial size=3D2>Remote side of the tunnel: =
(tun0)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>12:08:10.673521 10.1.2.10.3969 &gt; =
10.1.1.7.smtp:=20
S 266730469:266730469(0) win 64240 &lt;mss 1460,nop,nop,sackOK&gt;=20
(DF)<BR>12:08:10.674685 10.1.1.7.smtp &gt; 10.1.2.10.3969: S=20
361700781:361700781(0) ack 266730470 win 5840 &lt;mss =
1460,nop,nop,sackOK&gt;=20
(DF)<BR>12:08:10.718701 10.1.2.10.3969 &gt; 10.1.1.7.smtp: . ack 1 win =
64240=20
(DF)<BR>12:08:10.722990 10.1.1.7.smtp &gt; 10.1.2.10.3969: P 1:30(29) =
ack 1 win=20
5840 (DF)<BR>12:08:10.761777 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P =
1:15(14) ack=20
30 win 64211 (DF)<BR>12:08:10.762026 10.1.1.7.smtp &gt; 10.1.2.10.3969: =
. ack 15=20
win 5840 (DF)<BR>12:08:10.762144 10.1.1.7.smtp &gt; 10.1.2.10.3969: P =
30:53(23)=20
ack 15 win 5840 (DF)<BR>12:08:10.809779 10.1.2.10.3969 &gt; =
10.1.1.7.smtp: P=20
15:50(35) ack 53 win 64188 (DF)<BR>12:08:10.810126 10.1.1.7.smtp &gt;=20
10.1.2.10.3969: P 53:61(8) ack 50 win 5840 (DF)<BR>12:08:10.846437=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 50:81(31) ack 61 win 64180=20
(DF)<BR>12:08:10.851162 10.1.1.7.smtp &gt; 10.1.2.10.3969: P 61:69(8) =
ack 81 win=20
5840 (DF)<BR>12:08:10.905777 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P =
81:87(6) ack=20
69 win 64172 (DF)<BR>12:08:10.906068 10.1.1.7.smtp &gt; 10.1.2.10.3969: =
P=20
69:82(13) ack 87 win 5840 (DF)<BR>12:08:11.139331 10.1.1.7.smtp &gt;=20
10.1.2.10.3969: P 69:82(13) ack 87 win 5840 (DF)<BR>12:08:11.148104=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: . ack 82 win 64159 =
(DF)<BR>12:08:11.177095=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: . ack 82 win 64159 =
(DF)<BR>12:08:11.324853=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 87:93(6) ack 82 win 64159=20
(DF)<BR>12:08:11.325240 10.1.1.7.smtp &gt; 10.1.2.10.3969: P 82:95(13) =
ack 93=20
win 5840 (DF)<BR>12:08:11.363484 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P =
93:128(35)=20
ack 95 win 64146 (DF)<BR>12:08:11.363818 10.1.1.7.smtp &gt; =
10.1.2.10.3969: P=20
95:103(8) ack 128 win 5840 (DF)<BR>12:08:11.412066 10.1.2.10.3969 &gt;=20
10.1.1.7.smtp: P 128:159(31) ack 103 win 64138 (DF)<BR>12:08:11.412477=20
10.1.1.7.smtp &gt; 10.1.2.10.3969: P 103:111(8) ack 159 win 5840=20
(DF)<BR>12:08:11.447083 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 159:165(6) =
ack 111=20
win 64130 (DF)<BR>12:08:11.449412 10.1.1.7.smtp &gt; 10.1.2.10.3969: P=20
111:125(14) ack 165 win 5840 (DF)<BR>12:08:11.486836 10.1.2.10.3969 &gt; =

10.1.1.7.smtp: P 4545:4763(218) ack 125 win 64116 (DF)<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here is the interesting =
part:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Local side of the tunnel, but the eth1 =
(private=20
network) interface:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>09:29:04.986096 10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: S 266730469:266730469(0) win 64240 &lt;mss=20
1460,nop,nop,sackOK&gt; (DF)<BR>09:29:05.031723 129.41.69.137.smtp &gt;=20
10.1.2.10.3969: S 361700781:361700781(0) ack 266730470 win 5840 &lt;mss=20
1460,nop,nop,sackOK&gt; (DF)<BR>09:29:05.032012 10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: . ack 1 win 64240 (DF)<BR>09:29:05.070351 =
129.41.69.137.smtp=20
&gt; 10.1.2.10.3969: P 1:30(29) ack 1 win 5840 (DF)<BR>09:29:05.071015=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: P 1:15(14) ack 30 win 64211=20
(DF)<BR>09:29:05.116376 129.41.69.137.smtp &gt; 10.1.2.10.3969: . ack 15 =
win=20
5840 (DF)<BR>09:29:05.117139 129.41.69.137.smtp &gt; 10.1.2.10.3969: P =
30:53(23)=20
ack 15 win 5840 (DF)<BR>09:29:05.122880 10.1.2.10.3969 &gt; =
129.41.69.137.smtp:=20
P 15:50(35) ack 53 win 64188 (DF)<BR>09:29:05.158861 129.41.69.137.smtp =
&gt;=20
10.1.2.10.3969: P 53:61(8) ack 50 win 5840 (DF)<BR>09:29:05.159354=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: P 50:81(31) ack 61 win 64180=20
(DF)<BR>09:29:05.199376 129.41.69.137.smtp &gt; 10.1.2.10.3969: P =
61:69(8) ack=20
81 win 5840 (DF)<BR>09:29:05.217234 10.1.2.10.3969 &gt; =
129.41.69.137.smtp: P=20
81:87(6) ack 69 win 64172 (DF)<BR>09:29:05.253760 129.41.69.137.smtp =
&gt;=20
10.1.2.10.3969: P 69:82(13) ack 87 win 5840 (DF)<BR>09:29:05.461468=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: . ack 82 win 64159=20
(DF)<BR>09:29:05.489124 129.41.69.137.smtp &gt; 10.1.2.10.3969: P =
69:82(13) ack=20
87 win 5840 (DF)<BR>09:29:05.489289 10.1.2.10.3969 &gt; =
129.41.69.137.smtp: .=20
ack 82 win 64159 (DF)<BR>09:29:05.637796 10.1.2.10.3969 &gt; =
129.41.69.137.smtp:=20
P 87:93(6) ack 82 win 64159 (DF)<BR>09:29:05.674856 129.41.69.137.smtp =
&gt;=20
10.1.2.10.3969: P 82:95(13) ack 93 win 5840 (DF)<BR>09:29:05.675104=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: P 93:128(35) ack 95 win 64146=20
(DF)<BR>09:29:05.711681 129.41.69.137.smtp &gt; 10.1.2.10.3969: P =
95:103(8) ack=20
128 win 5840 (DF)<BR>09:29:05.712122 10.1.2.10.3969 &gt; =
129.41.69.137.smtp: P=20
128:159(31) ack 103 win 64138 (DF)<BR>09:29:05.760198 129.41.69.137.smtp =
&gt;=20
10.1.2.10.3969: P 103:111(8) ack 159 win 5840 (DF)<BR>09:29:05.760453=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: P 159:165(6) ack 111 win 64130=20
(DF)<BR>09:29:05.796963 129.41.69.137.smtp &gt; 10.1.2.10.3969: P =
111:125(14)=20
ack 165 win 5840 (DF)<BR>09:29:05.797718 10.1.2.10.3969 &gt; =
129.41.69.137.smtp:=20
. 165:1625(1460) ack 125 win 64116 (DF)<BR>09:29:05.797843 =
10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: . 1625:3085(1460) ack 125 win 64116 =
(DF)<BR>09:29:05.797966=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: . 3085:4545(1460) ack 125 win =
64116=20
(DF)<BR>09:29:05.797994 10.1.2.10.3969 &gt; 129.41.69.137.smtp: P =
4545:4763(218)=20
ack 125 win 64116 (DF)<BR>09:29:05.798031 10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: P 4763:4768(5) ack 125 win 64116 =
(DF)<BR>09:29:05.834387=20
129.41.69.137.smtp &gt; 10.1.2.10.3969: . ack 165 win 5840 =
&lt;nop,nop,sack sack=20
1 {4545:4763} &gt; (DF)<BR>09:29:05.846822 129.41.69.137.smtp &gt;=20
10.1.2.10.3969: . ack 165 win 5840 &lt;nop,nop,sack sack 1 {4545:4768} =
&gt;=20
(DF)<BR>09:29:05.847323 10.1.2.10.3969 &gt; 129.41.69.137.smtp: . =
165:1625(1460)=20
ack 125 win 64116 (DF)<BR>09:29:05.847445 10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: . 1625:3085(1460) ack 125 win 64116 =
(DF)<BR>09:29:05.847568=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: . 3085:4545(1460) ack 125 win =
64116=20
(DF)<BR>09:29:06.555338 10.1.2.10.3969 &gt; 129.41.69.137.smtp: . =
165:1625(1460)=20
ack 125 win 64116 (DF)<BR>09:29:08.195721 10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: . 165:1625(1460) ack 125 win 64116 =
(DF)<BR>09:29:11.367205=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: . 165:1625(1460) ack 125 win =
64116=20
(DF)<BR>09:29:17.819496 10.1.2.10.3969 &gt; 129.41.69.137.smtp: . =
165:1625(1460)=20
ack 125 win 64116 (DF)<BR>09:29:30.614817 10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: . 165:1625(1460) ack 125 win 64116 =
(DF)<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></DIV></BODY></HTML>

------=_NextPart_000_0041_01C2E303.6AC46CA0--



