From: The Media Server <info@themediaserver.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Thu, 15 Jan 2015 20:53:23 -0500
Message-ID: <CAJb3rWBxWAUNiszThyq95Wm5azPAC92QBFS1zgqPRVdVBHAhVw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

yes indeed:
ip rule add* It was just a typo error sorry.

Yes I tried it with let say:
2 ht

I also disabled and enabled in the kernel rp_filter and forward for ipv4:
sudo sysctl -w net.ipv4.conf.eth0.rp_filter=0 &&
sudo sysctl -w net.ipv4.conf.tun0.rp_filter=0 &&
sudo sysctl -w net.ipv4.conf.all.rp_filter=0 &&
sudo sysctl -w net.ipv4.conf.default.rp_filter=0 &&
sudo sysctl -w net.ipv4.conf.lo.rp_filter=0  &&

sudo sysctl -w net.ipv4.conf.all.forwarding=1 &&
sudo sysctl -w net.ipv4.conf.default.forwarding=1 &&
sudo sysctl -w net.ipv4.conf.eth0.forwarding=1 &&
sudo sysctl -w net.ipv4.conf.lo.forwarding=1 &&
sudo sysctl -w net.ipv4.conf.tun0.forwarding=1 &&

sudo sysctl -w net.ipv6.conf.all.forwarding=1 &&
sudo sysctl -w net.ipv6.conf.default.forwarding=1 &&
sudo sysctl -w net.ipv6.conf.eth0.forwarding=1 &&
sudo sysctl -w net.ipv6.conf.lo.forwarding=1 &&
sudo sysctl -w net.ipv6.conf.tun0.forwarding=1

the result of my rule list is:
0:      from all lookup local
32765:  from all fwmark 0x2 lookup ht
32766:  from all lookup main
32767:  from all lookup default

my ht (2) table is:
default via 192.168.0.1 dev eth0
192.168.0.0/24 dev eth0  proto kernel  scope link  src 192.168.2.20  metric 1

I tried these rules:
sudo iptables -t mangle -A PREROUTING -j MARK --set-mark 2
sudo iptables -t mangle -A OUTPUT -p tcp --dport 80 -j MARK --set-mark 2
sudo iptables -t mangle -A OUTPUT -p tcp --sport 80 -j MARK --set-mark 2

Nothing work..


--
The weird part is that the OUTPUT rules works:

sudo iptables -t mangle -A OUTPUT -p tcp --dport 80 -j MARK --set-mark 2
sudo iptables --table nat --append POSTROUTING -o eth0 -j MASQUERADE

and this work too:
sudo ip rule add from 192.168.2.0/24 table ht
---

Looks like it doesn't want to mark anything only the PREROUTING /
INPUT phase.. or an option somewhere is not enabled..

Thks
