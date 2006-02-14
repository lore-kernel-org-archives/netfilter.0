From: =?ISO-8859-2?Q?Keser=FB_Korn=E9l?= <keseruk@freemail.hu>
Subject: lost UDP packets with matching NAT rules
Date: Tue, 14 Feb 2006 10:34:05 +0100 (CET)
Message-ID: <freemail.20060114103405.20767@fm05.freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Dear List Members,

I'm using iptables (v1.3.4 on a 2.6.15.3 kernel) in order to NAT incoming=
=20
UDP packets arriving on a single IP:port (1-1 rules in PRE- and=20
POSTROUTING chains in the nat table). I found out that packets are=20
sometimes lost, therefore I developed a test program for that.
The test program receives an UDP packet from the NAT box (from the=20
UDP socket where the iptables are setup) waits until conntrack entries=20
time out and then sends back 100 UDP packets from 100 different=20
sockets. Iptables should forward the received packets to a given=20
destination.
The experience is that only the first packet is forwarded, others are lost=
=20
(neither received locally nor forwarded), altough they are sent from 100=20
different ports (but from the same IP). If I list the iptables rules with "=
-
v" I find that all 100 packets matched the iptables rules (pkts column=20
shows 100 in PRE- and POSTROUTING chains).
I suspect, it cannot be a conntrack problem, because I send packets=20
from 100 different ports. Or are the packets looked up in conntrack=20
table by IP address only?
Other experience is that all 100 packets are lost if I don't wait for=20
conntrack to time out before sending back the first packet. I don't=20
understand it, because I never send data from the same source=20
address where a locally generated packet was sent previously from the=20
NAT box. So there can't be such conntrack that describes that=20
connection. And the counter in iptables is always incremented, it shows=20
100.
How could I find out, why are the packets lost? Is there a log entry=20
somewhere that says if an UDP packet was dropped because of... ?

Thank you for your answer!

Best regards,
Kornel Keseru
=0A=0A_____________________________________________________________________=
______=0A=D6ntsd k=E9peslapba az =E9rz=E9seidet! K=E9peslapok Valentin-napr=
a!=0Ahttp://www.t-online.hu=0A=0A

