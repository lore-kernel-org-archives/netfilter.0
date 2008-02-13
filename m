From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Blocking ports for outsider
Date: Wed, 13 Feb 2008 12:53:17 +0100
Message-ID: <001601c86e37$0636a400$0b0ffe0a@NS006819>
References: <1202726951.23042.0.camel@tarak.lk.com> <004f01c86cb5$64a933f0$0b0ffe0a@NS006819> <1202884987.12351.7.camel@tarak.lk.com>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1202884987.12351.7.camel@tarak.lk.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> i have made one iptables rule set for my mailserver, but the thing is
> that what i want from my rules, it's not responding in that way i
> want... might be some thing wrong with my ruleset.
>
>
> 1) Locally incoming ssh should be allowed from 2 local ips
> 2) 25, 110, 995, 80, 443 should be open for 0/0.
> 3) 10000, 5666 should be open for LAN[192.168.1.0/24] Network
>
> Those are the things i want..... Here is my ruleset in my
> MAILSERVER not in Gateway

> # smtp  One per second limt -burst rate of FIVE
> $IPTABLES -A INPUT -p tcp --dport 25 --syn -m limit --limit 1/s
> --limit-burst 5 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 25 --syn -j DROP
> $IPTABLES -A INPUT -p tcp --dport 25 -j ACCEPT

I don't think this will ever match. You accept 1 conn/sec on dport
25/tcp. Connections at a higher rate than 1/sec are DROPped. So what's
left to accept?

> $IPTABLES -A INPUT -m state --state NEW -p tcp -m multiport --dports
> 110,995,443,80,53 -j ACCEPT

Are you running a DNS server for the internet that only allows tcp
connections?

> #OUTPUT RULES
> $IPTABLES -A OUTPUT -o lo -j ACCEPT

I hadn't read all of the above yet, but this can be a (the) problem. You
only allow outgoing packets that use the lo interface. So, you may get
incoming packets from another host, but nothing will ever get out via
the actual network interfaces.

> #FORWARD RULES
> $IPTABLES -A FORWARD -m state --state INVALID -j DROP

Try with a simple ruleset first. If it works, you add more rules or
change them to be even more restrictive (but still let things work as
they should).

$ipt -P INPUT DROP
$ipt -P OUTPUT DROP
$ipt -P FORWARD DROP

$ipt -F
$ipt -X

$ipt -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

$ipt -N NEW_IN
# ssh in for LAN_IP1
$ipt -A NEW_IN -s $LAN_IP1 -p tcp --dport 22 -j ACCEPT
# ssh in for LAN_IP2
$ipt -A NEW_IN -s $LAN_IP2 -p tcp --dport 22 -j ACCEPT
# smtp in
$ipt -A NEW_IN -p tcp --dport 25 -j ACCEPT
# http in
$ipt -A NEW_IN -p tcp --dport 80 -j ACCEPT
# pop3 in
$ipt -A NEW_IN -p tcp --dport 110 -j ACCEPT
# https in
$ipt -A NEW_IN -p tcp --dport 443 -j ACCEPT
# pop3s in
$ipt -A NEW_IN -p tcp --dport 995 -j ACCEPT
# unknown service1 in for the LAN
$ipt -A NEW_IN -s $LAN_NET -p tcp --dport 5666 -j ACCEPT
# unknown service2 in for the LAN
$ipt -A NEW_IN -s $LAN_NET -p tcp --dport 10000 -j ACCEPT

$ipt -A INPUT -i lo -j ACCEPT
$ipt -A INPUT -m state --state NEW -j NEW_IN

$ipt -N NEW_OUT
# smtp out
$ipt -A NEW_OUT -p tcp --dport 25 -j ACCEPT
# dns out (tcp)
$ipt -A NEW_OUT -p tcp --dport 53 -j ACCEPT
# dns out (udp)
$ipt -A NEW_OUT -p udp --dport 53 -j ACCEPT
# icmp out
$ipt -A NEW_OUT -p icmp -j ACCEPT

$ipt -A OUTPUT -o lo -j ACCEPT
$ipt -A OUTPUT -m state --state NEW -j NEW_OUT


I think this should get you going. If it doesn't, place some logging
rules where appropriate to see where things are allowed or denied.


Grts,
Rob


