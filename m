From: "Mitus, Krzysztof \(Krzysztof\)" <mitus@alcatel-lucent.com>
Subject: Ip_conntrack_rsh - how to make nat working?
Date: Mon, 9 Jul 2007 23:03:00 +0200
Message-ID: <6C90EC3978714242B97585A2C70138ABA8EDD9@DEEXC1U01.de.lucent.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
	I need to setup rsh via nat working.
	Don't ask me why I use use unsafe protocol, and old kernel
2.6.13. I just need make them working.
=09
	I downloaded patch-o-matic, applied ip_conntrack_rsh patch to
kernel 2.6.13, rebuilt kernel , rebuilt iptables 1.3.3.=20
=09
	After reboot, I call "modprobe ip_conntrack_rsh".  I applied
iptables rules from the netfilter webpage:

=09
http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra
-rsh

=09
	I can see that conntrack is working, rsh stderr connection
initiated by rsh server is added to /proc/net/ip_conntrack_expected.
	The problem is that the rsh stderr stream is not NAT'ed, and
connection fails.

	Here is some trace from gateway:

	eth2 - public interface of gateway.
	10.0.236.90 - public IP of gateway
	10.0.238.89 - IP of rsh server
	192.168.40.51 - IP of rsh client

gateway:/ # tethereal -i eth2 host 10.0.236.90 and host 10.0.238.89
Capturing on eth2
  0.000000  10.0.236.90 -> 10.0.238.89  TCP 1023 > shell [SYN] Seq=3D0
Ack=3D0 Win=3D5840 Len=3D0 MSS=3D1460 TSV=3D1927039256 TSER=3D0 WS=3D0
  0.003846  10.0.238.89 -> 10.0.236.90  TCP shell > 1023 [SYN, ACK]
Seq=3D0 Ack=3D1 Win=3D5792 Len=3D0 MSS=3D1460 TSV=3D24463859 =
TSER=3D1927039256 WS=3D0
  0.004107  10.0.236.90 -> 10.0.238.89  TCP 1023 > shell [ACK] Seq=3D1
Ack=3D1 Win=3D5840 Len=3D0 TSV=3D1927039261 TSER=3D24463859
  0.004130  10.0.236.90 -> 10.0.238.89  RSH 1021\000
  0.004180  10.0.238.89 -> 10.0.236.90  TCP shell > 1023 [ACK] Seq=3D1
Ack=3D6 Win=3D5792 Len=3D0 TSV=3D24463864 TSER=3D1927039261
  0.005926  10.0.238.89 -> 10.0.236.90  TCP 1019 > 1021 [SYN] Seq=3D0
Ack=3D0 Win=3D5840 Len=3D0 MSS=3D1460 TSV=3D24463866 TSER=3D0 WS=3D0
  0.005979  10.0.236.90 -> 10.0.238.89  TCP 1021 > 1019 [RST, ACK] =
Seq=3D0
Ack=3D0 Win=3D0 Len=3D0
  0.006175  10.0.238.89 -> 10.0.236.90  TCP shell > 1023 [FIN, ACK]
Seq=3D1 Ack=3D6 Win=3D5792 Len=3D0 TSV=3D24463866 TSER=3D1927039261
  0.006414  10.0.236.90 -> 10.0.238.89  TCP 1023 > shell [FIN, ACK]
Seq=3D6 Ack=3D2 Win=3D5840 Len=3D0 TSV=3D1927039263 TSER=3D24463866
  0.006477  10.0.238.89 -> 10.0.236.90  TCP shell > 1023 [ACK] Seq=3D2
Ack=3D7 Win=3D5792 Len=3D0 TSV=3D24463866 TSER=3D1927039263

 cat /proc/net/ip_conntrack
tcp      6 117 TIME_WAIT src=3D192.168.40.51 dst=3D10.0.238.89 =
sport=3D1023
dport=3D514 src=3D10.0.238.89 dst=3D10.0.236.90 sport=3D514 dport=3D1023 =
[ASSURED]
mark=3D0 use=3D1

 cat /proc/net/ip_conntrack_expect ( cought by filtering out rsh server
initial connection of stderr stream)
1 proto=3D6 src=3D10.0.238.89 dst=3D10.0.236.90 sport=3D0 dport=3D1021

My questions are:
	- how can I setup rsh connection via nat ?
	- is it a problem with missing/incorrect iptables rules, or I
need ip_nat_rsh module?=20
	- does ip_nat_rsh module exist?=20

I'll be gratefull for your help.

Regards,
Krzysztof

