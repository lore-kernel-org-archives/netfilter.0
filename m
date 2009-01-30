From: Michail Zhilkin <myz@csu.ru>
Subject: ebtables without bridge
Date: Sat, 31 Jan 2009 03:32:58 +0500 (YEKT)
Message-ID: <20090131024543.M20230@mail.csu.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi ALL!

I have a box running Fedora 9 Linux with kernel 2.6.26.3 SMP x86_64.
All necessary Netfilter kernel modules are compiled and loaded.

I have no bridge interfaces at all, only one physical Ethernet card.

Is it possible to filter incoming and outgoing Layer2 traffic using 
ebtables in this case?

I tried to load simple rules to test ebtables firewall:

[root@space]# ebtables -P INPUT DROP
[root@space]# ebtables -P OUTPUT DROP
[root@space]# ebtables -P FORWARD DROP
[root@space]# ebtables -L --Ln
Bridge table: filter

Bridge chain: INPUT, entries: 0, policy: DROP

Bridge chain: FORWARD, entries: 0, policy: DROP

Bridge chain: OUTPUT, entries: 0, policy: DROP


All traffic should be blocked, but I can send and receive everything... 
f.e. can ping hosts in my LAN, make connections and so on.

I tried also to set up some rules like: ebtables -A INPUT -i eth0 -j DROP
but they have the same effect!

What is wrong? Are ebtables really designed for bridges only?
If so, what cat I do?

I would like to drop all Layer2 traffic except 
Ethernet frames with IPv4 and ARP protocols. In addition, i need only 
allow frames with my MAC-address (incoming and outgoing, i.e. locally 
generated).

The second is possible using iptables firewall (with -m mac), but only for 
INCOMING frames, not outgoing.

---
   Mike.
