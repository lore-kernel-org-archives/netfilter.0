From: Aleksander Morgado <aleksander@aleksander.es>
Subject: IP masquerading not applied in TCP retransmission packets
Date: Fri, 3 Jul 2020 13:54:50 +0200
Message-ID: <86a0fca6-4ac9-84e6-47d8-5911ee8ffbdb@aleksander.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=nI9AAfLB3pTSpqijmIKSwoXi62eBRtRWVHDFW8b6LaU=;
        b=YaebDgz841WnoZXaTX3VPBH6cUYxrQsymFXMzaxMNrSIdaiUaNXLVR8ChZzxIFIb/p
         SHKwTy1COrP6WBDX3+ZfQpvdeKcU99GyCpMz9r7DdZzL9OGP1flEb8umqwAgTKPkg9aO
         i4XpjIbgYGnRkRjR4zMpvsvq4ygAgQf/KdH2Ko8bFuc6mujufcFMxjWcGnJ/8D6DIhCb
         qbinobi35x+7OZfX8RSJr+7S/YHWLYtE24gy/wAB60lH6n8/hhSVR4VPMzLqqrlI/UjD
         cePturuUg/+Rmq6/5xfUsnEjMBBHusn6OAoWKmqFsXmDQIa8O/lKXmq/4u9DYqFj5zhC
         nGQQ==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hey all,

I'm trying to debug an issue found on an old Ubuntu 14.04 system running kernel 3.13.0-53 with iptables v1.4.21. The system acts as a router providing access to the Internet to several subnets, with the usual NAT rules:

  $ sudo iptables -t nat -S
  -P PREROUTING ACCEPT
  -P INPUT ACCEPT
  -P OUTPUT ACCEPT
  -P POSTROUTING ACCEPT
  -A POSTROUTING -o eth0 -j MASQUERADE

The FORWARD chain rules in the main table look like this:
  $ sudo iptables -S
  ...
  -P FORWARD ACCEPT
  -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

The problem I am seeing is that TCP retransmissions originated in the subnet clients end up WITHOUT the IP masquerading applied, i.e. the original client IP of the subnet is found in the IP packets instead of the IP address of the outgoing interface in the router. I saw this issue in a system in production, and I attempted to reproduce the problem with some iptables DROP rules that trigger it.

In the tcpdump below, there is one client with IP 10.10.0.20 in one of the subnets, which attempts to access HTTPS port at a server 176.28.121.13. In order to trigger the issue, I added the following two rules in the router, which end up dropping some packets from the remote server:
  $ sudo iptables -A FORWARD -p tcp --tcp-flags PSH PSH -s 176.28.121.13 -j DROP
  $ sudo iptables -A FORWARD -p tcp --tcp-flags SYN,ACK ACK -s 176.28.121.13 -j DROP
These rules will allow the TCP session establishment to succeed, but further packets from the server will be dropped and never reach the client, hence triggering the retransmissions. This is similar to what I saw in the real production system.

