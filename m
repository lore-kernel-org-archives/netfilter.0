From: Martin Tonusoo <martin@tonusoo.xyz>
Subject: Understanding the network stack internals for multicast packets if
 there is both a raw socket and local subscriber for IGMP messages
Date: Sat, 13 May 2023 02:32:02 +0300
Message-ID: <CAGhV4zUhx8OGgLQfofQSPiVuQqeimYysYnWMBOizzVbwhyPj-g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tonusoo-xyz.20221208.gappssmtp.com; s=20221208; t=1683934334; x=1686526334;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gNQ5Wv0PsbjmL9YlHZaCmlrW3uUPQG/wMW5JJsbd+jA=;
        b=VJ0v5giPKUpIBtLQqiEIw+czRqiUXaJrxYAKN5541qlyalhuiITO3n2dcXf3FXh/0q
         gAWSyxiwQuU2w2GBN5Fx9yMNCNNJHUKPJO2Eb7RtZjoI1FeCiQI5nhxdJoi72lNPNjGb
         jyyslsqlR+8x6vd2dGl7epN3BsqLC4XSEGaWSnPFrg2ZbG7saosb2Dk4u4YbOzWln0ce
         uZJr1sz6ChOSOtXEHh0tApMd3tlI9L5roDFEjy9ENmCdVHG4fUB/Nb37RxQ4AbzVFag+
         JZJdIK/Ax+GV5hTSdHWukLRIDAL4KGhRu0FXevv+zdulg5MFvEGtCjcLQ3ArmxRp0X/m
         s4Wg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi.

I was building iptables rules for
igmpproxy(https://github.com/pali/igmpproxy) and noticed that packets
addressed to multicast IPs which the host subscribed to, were sent all
the way up to "filter" table INPUT chain while the rest did not travel
further than "mangle" table PREROUTING chain.

I made a small, proof of concept program which configures socket
identically to igmpproxy:
https://gist.github.com/tonusoo/3c878cad74094a15ca8c338475151fb7 As
seen from the code, its using raw sockets for IGMP messages, but also
subscribes to 224.0.0.2 group on interface named ens4. Example where
the program is executed using strace:

root@mr3:~# strace -f -e socket,setsockopt ./mc_socket
socket(AF_INET, SOCK_RAW, IPPROTO_IGMP) = 3
setsockopt(3, SOL_IP, 0xc8 /* IP_??? */, [1], 4) = 0
setsockopt(3, SOL_IP, 0xca /* IP_??? */,
"\1\0\10\1\0\0\0\0\4\0\0\0\0\0\0\0", 16) = 0
setsockopt(3, SOL_IP, IP_ADD_MEMBERSHIP,
{imr_multiaddr=inet_addr("224.0.0.2"),
imr_interface=inet_addr("10.0.2.1")}, 12) = 0
sleeping for 30s..
+++ exited with 0 +++
root@mr3:~#

While the program is running, the ens4 is subscribed to 224.0.0.2 group:

root@mr3:~# ip maddr sh dev ens4
4:      ens4
        link  01:00:5e:00:00:01
        link  01:00:5e:00:00:02
        inet  224.0.0.2
        inet  224.0.0.1
        inet6 ff02::1
        inet6 ff01::1
root@mr3:~#

Now there is another virtual machine named "h5" which is connected to
"mr3" via ens3 interface, i.e hosts are connected like this: mr3[ens4]
<-> [ens3]h5. Both "h5" and "mr3" are running Debian
10(4.19.0-23-amd64). In "h5" I'm running two Scapy commands:

sendp(Ether(src='52:54:00:68:b7:4e',
dst='01:00:5e:00:00:02')/IP(src='192.168.0.100',
dst='224.0.0.2')/IGMP(type=0x16, gaddr='224.0.0.2'), iface='ens3',
verbose=0, count=5)

sendp(Ether(src='52:54:00:68:b7:4e',
dst='01:00:5e:01:02:03')/IP(src='192.168.0.100',
dst='239.1.2.3')/IGMP(type=0x16, gaddr='239.1.2.3'), iface='ens3',
verbose=0, count=5)

The first one is sending five IGMP "Membership Report" messages to
224.0.0.2 via ens3 interface and the second one is sending IGMP
"Membership Report" messages to 239.1.2.3.

In case the "mc_socket" program mentioned above is not running, then
the NIC/driver drops the multicast frames in "mr3" which is expected
behavior. When the "mc_socket" program is running, then packets
addressed to 224.0.0.2 go all the way through "filter" table INPUT
chain towards the application layer. Packets addressed to 239.1.2.3
seem to be sent to raw socket somewhere after the "mangle" table
PREROUTING chain. Iptables counters after executing the two Scapy
commands described earlier when the "mc_socket" was running:

root@mr3:~# iptables -t mangle -L PREROUTING -v -n --line-numbers
Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1        5   140 LOG        all  --  *      *       0.0.0.0/0
  239.1.2.3            LOG flags 0 level 4
2        5   140 LOG        all  --  *      *       0.0.0.0/0
  224.0.0.2            LOG flags 0 level 4
root@mr3:~#
root@mr3:~# iptables -t mangle -L INPUT -v -n --line-numbers
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1        0     0 LOG        all  --  *      *       0.0.0.0/0
  239.1.2.3            LOG flags 0 level 4
2        5   140 LOG        all  --  *      *       0.0.0.0/0
  224.0.0.2            LOG flags 0 level 4
root@mr3:~#
root@mr3:~# iptables -t filter -L INPUT -v -n --line-numbers
Chain INPUT (policy ACCEPT 1567 packets, 107K bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1        0     0 LOG        all  --  *      *       0.0.0.0/0
  239.1.2.3            LOG flags 0 level 4
2        5   140 LOG        all  --  *      *       0.0.0.0/0
  224.0.0.2            LOG flags 0 level 4
root@mr3:~#

Am I correct, that packets addressed to 224.0.0.2 are sent all the way
through the network stack to application layer because ens4 interface
is configured to 224.0.0.2 group while packets addressed to 239.1.2.3
are snatched much earlier by the program which opened the raw socket?
Where in the kernel source code does this split of paths happen?


PS. I hope it's not off-topic as question is more towards Linux
networking and not specifically about Netfilter.


thanks,
Martin
