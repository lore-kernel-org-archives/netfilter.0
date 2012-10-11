From: Denys Fedoryshchenko <denys@visp.net.lb>
Subject: conntrack, NAT and icmp echo reply
Date: Thu, 11 Oct 2012 12:41:52 +0300
Message-ID: <e457eb3b6f3e357c3681c7af5f504161@visp.net.lb>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netdev@vger.kernel.org, netfilter@vger.kernel.org

Hi all

I have NAT box, with very simple rule
iptables -t nat -I POSTROUTING -s 10.0.0.0/8 -j MASQUERADE
It can be SNAT also, and it works fine, as NAT.

When i generate icmp _reply_ packet, to some host
hping -I ppp0 -1 --icmptype 0 8.8.8.8

It will pass the box, and will exit it without NAT, e.g. with original 
IP 10.x.x.x
on outgoing interface, which is not expected behavior IMHO.
Is it a bug or feature?

---
Denys Fedoryshchenko, Network Engineer, Virtual ISP S.A.L.
