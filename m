From: boogeyman@polizisten-duzer.de
Subject: NAT through transfer-LAN [follow-up]
Date: Wed, 7 Dec 2005 15:21:22 +0100 (MET)
Message-ID: <14835.1133965282@www59.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi

It seems, i've pasted an incomplete routing table into my last posting, so
here's the right one:

Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
213.30.216.40   0.0.0.0         255.255.255.248 U     0      0        0 eth1
10.49.0.0       0.0.0.0         255.255.255.0   U     0      0        0 eth0
169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth1
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         213.30.216.41   0.0.0.0         UG    0      0        0 eth1


We apologize for the inconvenience...

Sven

--=20
10 GB Mailbox, 100 FreeSMS/Monat http://www.gmx.net/de/go/topmail
+++ GMX - die erste Adresse f=FCr Mail, Message, More +++

