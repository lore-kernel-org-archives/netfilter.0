From: "Andy Wood" <andy@digitalindustry.org>
Subject: SNAT
Date: Fri, 25 Apr 2003 13:45:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030425174620.DJBA1385.lakecmmtao02.coxmail.com@vaio>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

	There is no easy way to describe this, so I'll just start.

	I am running a Snort IDS/FW with 4 interfaces, but we'll just be
concerned with 2 (eth0 and eth2 + ipsec0).  Ipsec is functioning, so =
that is
not the problem.

Local subnet	10.10.41.0/24
Local GW		10.10.41.100

Remote Network:
Network		111.111.0.0/16
Eth0			111.111.3.160 (gw 111.111.3.129)
Eth2			111.111.3.163
Add. Route		route add 111.111.8.204 gw 111.111.3.129 dev eth2
(just cause I want to ensure it 			goes out eth2) and I
can ping that host; it does go out eth2

To ensure that there is no unintentional DROPping of packets there are =
only
3 rules:

iptables -A POSTROUTING -t nat -o ipsec0 -s 111.111.3.160 -d =
10.10.41.0/24
-j SNAT --to 111.111.3.163
iptables -A POSTROUTING -t nat -o eth2 -s 10.10.41.0/24 -j SNAT --to
111.111.3.163
Iptables -A FORWARD -j ACCEPT

	Basically, I want to send a packet through the tunnel (ipsec0) and
out to system 111.111.8.204.  Because the packet will arrive as source
10.10.41.100, and I cannot control the route table of system =
111.111.8.204,
I figured I would SNAT the packet from 10.10.41.100 to 111.111.3.163.  =
If I
do a tcpdump on ipsec0 I see the pachet coming in:

(Remote Side - Inbound) tcpdump -i ipsec0 -p -n -nn icmp
13:27:33.916290 10.10.41.100 > 111.111.8.204: icmp: echo request (DF)
13:27:34.919120 10.10.41.100 > 111.111.8.204: icmp: echo request (DF)
13:27:35.931122 10.10.41.100 > 111.111.8.204: icmp: echo request (DF)
13:27:36.923962 10.10.41.100 > 111.111.8.204: icmp: echo request (DF)

	However, (On the remote side) "tcpdump -i eth2 -p -n -nn icmp" or
"tcpdump -i eth0 -p -n -nn icmp" (just in case) do not show any packets
outbound (to 111.111.8.204).  I can't see anything wrong with my rules, =
but
sometimes I can't think outside the box.....any ideas?

Thanks,
Andy

	To verify the tunnel works:

[root@darkgate root]# ping 111.111.3.163

PING 111.111.3.163 (111.111.3.163) from 68.68.130.209 : 56(84) bytes of
data.
64 bytes from 111.111.3.163: icmp_seq=3D1 ttl=3D64 time=3D29.5 ms
64 bytes from 111.111.3.163: icmp_seq=3D2 ttl=3D64 time=3D31.7 ms
64 bytes from 111.111.3.163: icmp_seq=3D3 ttl=3D64 time=3D26.1 ms
64 bytes from 111.111.3.163: icmp_seq=3D4 ttl=3D64 time=3D26.7 ms



[root@testids root]# tcpdump -i ipsec0 -p -n -nn icmp

13:35:50.883841 10.10.41.100 > 111.111.3.163: icmp: echo request (DF)
13:35:50.884001 111.111.3.163 > 10.10.41.100: icmp: echo reply
13:35:51.832915 10.10.41.100 > 111.111.3.163: icmp: echo request (DF)
13:35:51.832976 111.111.3.163 > 10.10.41.100: icmp: echo reply
13:35:52.847691 10.10.41.100 > 111.111.3.163: icmp: echo request (DF)
13:35:52.847749 111.111.3.163 > 10.10.41.100: icmp: echo reply
13:35:53.859624 10.10.41.100 > 111.111.3.163: icmp: echo request (DF)
13:35:53.859684 111.111.3.163 > 10.10.41.100: icmp: echo reply


