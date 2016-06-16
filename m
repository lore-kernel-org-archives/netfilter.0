From: Dan Rimal <dan@danrimal.net>
Subject: nft chain route hook prerouting / postrouting
Date: Thu, 16 Jun 2016 10:44:10 +0200
Message-ID: <7a82f5ef-d22e-5d73-c46a-58043ee3fb09@danrimal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I am trying to rewrite some our firewalls from iptables to nft and i am
stucked on some iptables features.

We have two uplinks from different ISP, so we have 2 different public IP
adresses and LAN with NAT configuration.

Now, we mark packets on input to distinguish where packet come from to
our servers, and use this mark on "ip rule" to select appropriate
routing table, when packet goes back to internet. First routing table
have default route via ISP1, second routing table have default via ISP2,
because we can not send SRC IP1 via ISP2 and vice versa (uRPF).

Iptables do desired marking in this way:

## mark packet on input
iptables -t mangle -A PREROUTING -i $INET_IFACE -j MARK --set-mark 100
iptables -t mangle -A PREROUTING -i $INET2_IFACE -j MARK --set-mark 101

## save mark to conntrack when packet goes to LAN
iptables -t mangle -A POSTROUTING -j CONNMARK --save-mark
## restore mark to response when packet goes to the internet
iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark


On some routers, we even mark packet with mask, to preserve some qos
information saved on mark by TC, for example:


iptables -t mangle -A PREROUTING -i $INET_IFACE -j MARK --set-mark 201/0xff

iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark --mask 0xff


Is there any way, how to implement this behaviour in nftables? I tryied
to create chain type route hook prerouting/postrouting, but i have got:

./fw-base.nft:39:1-73: Error: Could not process rule: Operation not
supported
add chain ip route prerouting { type route hook prerouting priority 0; }

I tryied other hook and looks like only output hook is available for
now. Is it not implemented yet?

I tryied it on last fedora 23 with kernel 4.5.6-200.fc23.x86_64 with
nftables v0.4 and also on centos 7 with kernel
4.4.13-1.el7.elrepo.x86_64 and nftables v0.6

Thank you,

Daniel


