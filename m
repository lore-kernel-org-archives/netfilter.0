From: Michael Ludvig <mludvig@logix.net.nz>
Subject: How to use IPv6 SNPT?
Date: Thu, 20 Dec 2012 01:07:10 +1300
Message-ID: <50D1ADEE.8010805@logix.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi guys

I did some experimenting with the new NAT support for IPv6 and was quite
impressed how smoothly MASQUERADE and SNAT work.

However I didn't have any success with IPv6 SNPT. As I understand it
SNPT is meant for 1:1 address translation and should simply replace src
prefix with dst prefix.

For testing I use fd00::/64 address range in my VirtualBox network with
SLAAC addresses.

ip6tables -t nat -I POSTROUTING -s fd00::/64 \
    -j SNPT --src-pfx fd00::/64 --dst-pfx 2001:e20:2000:xx::/64

The strange thing is that only the first ping6 packet to google is
translated, the subsequent ones on the external interface are still in
fd00::/64:

Seq 1 - translated:
00:49:25.699206 IP6 2001:e20:2000:xx:b5d0:27ff:feec:3987 > \
    2404:6800:4006:804::1017: ICMP6, echo request, seq 1, length 64

Seq 2&3 - untranslated source:
00:49:26.699498 IP6 fd00::a00:27ff:feec:3987 > \
    2404:6800:4006:804::1017: ICMP6, echo request, seq 2, length 64
00:49:27.699436 IP6 fd00::a00:27ff:feec:3987 > \
    2404:6800:4006:804::1017: ICMP6, echo request, seq 3, length 64

Once I remove the SNPT rule and replace it with a simple -j MASQUERADE
it begins to work. Forwarding is obviously enabled and no other firewall
rules are in place (neither in 'nat' table nor elsewhere). My kernel is
3.7.0-rc8, iptables from the current git checkout.

What am I doing wrong?

Thanks!

Michael



