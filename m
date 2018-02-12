From: "toml@thlu.de" <toml@thlu.de>
Subject: 2 questions about rules for Multicast and ICMP
Date: Mon, 12 Feb 2018 12:17:41 +0100
Message-ID: <7c4c1159-c35e-87bd-271a-c8bdb89b9819@raspi1>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello @ all

I have some small problems with understanding and ask for some help.
Thank you very much! My Input- and Output-Policies are "drop", so I
think, I have to accept some special traffic for IPv4 and IPv6. At
first, I found these two variants (similar) on the web:

1.) as Packet-Type
     nft add rule ip tfilter cinput pkttype multicast counter accept

2.) as Multicast-Port
     nft add rule ip tfilter cinput tcp dport 5353 accept
     nft add rule ip tfilter cinput udp dport 5353 accept

Do both variants produce the same result? If not, which one is recommended?


And my second problem is ICMP. The Input-Rules are not a problem,
nether IPv4, nor IPv6 ( RFC 4890). I want  also accept all outgoing
ICMP, if I want to do a diagnostic against Net-Problems.

IPv4 is working fine:
nft add rule ip tfilter coutput ip protocol icmp counter accept

But I got a Problem with outgoing traffic and the same Statement (transmitted to ip6)
with IPv6. The translated rule from iptables...
nft add rule ip6 tfilter coutput meta l4proto ipv6-icmp counter accept

...seems to working  also fine, but I am realy unsure, if it is, what I
want to do. What is the right way to accept outgoing ICMP on IPv6?
Or is it normally sufficient to allow only outgoing echo-requests?

Best Regards from Germany
Thomas Luening


ps
I'm sorry, but I needed for this Mail the help from https://www.deepl.com/translator
