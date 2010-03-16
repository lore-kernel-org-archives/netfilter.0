From: Juan Antonio <pushakk@limbo.ari.es>
Subject: Ugly issue with conntrack
Date: Tue, 16 Mar 2010 17:38:52 +0100
Message-ID: <4B9FB41C.5000609@limbo.ari.es>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello everyone,

I have a extrange issue with a conntrack entry. There is a nat server
configure in this way

    DMZ  194.139.30.0/23  ---  194.139.30.16  nat 192.168.12.100 ----=20
192.168.12.0/24  private network

The nat machine does postrouting in all traffic from the private networ=
k
to DMZ, and there is no problem but in one server in the DMZ with
windows 2008 server the traffic doesn't return to the origin, I can see
the traffic with tcpdump like this

17:19:23.971978 IP (tos 0x0, ttl  64, id 0, offset 0, flags [DF], proto=
:
ICMP (1), length: 84) 192.168.12.91 > 194.139.30.62: ICMP echo request,
id 12075, seq 1, length 64    <-----   The echo request original OK

17:19:23.972094 IP (tos 0x0, ttl  63, id 0, offset 0, flags [DF], proto=
:
ICMP (1), length: 84) 194.139.30.16 > 194.139.30.62: ICMP echo request,
id 12075, seq 1, length 64    <------ Masquerade the source IP OK

17:19:23.972164 IP (tos 0x0, ttl 128, id 25050, offset 0, flags [none],
proto: ICMP (1), length: 84) 194.139.30.62 > 194.139.30.16: ICMP echo
reply, id 12075, seq 1, length 64    <------- The echo reply OK

=BF?=BF?=BF?   <-----------    Lost echo reply not OK

There isn't the packet from 194.139.30.16 to 192.168.12.91 despite off
the conntrack table show

cat /proc/net/ip_conntrack | grep '30.62'
icmp     1 29 src=3D192.168.12.91 dst=3D194.139.30.62 type=3D8 code=3D0=
 id=3D12075
packets=3D11 bytes=3D924 [UNREPLIED] src=3D194.139.30.62 dst=3D194.139.=
30.16
type=3D0 code=3D0 id=3D12075 packets=3D0 bytes=3D0 mark=3D0 use=3D1

The packet in tcpdump match on the conntrack entry. "id 12075" in both
cases, but if I LOG the traffic with the LOG iptables target I see the
reply in INPUT table not in the FORWARD.

Thank you and sorry for me bad english.


