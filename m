From: Etienne Champetier <champetier.etienne@gmail.com>
Subject: iptables-nft: masquerade choosing wrong source ip on lo
Date: Thu, 18 Feb 2021 19:00:27 -0500
Message-ID: <CAOdf3gotaJG76eF_2XzebLFw4q2wQzjLrd59Z+0Hoi6mWQNk0w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=+L0oOtc1Gt6THYow5MPuKMZiHlVg38pDqlAlzWnomAI=;
        b=jrZ5XmedIt4Onfy6y7TYVAwb5kT8UMKlx4tn3ZBjEli38tqejkMCy+2ITro7I3ST35
         j5P8H9I90G2m4gSmNMYc+WHkRHxbXJjTtTohqKycU8r9PVDAwGmar8rqEz8Y3Ksr7Wl4
         t+O0uHwXla4aWfxSdXDnL74ZyKuk1at95l2Rmq8dEqqbQwPZOt88CELntkPWJ/qKVhE7
         KZIaDe1xZ00NS6wWdlP5X6ZlHxBW0pgzOeumURy2vLT5oxx/9qQWosAGagQHRdMC+9vt
         0b4qgJgdAKZFtvRxxJSw545cfPsOwnmvEdaMogKD8VABsLFgLnTzzUxs0zxqndoV0Hu7
         F7+A==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello netfilter team,

Before I try to make a minimal reproducer I would like opinions if
this is a bug and if this might be already fixed in recent versions.
I have a CentOS 8.3 with IPVS + a lot of iptables-nft rules
(kubernetes 1.18.5 with kubeproxy ipvs & calico)

What I'm doing
curl 100.64.0.1:443 -> ipvs -> 192.168.205.64:6443

100.64.0.1 / 192.168.205.64 / 192.168.177.64 are local IPs on the machine
192.168.177.64 is the first ipv4 after 127.0.0.1 (see "ip a" at the
end of this email)

~~~~~~~~~~
# nft monitor trace
trace id 105d0f85 ip nat OUTPUT packet: oif "lo" ip saddr 100.64.0.1
ip daddr 100.64.0.1 ip dscp cs0 ip ecn not-ect ip ttl 64 ip id 14556
ip length 60 tcp sport 10591 tcp dport 443 tcp flags == syn tcp window
43690
...
trace id 105d0f85 ip filter OUTPUT packet: oif "lo" ip saddr
100.64.0.1 ip daddr 192.168.205.64 ip dscp cs0 ip ecn not-ect ip ttl
64 ip id 14556 ip length 60 tcp sport 10591 tcp dport 6443 tcp flags
== syn tcp window 43690
...
trace id 105d0f85 ip filter OUTPUT packet: oif "lo" ip saddr
100.64.0.1 ip daddr 192.168.205.64 ip dscp cs0 ip ecn not-ect ip ttl
64 ip id 14556 ip length 60 tcp sport 10591 tcp dport 6443 tcp flags
== syn tcp window 43690
...
trace id 105d0f85 ip nat KUBE-POSTROUTING rule counter packets 2 bytes
120 meta mark set mark xor 0x4000  (verdict continue)
trace id 105d0f85 ip nat KUBE-POSTROUTING rule  counter packets 2
bytes 120 masquerade  (verdict accept)
trace id 1b4f09c0 ip raw PREROUTING packet: iif "lo" @ll,0,112 2048 ip
saddr 192.168.177.64 ip daddr 192.168.205.64 ip dscp cs0 ip ecn
not-ect ip ttl 64 ip id 14556 ip length 60 tcp sport 59542 tcp dport
6443 tcp flags == syn tcp window 43690
~~~~~~~~~~

What we see here is that the last masquerade choose 192.168.177.64 as
source addr (the "first IP"), when I would have expected
192.168.205.64 (ie using linux routing tables)
~~~~~~~~~~
# ip r get 192.168.205.64
local 192.168.205.64 dev lo table local src 192.168.205.64 uid 0
    cache <local>
~~~~~~~~~~

Here the nft/iptables-nft of the problematic MASQUERADE
~~~~~~~~~~
    chain KUBE-POSTROUTING {
         # match-set KUBE-LOOP-BACK dst,dst,src counter packets 0
bytes 0 masquerade
        mark and 0x4000 != 0x4000 counter packets 1743 bytes 104580 return
        counter packets 7 bytes 420 meta mark set mark xor 0x4000
         counter packets 7 bytes 420 masquerade
    }
or
-A KUBE-POSTROUTING -m comment --comment "Kubernetes endpoints dst
ip:port, source ip for solving hairpin purpose" -m set --match-set
KUBE-LOOP-BACK dst,dst,src -j MASQUERADE
-A KUBE-POSTROUTING -m mark ! --mark 0x4000/0x4000 -j RETURN
-A KUBE-POSTROUTING -j MARK --set-xmark 0x4000/0x0
-A KUBE-POSTROUTING -m comment --comment "kubernetes service traffic
requiring SNAT" -j MASQUERADE --random-fully
~~~~~~~~~~

On the CentOS 8 host:
4.18.0-240.1.1.el8_3.x86_64
nftables 1:0.9.3-16.el8
iptables 1.8.4-15.el8_3.3

In the kubeproxy container (Debian 10 buster):
iptables 1.8.3-2~bpo10+1
libxtables12 1.8.3-2~bpo10+1
libnftnl11 1.1.5-1~bpo10+1

~~~~~~~~~~
# ip a
...
13: bond2: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc
noqueue state UP group default qlen 1000
    link/ether 94:40:c9:7d:4f:48 brd ff:ff:ff:ff:ff:ff
    inet 192.168.177.64/24 brd 192.168.177.255 scope global noprefixroute bond2
       valid_lft forever preferred_lft forever
    inet6 fe80::9640:c9ff:fe7d:4f48/64 scope link
       valid_lft forever preferred_lft forever
14: bond2.40@bond2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc
noqueue state UP group default qlen 1000
...
15: bond3: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc
noqueue state UP group default qlen 1000
    link/ether 94:40:c9:85:8e:b1 brd ff:ff:ff:ff:ff:ff
    inet 192.168.205.64/24 brd 192.168.205.255 scope global noprefixroute bond3
       valid_lft forever preferred_lft forever
    inet6 fe80::9640:c9ff:fe85:8eb1/64 scope link
       valid_lft forever preferred_lft forever
16: bond1: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc
noqueue state UP group default qlen 1000
...
17: nodelocaldns: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN
group default
...
18: kube-ipvs0: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN group default
...
    inet 100.64.0.1/32 brd 100.64.0.1 scope global kube-ipvs0
       valid_lft forever preferred_lft forever
~~~~~~~~~~

Thanks
Etienne
