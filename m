From: "Jay Levitt" <jay-netfilter@shopwatch.org>
Subject: Wayward RST packets - what's the right answer?
Date: Thu, 25 Mar 2004 23:29:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ca01c412ea$e24fe2f0$9701a8c0@office>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00C7_01C412C0.F96DF410"
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

------=_NextPart_000_00C7_01C412C0.F96DF410
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This message has popped up on the list a few times over the years, but I =
can't find a definitive answer on the best solution for it.

Fairly often - as in a few times an hour on a very, very underused =
server - I get repeated RST packets from hosts I've recently been =
talking to, but that conntrack thinks aren't part of a connection.  My =
rule:

iptables -A INPUT -p tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state =
--state NEW -j LOG --log-prefix "Stealth scan attempt"=20
iptables -A INPUT -p tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state =
--state NEW -j DROP=20

I then get multiple log entries like:

Mar 25 23:19:05 linux kernel: Stealth scan attemptIN=3Deth0 OUT=3D =
MAC=3D00:50:2c:01:62:8e:00:20:78:d0:44:8f:08:00 SRC=3D208.185.179.12 =
DST=3D192.168.1.150 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D47 ID=3D6376 =
PROTO=3DTCP SPT=3D2046 DPT=3D25 WINDOW=3D0 RES=3D0x00 RST URGP=3D0=20

with occasional, "related" (semantically, not conntrack-ily) outbound =
traffic:

Mar 25 23:19:05 linux kernel: Rejected output by default:IN=3D =
OUT=3Deth0 SRC=3D192.168.1.150 DST=3D208.185.179.12 LEN=3D100 TOS=3D0x00 =
PREC=3D0x00 TTL=3D64 ID=3D58139 DF PROTO=3DTCP SPT=3D25 DPT=3D2046 =
WINDOW=3D9216 RES=3D0x00 ACK PSH FIN URGP=3D0=20

Obviously these aren't genuine scans.  Is there any rule I could use =
that would let the RST do whatever it's trying to do and gracefully =
close down the connection instead of logging it?  I am almost to the =
point of not bothering to log iptables output, since I'm not entirely =
sure what I would do if I did see an attack anyway... but certainly, =
right now, what's being logged is noise, and I'd like to improve my SNR. =
 Suggestions?

Jay Levitt
------=_NextPart_000_00C7_01C412C0.F96DF410
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>This message has popped up on the list =
a few times=20
over the years, but I can't find a definitive answer on the best =
solution for=20
it.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Fairly often - as in a few times an =
hour on a very,=20
very underused server - I get repeated RST packets from hosts I've =
recently been=20
talking to, but that conntrack thinks aren't part of a connection.&nbsp; =
My=20
rule:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A INPUT -p tcp ! --tcp-flags=20
FIN,SYN,RST,ACK SYN -m state --state NEW -j LOG --log-prefix "Stealth =
scan=20
attempt" <BR>iptables -A INPUT -p tcp ! --tcp-flags FIN,SYN,RST,ACK SYN =
-m state=20
--state NEW -j DROP </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I then get multiple log entries =
like:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Mar 25 23:19:05 linux kernel: Stealth =
scan=20
attemptIN=3Deth0 OUT=3D MAC=3D00:50:2c:01:62:8e:00:20:78:d0:44:8f:08:00=20
SRC=3D208.185.179.12 DST=3D192.168.1.150 LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D47 ID=3D6376=20
PROTO=3DTCP SPT=3D2046 DPT=3D25 WINDOW=3D0 RES=3D0x00 RST URGP=3D0 =
<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>with occasional, "related" =
(semantically, not=20
conntrack-ily) outbound traffic:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Mar 25 23:19:05 linux kernel: Rejected =
output by=20
default:IN=3D OUT=3Deth0 SRC=3D192.168.1.150 DST=3D208.185.179.12 =
LEN=3D100 TOS=3D0x00=20
PREC=3D0x00 TTL=3D64 ID=3D58139 DF PROTO=3DTCP SPT=3D25 DPT=3D2046 =
WINDOW=3D9216 RES=3D0x00 ACK=20
PSH FIN URGP=3D0 </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Obviously these aren't genuine =
scans.&nbsp; Is=20
there any rule I could use that would let the RST do whatever it's =
trying to do=20
and gracefully close down the connection instead of logging it?&nbsp; I =
am=20
almost to the point of not bothering to log iptables output, since I'm =
not=20
entirely sure what I would do if I did see an attack anyway... but =
certainly,=20
right now, what's being logged is noise, and I'd like to improve my =
SNR.&nbsp;=20
Suggestions?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Jay Levitt</FONT></DIV></BODY></HTML>

------=_NextPart_000_00C7_01C412C0.F96DF410--


