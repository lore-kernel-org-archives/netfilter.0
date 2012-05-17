From: Andrew <nfml7@k1k2.com>
Subject: SNAT/MASQ on a single subnet
Date: Fri, 18 May 2012 02:18:26 +1000
Message-ID: <1337271506.23670.13.camel@mutsumi.paige>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi I'm trying to work out what I guess might not be possible
with iptables or is simple and I"m just missing something

I have 3 devices on the same subnet

192.168.0.1 ADSL Router
192.168.0.240 Linux Server
192.168.0.100 Windows PC

The Linux server has no rules and ACCEPT on all

What would the minimum necessary rule(s) to get the Linux Server
to forward (with SNAT or MASQUERADE) packets through the Router
from 192.168.0.100 and also send the replies back?

The Linux Server has 192.168.0.1 as it's gateway and also
has ip forwarding enabled

I set the gateway on the windows PC to 192.168.0.240

I tried a few simple single rules and failed.
(Just the single rule and deleted it after)
2 examples were:

iptables -t nat -A POSTROUTING -o br0 -s 192.168.0.0/24 ! -d
192.168.0.0/24 -j SNAT --to 192.168.0.240

iptables -t nat -A POSTROUTING -o br0 -s 192.168.0.0/24 -j SNAT --to
192.168.0.240

Single ping shows:
192.168.0.100 -> 74.125.237.113
192.168.0.240 -> 74.125.237.113
74.125.237.113 -> 192.168.0.240

but no "74.125.237.113 -> 192.168.0.100"

tcpdump:

09:48:57.726511 IP 192.168.0.100 > 74.125.237.113: ICMP echo request, id
512, seq 4608, length 40
        0x0000:  4500 003c ba86 0000 8001 873f c0a8 0064
        0x0010:  4a7d ed71 0800 395c 0200 1200 6162 6364
        0x0020:  6566 6768 696a 6b6c 6d6e 6f70 7172 7374
        0x0030:  7576 7761 6263 6465 6667 6869
09:48:57.726511 IP 192.168.0.100 > 74.125.237.113: ICMP echo request, id
512, seq 4608, length 40
        0x0000:  4500 003c ba86 0000 8001 873f c0a8 0064
        0x0010:  4a7d ed71 0800 395c 0200 1200 6162 6364
        0x0020:  6566 6768 696a 6b6c 6d6e 6f70 7172 7374
        0x0030:  7576 7761 6263 6465 6667 6869
09:48:57.726547 IP 192.168.0.240 > 74.125.237.113: ICMP echo request, id
512, seq 4608, length 40
        0x0000:  4500 003c ba86 0000 7f01 87b3 c0a8 00f0
        0x0010:  4a7d ed71 0800 395c 0200 1200 6162 6364
        0x0020:  6566 6768 696a 6b6c 6d6e 6f70 7172 7374
        0x0030:  7576 7761 6263 6465 6667 6869
09:48:57.726550 IP 192.168.0.240 > 74.125.237.113: ICMP echo request, id
512, seq 4608, length 40
        0x0000:  4500 003c ba86 0000 7f01 87b3 c0a8 00f0
        0x0010:  4a7d ed71 0800 395c 0200 1200 6162 6364
        0x0020:  6566 6768 696a 6b6c 6d6e 6f70 7172 7374
        0x0030:  7576 7761 6263 6465 6667 6869
09:48:57.758816 IP 74.125.237.113 > 192.168.0.240: ICMP echo reply, id
512, seq 4608, length 40
        0x0000:  452c 003c 8913 0000 3801 fffa 4a7d ed71
        0x0010:  c0a8 00f0 0000 415c 0200 1200 6162 6364
        0x0020:  6566 6768 696a 6b6c 6d6e 6f70 7172 7374
        0x0030:  7576 7761 6263 6465 6667 6869

Anyone know what it should really be (or if it isn't possible why?)

Thanks for your help.

