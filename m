From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
Subject: skb->mark not cleared for MLDv2 Reports? (skb->mark == 212 / 0xd4)
Date: Mon, 17 Jul 2023 13:22:03 +0200
Message-ID: <ZLUkWyFiwEqi721V@sellars>
Mime-Version: 1.0
Return-path: <netdev+bounces-18265-gl-netdev-2=m.gmane-mx.org@vger.kernel.org>
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, netfilter@vger.kernel.org

Hi,

I noticed that MLDv2 Reports don't seem to have a default
skb->mark of 0. Instead it is 212 / 0xd4 for me:

```
$ ip link add dummy0 type dummy
$ ip link set up dummy0 arp on
$ ip6tables -I INPUT -i dummy0 -j LOG --log-ip-options
[ send an MLDv2 Query, for instance via the ipv6toolkit
  https://github.com/T-X/ipv6toolkit/tree/pr-mldq6-mldv2
]
$ dmesg
...
[38336.524879] IN= OUT=dummy0 SRC=fe80:0000:0000:0000:1c01:1cff:fec1:5669 DST=ff02:0000:0000:0000:0000:0000:0000:0016 LEN=76 TC=0 HOPLIMIT=1 FLOWLBL=0 OPT ( ) PROTO=ICMPv6 TYPE=143 CODE=0 MARK=0xd4
...
```

For MLDv1 Reports I don't see this issue, there it's always
0 by default.

I'm wondering if this 212 value comes from the
skb->reserved_tailroom (formerly avail_size) which the skb->mark
is unioned with? Am I reading
a21d45726a ("tcp: avoid order-1 allocations on wifi and tx path")
correctly that the IPv6 stack should have reset skb->mark to 0
before transmission?

Initially observed on a Linux 5.10.184. But I can reproduce
this on a Linux 6.3.7, too.

Regards, Linus

