From: Warren Dixon <wdixon@caffeinedriven.com>
Subject: return to source MAC
Date: Mon, 17 Mar 2014 20:27:18 +0000
Message-ID: <CAGgS43EzZkEyWbYz8smkOUD=EZuoHfETitE-KffaMAd0_yT8Kw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

I have a solution where a gateway may have multiple network interfaces
but only a single IP and I am trying to return the packet to the
source MAC.  I think I have missunderstood the connmark config.

client network is 10.x.x.x
network between the gateway and squidbox (where I am trying to install
this routing) is 2.0.0.0/24
Squid box has eth2  0.0.0.0
I have added a bridge interface with eth2 as a member and IP address 2.0.0.2/24
the Squidbox then has a second interface on public IP eth3

default route if via eth3
#ip ro add 10.1.1.0/24 via 2.0.0.2

iptables -A PREROUTING -t mangle  -m mac --mac-source
aa:aa:aa:aa:aa:aa -j MARK --set-mark 1
iptables -A PREROUTING -t mangle -j CONNMARK --save-mark
iptables -A POSTROUTING -t mangle -j CONNMARK --restore-mark

ebtables -t nat -A OUTPUT  -p ipv4 --ip-proto tcp  --mark 1 -j dnat
--to-destination aa:aa:aa:aa:aa:aa

iptables -t nat -A POSTROUTING -o eth3 -j MASQUERADE

[root]# cat /proc/net/nf_conntrack
ipv4     2 tcp      6 58 SYN_RECV src=10.1.1.80 dst=212.58.246.91
sport=1864 dport=80 src=212.58.246.91 dst=10.1.1.55 sport=80
dport=1864 mark=0 secmark=0 use=2

The issue seems to be that the Mark is not being restored, a tcpdump
on the interfaces shows the flows being forwarded correctly, but
without the MAC mangling taking place.

Many Thanks

Warren.
