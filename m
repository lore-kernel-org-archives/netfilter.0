From: Tito Sacchi <tito@tilde.team>
Subject: Routing table does not assign correct output IP address after
 nftables "chain" chain
Date: Fri, 17 Jun 2022 12:33:13 +0200
Message-ID: <F5251F29-58F9-4448-90FB-4B1CED573E76@tilde.team>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tilde.team; s=mail;
        t=1655461995; bh=tjmBwCpr/XCBFfuXTqjMDkwyTUhHDgDDpHcU68u2F9g=;
        h=From:Subject:Date:To:From;
        b=RxByuEcy6mN5xKxvFsTo6gz1F2BjNkCx2LXphDJ5CQRTZ6yvuRJ+Jb9ifVFQW7ozp
         zuL25ang1q8/ieGserm5+MJpGiTKkoi0Ex0eoozOFYq1SgyfYcQbrx1LhSA8EWK/UL
         g4nCzUdssT6hmBZCUm1qGAEEaiLugZjEWIts6YB8=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,
I am using nftables to mark packets according to skuid, and I want to =
make routing decisions with that mark. The use-case is letting the =
traffic of a single application flow outside of my VPN tunnel.
I am using a =E2=80=9Croute=E2=80=9D chain to set the mark and I have a =
routing policy rule set up with iproute2 that will use a custom routing =
table.
However, it seems to me that the source IP address is not updated when =
the routing table is visited the second time. Therefore, an IP packet is =
sent to my home router, but its source IP is set to the IP assigned to =
the VPN interface. The packet gets dropped.
Is this expected behaviour? Shouldn=E2=80=99t the routing table update =
the source IP according to the entries? I can manually set the source ip =
with nftables (in the same chain where I set the mark), but I think this =
should not be needed.

I am debugging all this with nftrace. As you can see in the following =
trace, the packet correctly changes output interface but keeps the old =
source IP.

trace id e310c10c inet filter routes packet: oif "wg0" ip saddr =
10.8.1.10 ip daddr 1.1.1.1 [...]
trace id e310c10c inet filter routes rule meta skuid 970 meta nftrace =
set 1 (verdict continue)
trace id e310c10c inet filter routes rule meta skuid 970 counter packets =
2 bytes 120 meta mark set 0x0000000f (verdict continue)
trace id e310c10c inet filter routes verdict continue meta mark =
0x0000000f
trace id e310c10c inet filter routes policy accept meta mark 0x0000000f
trace id e310c10c inet nat postrouting packet: oif "public" ip saddr =
10.8.1.10 ip daddr 1.1.1.1 [...]
                                                                     =
^^^^^^^^^ --> saddr should be updated to reflect "public" interface IP
trace id e310c10c inet nat postrouting verdict continue meta mark =
0x0000000f
trace id e310c10c inet nat postrouting policy accept meta mark =
0x0000000f


The routing table used for marked packets contains a single entry: =
default via 192.168.1.1 dev public src 192.168.1.102.

Relevant firewall configuration:
        chain routes {
                type route hook output priority mangle; policy accept;
                meta skuid 970 log
                meta skuid 970 meta nftrace set 1
                meta skuid 970 counter meta mark set 0x0000000f
        }

I face the same issue with iptables.

Thanks in advance,
Tito

=E2=80=94 =E2=80=94 =E2=80=94
https://tilde.team/~tito/

PGP key: 0x6BED3002CF25C4D2 (4096R)
(https://keys.openpgp.org/search?q=3D0x6BED3002CF25C4D2)

Keybase: @tauroh
(https://keybase.io/tauroh)

