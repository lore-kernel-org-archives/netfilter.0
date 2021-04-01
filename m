From: Pavan Amancherla <pavan.ramanaiah@gmail.com>
Subject: SNAT/Masquerade not modifying the Source IP randomly
Date: Thu, 1 Apr 2021 12:48:04 +0530
Message-ID: <CABXv9e_UJ7cN+Gw-q9M2PYdhptDMu7afW3O-M+3uH8Xmrvtcag@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=xPyJmCaMswRDdFQ4uCNQLLmowQFBcmy04YWZ5gRiruM=;
        b=N26g0LGonKQIEMMIq6s8Hvx3/iafG666r/vbBaBy4GSm3+ZxrE8R9fCJMjvC9/Tt+z
         KrO6dYnsj7TANY255NnHTQ84r4eAN8USwv4zi7Mceejsx4U/0yKdv/UrpZEVD40+O167
         tooPdAWu9tjq4kr/nm0wdn+vYmUnvezEQkMQP5nLLLPtCXeH5VRrKoWKxNRZrKjMY0AN
         96KFfoPrK4WJytzZUb3ef/5Eqsx0BZkcHLBoYwUUgIgkY+ta3DiDN67njM/OolIvT4oa
         +0s2H20hsMtqHk5Z1k/7fXfabxmpk/88vraj9Y+JT3HZNDLNUF1Sey7ZOZzRP/jA6Seu
         tNxg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

We do SNAT in our system in the POSTROUTING chain. But we find that
once in a while the source IP did not get modified. The packet is
going out with the internal IP. We are using IP Tables version - 1.6.2
Linux Kernel version - 4.14.78

Following are the NAT rules - ~ # iptables -S -t nat

-P PREROUTING ACCEPT

-P INPUT ACCEPT

-P OUTPUT ACCEPT

-P POSTROUTING ACCEPT

-A POSTROUTING -o wwan0 -j MASQUERADE

wwan0 is the default gateway.

How to fix this problem.

Snapshot of TCP Dump. The internal IP's (172.16..) are highlighted.
The translated IP is 100.86.203.169. We can find several NAT happening
correctly. Once in 10 to 15 minutes we find few entries of source IP
not translated.

17:13:51.939700 IP 100.86.203.169.47554 >
135.sub-198-224-172.myvzw.com.domain: 64282+ AAAA?
connectivitycheck.gstatic.com. (47)

17:13:52.033482 IP 135.sub-198-224-172.myvzw.com.domain >
100.86.203.169.47554: 63258 1/0/0 A 172.217.11.163 (63)

17:13:52.033598 IP 100.86.203.169.hostmon > 224.0.0.252.hostmon: UDP, length 27

17:13:52.042355 IP 135.sub-198-224-172.myvzw.com.domain >
100.86.203.169.47554: 64282 1/0/0 AAAA 2607:f8b0:4007:804::2003 (75)

17:13:52.043389 IP 100.86.203.169 > lax28s15-in-f3.1e100.net: ICMP
echo request, id 34628, seq 0, length 64

17:13:52.132848 IP lax28s15-in-f3.1e100.net > 100.86.203.169: ICMP
echo reply, id 34628, seq 0, length 64

17:13:52.237290 IP 172.16.9.59.63478 > lax31s14-in-f14.1e100.net.443:
UDP, length 1350

17:13:52.366892 IP 100.86.203.169.hostmon > 224.0.0.252.hostmon: UDP, length 27

17:13:52.416431 IP 172.16.9.68.45839 >
lax17s14-in-f14.1e100.net.https: Flags [F.], seq 1838160668, ack
751548505, win 373, options [nop,nop,TS val 31214649 ecr 2926508259],
length 0

17:13:52.419421 IP 172.16.9.68.45840 >
lax17s14-in-f14.1e100.net.https: Flags [F.], seq 3938547017, ack
4273274368, win 373, options [nop,nop,TS
