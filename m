From: Pete Kay <petedao@gmail.com>
Subject: Problem with NAT rule
Date: Sat, 24 Jul 2010 21:41:45 +0800
Message-ID: <AANLkTi=SSSJJJVO7J6PSW52F=yRxr+9mqvhSObX8qLdr@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=NGjYorottfFPssIqMnhu2FVZBnQ7dm+ZpcIHoixMwMo=;
        b=omkS065J53t8pHd7j4+05U3Qi/WwzDpTVVyHSbOQ8TazDtaHoKpRFQx7IHMAkX+eKq
         LWTDp+TGAUNh0cpaijDMVLV3X1/oEWaVqfpuDJwyeAdj/iAza8wwDVypouPJDkK9jQxN
         AtN+S58aMzWfv1cnJz14DiskZ4aLl19WEqVLQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I would like to setup my iptable rules to forward udp packet from one
device to another:

192.168.1.100:16385  <---------> 192.168.1.114:29848 :: 192.168.1.200
:29850  <----------> 192.168.1.300:10112

What I want to do is forward all packets from 192.168.1.100:16385 to
192.168.1.300:10112 and all packets from 192.168.1.300:10112 to
192.168.1.100:16385

Here is my iptables rule:


Building chain index
Number of user defined chains:0 bucket_sz:40 array_sz:0
iptc_first_chain: : returning `PREROUTING'
iptc_get_policy: called for chain PREROUTING
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
iptc_first_rule: first rule(PREROUTING): 0xc02ac0
WARNING: handle->chain_index_sz == 0
DNAT       udp  --  192.168.1.100         anywhere            udp
spt:16385 to:192.168.1.300:10112
iptc_next_rule: rule_iterator_cur=0xc02d00...next=0xc02e20,
head=0xc02a90...returning rule 0xc02e20
WARNING: handle->chain_index_sz == 0
DNAT       udp  --  192.168.1.300         anywhere            udp
spt:10112 to:192.168.1.100:16385
iptc_next_rule: rule_iterator_cur=0xc02e20...next=0xc02a90,
head=0xc02a90...finished, returning NULL
iptc_next_chain: : returning `POSTROUTING'

iptc_get_policy: called for chain POSTROUTING
Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
iptc_first_rule: first rule(POSTROUTING): 0xc030b0

WARNING: handle->chain_index_sz == 0
SNAT       udp  --  192.168.1.100         anywhere            udp
spt:16385 to:192.168.1.200:29848
iptc_next_rule: rule_iterator_cur=0xc032f0...next=0xc03410,
head=0xc03080...returning rule 0xc03410
WARNING: handle->chain_index_sz == 0
SNAT       udp  --  192.168.1.300         anywhere            udp
spt:10112 to:192.168.1.200:29850
iptc_next_rule: rule_iterator_cur=0xc03410...next=0xc03080,
head=0xc03080...finished, returning NULL
iptc_next_chain: : returning `OUTPUT'

iptc_get_policy: called for chain OUTPUT

===========
When I send packet from the two devices, I am just getting packets
going into 192.168.1.200 instead of any packet going out:

20:57:57.765252 IP 192.168.1.300:10112 > 192.168.1.200 :29850: udp/rtp
160 c0  11386 1869684
20:57:57.784333 IP 192.168.1.100:16385 > 192.168.1.200 :29848: udp/rtp
240 c0  17019 125650088
20:57:57.785250 IP 192.168.1.300:10112 > 192.168.1.200 :29850: udp/rtp
160 c0  11387 1869844
20:57:57.805246 IP 192.168.1.300:10112 > 192.168.1.200 :29850: udp/rtp
160 c0  11388 1870004
20:57:57.815415 IP 192.168.1.100:16385 > 192.168.1.200 :29848: udp/rtp
240 c0  17020 125650328
20:57:57.825249 IP 192.168.1.300:10112 > 192.168.1.200 :29850: udp/rtp
160 c0  11389 1870164
20:57:57.843951 IP 192.168.1.100:16385 > 192.168.1.200 :29848: udp/rtp
240 c0  17021 125650568
20:57:57.845247 IP 192.168.1.300:10112 > 192.168.1.200 :29850: udp/rtp
160 c0  11390 1870324
20:57:57.865242 IP 192.168.1.300:10112 > 192.168.1.200 :29850: udp/rtp
160 c0  11391 1870484
20:57:57.874332 IP 192.168.1.100:16385 > 192.168.1.200 :29848: udp/rtp
240 c0  17022 125650808
20:57:57.885242 IP 192.168.1.300:10112 > 192.168.1.200 :29850: udp/rtp
160 c0  11392 1870644
20:57:57.903563 IP 192.168.1.100:16385 > 192.168.1.200 :29848: udp/rtp
240 c0  17023 125651048
20:57:57.905242 IP 192.168.1.300:10112 > 192.168.1.200 :29850: udp/rtp
160 c0  11393 1870804
20:57:57.925240 IP 192.168.1.300:10112 > 192.168.1.200 :29850: udp/rtp
160 c0  11394 1870964
20:57:57.935888 IP 192.168.1.100:16385 > 192.168.1.200 :29848: udp/rtp
240 c0  17024 125651288
20:57:57.945240 IP 192.168.1.300:10112 > 192.168.1.200 :29850: udp/rtp
160 c0  11395 1871124
20:57:57.964250 IP 192.168.1.100:16385 > 192.168.1.200 :29848: udp/rtp
240 c0  17025 125651528
20:57:57.965238 IP 192.168.1.300:10112 > 192.168.1.200 :29850: udp/rtp
160 c0  11396 1871284
20:57:57.985233 IP 192.168.1.300:10112 > 192.168.1.200 :29850: udp/rtp
160 c0  11397 1871444


Can someone please help me to put out the problem in my iptable rules?

thanks,
P