Once the 10.10.0.20 client attempts to wget at the HTTPS port, this is what the router captures. At 07:35:06.670227 the client sends the first data packet AFTER the TCP establishment is finished, with the correct source IP after masquerading applied (192.168.1.11); and at 07:35:06.886426 the client starts to sends retransmissions of that packet, with the wrong source IP as if masquerading wasn't applied (10.10.0.20). Due to the DROP rules, some retransmissions are also seen from server to client, which ought to be ignored.

  $ sudo tcpdump -i eth0 -n -vv host 176.28.121.13
  tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 65535 bytes
  07:35:06.645804 IP (tos 0x0, ttl 63, id 8792, offset 0, flags [DF], proto TCP (6), length 60)
      192.168.1.11.38444 > 176.28.121.13.443: Flags [S], cksum 0xcd2b (correct), seq 4060272425, win 14600, options [mss 1460,sackOK,TS val 7009649 ecr 0,nop,wscale 6], length 0
  07:35:06.661298 IP (tos 0x0, ttl 50, id 0, offset 0, flags [DF], proto TCP (6), length 60)
      176.28.121.13.443 > 192.168.1.11.38444: Flags [S.], cksum 0x7bf1 (correct), seq 1857313968, ack 4060272426, win 28960, options [mss 1460,sackOK,TS val 1983371123 ecr 7009649,nop,wscale 7], length 0
  07:35:06.665797 IP (tos 0x0, ttl 63, id 8793, offset 0, flags [DF], proto TCP (6), length 52)
      192.168.1.11.38444 > 176.28.121.13.443: Flags [.], cksum 0x1af7 (correct), seq 1, ack 1, win 229, options [nop,nop,TS val 7009651 ecr 1983371123], length 0
  07:35:06.670227 IP (tos 0x0, ttl 63, id 8794, offset 0, flags [DF], proto TCP (6), length 569)
      192.168.1.11.38444 > 176.28.121.13.443: Flags [P.], cksum 0xe0bd (correct), seq 1:518, ack 1, win 229, options [nop,nop,TS val 7009652 ecr 1983371123], length 517
  07:35:06.686080 IP (tos 0x0, ttl 50, id 35642, offset 0, flags [DF], proto TCP (6), length 52)
      176.28.121.13.443 > 192.168.1.11.38444: Flags [.], cksum 0x18d3 (correct), seq 1, ack 518, win 235, options [nop,nop,TS val 1983371147 ecr 7009652], length 0
  07:35:06.689624 IP (tos 0x0, ttl 50, id 35643, offset 0, flags [DF], proto TCP (6), length 2948)
      176.28.121.13.443 > 192.168.1.11.38444: Flags [.], cksum 0xf653 (incorrect -> 0xfeda), seq 1:2897, ack 518, win 235, options [nop,nop,TS val 1983371151 ecr 7009652], length 2896
  07:35:06.693880 IP (tos 0x0, ttl 50, id 35645, offset 0, flags [DF], proto TCP (6), length 182)
      176.28.121.13.443 > 192.168.1.11.38444: Flags [P.], cksum 0x5ac2 (correct), seq 2897:3027, ack 518, win 235, options [nop,nop,TS val 1983371152 ecr 7009652], length 130
  07:35:06.737033 IP (tos 0x0, ttl 50, id 35646, offset 0, flags [DF], proto TCP (6), length 182)
      176.28.121.13.443 > 192.168.1.11.38444: Flags [P.], cksum 0x5a92 (correct), seq 2897:3027, ack 518, win 235, options [nop,nop,TS val 1983371200 ecr 7009652], length 130
  07:35:06.886426 IP (tos 0x0, ttl 63, id 8795, offset 0, flags [DF], proto TCP (6), length 569)
      10.10.0.20.38444 > 176.28.121.13.443: Flags [P.], cksum 0x983d (incorrect -> 0xae40), seq 4060272426:4060272943, ack 1857313969, win 229, options [nop,nop,TS val 7009674 ecr 1983371123], length 517
  07:35:07.326274 IP (tos 0x0, ttl 63, id 8796, offset 0, flags [DF], proto TCP (6), length 569)
      10.10.0.20.38444 > 176.28.121.13.443: Flags [P.], cksum 0x9811 (incorrect -> 0xaf16), seq 0:517, ack 1, win 229, options [nop,nop,TS val 7009718 ecr 1983371123], length 517
  07:35:08.206216 IP (tos 0x0, ttl 63, id 8797, offset 0, flags [DF], proto TCP (6), length 569)
      10.10.0.20.38444 > 176.28.121.13.443: Flags [P.], cksum 0x97b9 (incorrect -> 0xaebf), seq 0:517, ack 1, win 229, options [nop,nop,TS val 7009806 ecr 1983371123], length 517
  07:35:09.968670 IP (tos 0x0, ttl 63, id 8798, offset 0, flags [DF], proto TCP (6), length 569)
      10.10.0.20.38444 > 176.28.121.13.443: Flags [P.], cksum 0x9709 (incorrect -> 0xae10), seq 0:517, ack 1, win 229, options [nop,nop,TS val 7009982 ecr 1983371123], length 517
  07:35:10.465205 IP (tos 0x0, ttl 50, id 35647, offset 0, flags [DF], proto TCP (6), length 1500)
      176.28.121.13.443 > 192.168.1.11.38444: Flags [.], cksum 0x3a54 (correct), seq 1:1449, ack 518, win 235, options [nop,nop,TS val 1983374928 ecr 7009652], length 1448
  07:35:13.496087 IP (tos 0x0, ttl 63, id 8799, offset 0, flags [DF], proto TCP (6), length 569)
      10.10.0.20.38444 > 176.28.121.13.443: Flags [P.], cksum 0x95a8 (incorrect -> 0xa8b3), seq 0:517, ack 1, win 229, options [nop,nop,TS val 7010335 ecr 1983371123], length 517
  07:35:17.937184 IP (tos 0x0, ttl 50, id 35648, offset 0, flags [DF], proto TCP (6), length 1500)
      176.28.121.13.443 > 192.168.1.11.38444: Flags [.], cksum 0x1d24 (correct), seq 1:1449, ack 518, win 235, options [nop,nop,TS val 1983382400 ecr 7009652], length 1448
  07:35:20.546195 IP (tos 0x0, ttl 63, id 8800, offset 0, flags [DF], proto TCP (6), length 569)
      10.10.0.20.38444 > 176.28.121.13.443: Flags [P.], cksum 0x92e7 (incorrect -> 0xa964), seq 0:517, ack 1, win 229, options [nop,nop,TS val 7011040 ecr 1983371123], length 517
  ...

Any idea why this issue may happen? Does it look like a bug in the NAT processing?
How could I debug this further?

I know the kernel and iptables version in use are pretty old, but I currently cannot attempt to upgrade them to newer versions. I may be able to apply single patches on top of the currently used kernel or iptables, though, if anyone can spot some already available fix applied in the last 7 years... :D

I've uploaded here two tcpdump captures showing the problem; the original one from the system in production and the one reproduced in the lab:
  https://aleksander.es/other/20200521-tcpdump-ORIGINAL.pcap
  (10.10.0.49 is the client IP in the subnet, 109.119.83.8 is the outgoing local IP address of the router)
  https://aleksander.es/other/20200703-tcpdump-REPRODUCED.cap
  (10.10.0.20 is the client IP in the subnet, 192.168.1.11 is the outgoing local IP address of the router)

Any help would be greatly appreciated!
Cheers

-- 
Aleksander
https://aleksander.es
