From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffe@amagerkollegiet.dk>
Subject: IRC conntrack does not work for outgoing DCC connections
Date: Fri, 6 Sep 2002 19:47:46 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209061930150.20225-100000@grignard.amagerkollegiet.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi

I have experienced a problem with ip_conntrack_irc. When doing DCC,
incoming connections are correctly identified as "expected". However
netfilter does not take notice of outgoing DCC connections. Thus DCC
will nok work for firewalls having outgoing traffic blocked - not even
if RELATED traffic is allowed.

To demonstrate I connect to an IRC server, 172.16.0.3, from two hosts,
172.16.0.130 and 172.16.0.122. 172.16.0.3 does not run netfilter.
172.16.0.122 and 172.16.0.130 are both running 2.4.19 with z-newnat16
and all submitted and pending patches applied. I allow outgoing IRC, DNS
and RELATED,ESTABLISHED and drop everything else; I allow nothing
incoming (on both boxes) except RELATED,ESTABLISHED. No NAT is involved.

What I do:

moffe@172.16.0.130# BitchX m0ffe 172.16.0.3

moffe@172.16.0.122# BitchX moffe 172.16.0.3

root@172.16.0.130# cat /proc/net/ip_conntrack
[...]
tcp      6 431994 ESTABLISHED src=3D172.16.0.130 dst=3D172.16.0.3 sport=3D3=
3670 dport=3D6667 src=3D172.16.0.3 dst=3D172.16.0.130 sport=3D6667 dport=3D=
33670 [ASSURED] use=3D1
[...]

root@172.16.0.122# cat /proc/net/ip_conntrack
[...]
tcp      6 431926 ESTABLISHED src=3D172.16.0.122 dst=3D172.16.0.3 sport=3D3=
454 dport=3D6667 src=3D172.16.0.3 dst=3D172.16.0.122 sport=3D6667 dport=3D3=
454 [ASSURED] use=3D1
[...]

(in BitchX on 172.16.0.130):
/chat moffe

root@172.16.0.130# cat /proc/net/ip_conntrack
[...]
tcp      6 431977 ESTABLISHED src=3D172.16.0.130 dst=3D172.16.0.3 sport=3D3=
3670 dport=3D6667 src=3D172.16.0.3 dst=3D172.16.0.130 sport=3D6667 dport=3D=
33670 [ASSURED] use=3D1
[...]
EXPECTING: 277 use=3D1 proto=3D6 src=3D0.0.0.0 dst=3D172.16.0.130 sport=3D0=
 dport=3D33671

root@172.16.0.122# cat /proc/net/ip_conntrack
[...]
tcp      6 431951 ESTABLISHED src=3D172.16.0.122 dst=3D172.16.0.3 sport=3D3=
454 dport=3D6667 src=3D172.16.0.3 dst=3D172.16.0.122 sport=3D6667 dport=3D3=
454 [ASSURED] use=3D1
[...]

No EXPECTING line ever shows up on 172.16.0.122. Thus 172.16.0.122 will
never be allowed to send out the DCC connection as I disallow outgoing
traffic.

Shouldn't it show up both places?

Regards
/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
I'm a bastard. I have absolutely no clue why people can ever think
otherwise. Yet they do. People think I'm a nice guy, and the fact is
that I'm a scheming, conniving bastard who doesn't care for any hurt
feelings or lost hours of work if it just results in what I consider
to be a better system.
                                                    - Linus Torvalds
----------------------------------[ moffe at amagerkollegiet dot dk ] --


