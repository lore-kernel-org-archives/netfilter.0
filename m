From: Shirisha Dasari <shirishadasari@gmail.com>
Subject: IP DNAT on bridged packets destined to local process
Date: Tue, 7 Jun 2022 13:55:36 +0530
Message-ID: <CACnkxm-=kXAoFLHnJFrjoDHakvaxqmgJDdzXQcpyRzP0FBSWDQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=74lQ7GWlFkuOjc7Ectz3G6hmrMyIyfQMMOI6SMMFjcQ=;
        b=ptAG8ZyvW7XmNIg4b2k7uYLFC01FWbTy2HI+XlJpbtZZJ8/HVGwmv6WseBiakFc53m
         D9t+WvAWGxCYkoqxUkeRG2n6Ss022nwIC7AWuX6FlvbgznoIrfngvfxSk4FdOIDSrx50
         UV+b8KnDEbXgttm6OgAM5n4xUZ01/fr1zV/zkab1LcuIwfwwVOtpMs2cWPHZSrOArvq6
         aW0V/7obc74UhP3QaJzd45ptPZcJpJQQC0DMSQixiGKCSRn/AeuYwI6cVDQ3sGApBcyF
         ZwlhJz0bcYQSQ9BMPZlExkO/yFhkd/rlw4FCCHOTTUUWCqTPVP1XKdmfB0YiKg0Qj4pn
         9sjw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

  Hi,

I need some help to understand if IP DNAT can be achieved on bridged
packets (IP packets arriving on a bridge port). The packets first need
to undergo DMAC NAT in the bridge filter layer of Netfilter and then
also need to undergo IP DNAT. This is because I need to have the
incoming bridged IP packets redirected to a local process.

From my experimentation so far, I'm only able to have the packet
undergo DMAC NAT using bridge NF rules but these packets do not hit
the ingress L3 stack prerouting chains. The packets undergo DMAC NAT
and are redirected to the bridge INPUT chain from where they undergo
routing lookup directly and take appropriate route to be forwarded. I
however need to NAT the DIP before the routing lookup happens.  From
https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks,
http://ebtables.netfilter.org/br_fw_ia/br_fw_ia.html#section5 and
https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg,
I feel the packet should have hit the IP PREROUTING chain and
undergone NAT but this doesn't happen in my case.

I've already tried the following:

1)  net.bridge.bridge-nf-call-iptables = 1.
The packets still do not hit the L3 IP NAT PREROUTING chain still.

2) ebtables rules to BROUTE the packet to the L3 layer.  My ebtables
rules added via ebtables-legacy do not get hit at all.

3) The packet seems to be hitting the inet chains but I cannot add a
NAT rule in the inet chain as this support is only available in the
later kernels.

Some info about the system I'm trying this on:
root@sonic:/home/admin# uname -a
Linux sonic 4.19.0-9-2-amd64 #1 SMP Debian 4.19.118-2+deb10u1
(2020-06-07) x86_64 GNU/Linux

root@sonic:/home/admin# ebtables -V
ebtables 1.8.2 (nf_tables)
root@sonic:/home/admin# ebtables-legacy -V
ebtables v2.0.10.4 (legacy) (December 2011)

Following are the rules in my nftables and the trace of the packet
traversing nftables:

table bridge filter {
               chain PREROUTING {
                                  type filter hook prerouting priority
-300; policy accept;
                                  tcp dport http ip saddr 10.10.10.10
ether daddr set 00:00:00:0a:0b:0c counter packets 0 bytes 0
                }

               chain trace_chain {
                                 type filter hook prerouting priority
-301; policy accept;
                                 nftrace set 1
                }
}

root@sonic:/home/admin# nft list table nat
table ip nat {
        chain PREROUTING {
                type nat hook prerouting priority -100; policy accept;
        }

        chain INPUT {
                type nat hook input priority 100; policy accept;
        }

        chain POSTROUTING {
                type nat hook postrouting priority 100; policy accept;
                meta l4proto udp udp dport 53 counter packets 0 bytes
0 jump DNS_SNAT_RULE
        }

        chain OUTPUT {
                type nat hook output priority -100; policy accept;
        }

        chain DOCKER {
        }

        chain DNS_SNAT_RULE {
        }

        chain redir {
               type nat hook prerouting priority -101; policy accept;
               ip saddr 10.10.10.10 tcp dport { http, https } counter
packets 0 bytes 0 dnat to 60.60.60.60
        }
}

Packet trace:

packet: iif "Ethernet38" ether saddr 00:00:09:00:10:00 ether daddr
00:00:09:00:11:00 vlan pcp 0 vlan cfi 0 vlan id 10 ip saddr
10.10.10.10 ip daddr 20.20.20.20 ip dscp cs0 ip ecn not-ect ip ttl 2
ip id 0 ip protocol tcp ip length 82 tcp sport http tcp dport http tcp
flags == 0x0 tcp window 0
trace id e19ef0d4 bridge filter PREROUTING rule  tcp dport http ip
saddr 10.10.10.10 ether daddr set 00:00:00:0a:0b:0c counter packets 52
bytes 4264  (verdict continue)
trace id e19ef0d4 bridge filter PREROUTING verdict continue
trace id e19ef0d4 bridge filter PREROUTING
trace id e19ef0d4 bridge filter INPUT verdict continue
trace id e19ef0d4 bridge filter INPUT
trace id 00027106 ip filter FORWARD verdict continue
trace id 00027106 ip filter FORWARD

Thanks,
Shirisha.
