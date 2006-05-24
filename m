From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Connection tracking looses packets?
Date: Wed, 24 May 2006 16:02:35 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C401277E@knowledge.wizdom.nu>
References: <44745ECF.70702@expertron.co.za>
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
To: Justin Schoeman <justin@expertron.co.za>, netfilter@lists.netfilter.org

The problem is, that there is no easy answer.
=20
The packets are probably dropped due to incorrect sequence numbers or =
TCP flags. Or they might arrive untimely. Netfilter will then not see =
them as part of an established connection and mark them invalid.
=20
The point is, that many application servers (especially those from that =
horrible company in Redmond) do not fully adhere RFC's, or they are =
configured incorrectly. This often causes issues with firewalls dropping =
packes. There also might be incorrectly configured networking devices =
(routers, concetrators etc) in between the connection end-points.
=20
I would say the change is about 0-1% that it is netfilter causing the =
issue. It just inspects all the packet conforming RFC's, the way it =
should be done. There is therefor a 99-100% change the problem lies =
elsewhere and most likely it's incorrectly working or configured clients =
and/or servers.
=20
Though you probably will not find this answer useful in solving your =
problem, I hope it still clarifies some things.
=20
-Sietse
=20
=20
________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Justin Schoeman
Sent: Wed 24-May-06 15:25
To: netfilter@lists.netfilter.org
Subject: Connection tracking looses packets?



Hi all,

I am having problems with a firewall here.  The basic configuration
works perfectly, but we have occasional problems with DNAT.  Long
running sessions (we have found the problem on ftp, http, pop and smtp
sessions) occasionally stall, and transfer no more data.  Looking at the
firewall logs, I see:

INVALID NAT: IN=3Deth3 OUT=3D =
MAC=3D00:02:55:d6:eb:ae:00:11:bc:25:96:80:08:00
SRC=3D196.x.x.x DST=3D10.50.18.22 LEN=3D52 TOS=3D0x00 PREC=3D0x00 =
TTL=3D117 ID=3D37995
PROTO=3DTCP SPT=3D57952 DPT=3D80 WINDOW=3D65535 RES=3D0x00 ACK URGP=3D0

(This is logged by a -m state --state INVALID rule in the mangle table.)
The packet is then not natted, but drops into the INPUT chain for the
firewall itself, where it is dropped.

This seems to be the problem, as there are always one or more of these
messages on a stalled connection.

Looking at /proc/net/ip_conntrack immediately after the above message is
logged, I see:

tcp      6 295 ESTABLISHED src=3D196.x.x.x dst=3D10.50.18.22 =
sport=3D57952
dport=3D80 packets=3D5 bytes=3D633 src=3D192.168.1.22 dst=3D196.x.x.x =
sport=3D80
dport=3D57952 packets=3D12 bytes=3D13793 [ASSURED] mark=3D0 use=3D1

So the connection seems to be valid.

Any idea why this packet may be dropped, or are there other possible
reasons why the connection may be stalling?

Googling reveals a significant number of people having problems with
random stalls within a connection, but so far I have not seen a single
answer to the problem.

Any help/advice will be greatly appreciated.

Thanks,

Justin




