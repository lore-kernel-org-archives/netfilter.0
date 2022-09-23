From: Bruno Meirelles <bmeirelles@gmail.com>
Subject: Rule does not work. This is configuration error or bug?
Date: Fri, 23 Sep 2022 19:07:05 -0300
Message-ID: <88178cba-fbcf-70d0-bf11-380c4260d0cc@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=ID5yvQBG7eFRVd5Ph7o2P4lHCowDgh7G3Yz3kc4Ai4c=;
        b=CQLfiXxS/otRkJLMCp2w4pAo11OpuIHRMqwWJHInmbdgsjIeg+YGxbcBZO+80mRCeg
         7dvPoRA9yYpDTSQB3cphVK8XZW7m97xyOlWKeWs2WT4BMY8vaUcpf3G6iuB9VdOX6yn2
         Jhbb2ffefLY4ggryigOY0ajTbyoJjXHb0ClUWMtA5YaMyCIvxZYMn+AwaWG/BHfZnj9p
         6JhpV4D9L0e89BQfvcR3v6ANeVx7dozmYUZ/XfsGMqdATH9uu7w1MvNy+sdpRcwJwfbh
         sd4jnedhPAsr6fM+Vq9O19uX0xSV5o8e4QCXDHSymqqlB1dOPnaLo7WzDwW2DddFRuLW
         A8zA==
Content-Language: pt-BR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org


Hi friends,

I have a dns cache on my server listening on port 53 tcp/udp on dual stack.
I'm trying to use the following rule to capture traffic and redirect to 
my server:

nft add rule inet nat PREROUTING iifname "$LAN" meta l4proto {tcp, udp} 
th dport 53 counter redirect to :53 comment Redirect-DNS

In ipv4 traffic, the rule works perfectly. In ipv6 traffic I do not 
receive a response.

in the rule counter, the incoming packet appears:
table inet nat {
         chain PREROUTING {
                 type nat hook prerouting priority dstnat; policy accept;
                 iifname "br0" meta l4proto { tcp, udp } th dport 53 
counter packets 5 bytes 466 redirect to :53 comment "Redirect-DNS"

on nf_conntrack it appears unreplied:
  cat /proc/net/nf_conntrack | grep dport=53

ipv6     10 udp      17 19 src=fd00:ffff:fffe:0100:c4ce:ad03:0272:3513 
dst=fd00:ffff:fffe:0100:0000:0000:0000:0001 sport=54959 dport=53 
[UNREPLIED] src=2804:014d:5ca0:82f8:0000:0000:0000:0001              
dst=fd00:ffff:fffe:0100:c4ce:ad03:0272:3513 sport=53 dport=54959 mark=0 
zone=0 use=2
ipv6     10 udp      17 18 src=fd00:ffff:fffe:0100:c4ce:ad03:0272:3513 
dst=fd00:ffff:fffe:0100:0000:0000:0000:0001 sport=57101 dport=53 
[UNREPLIED] src=2804:014d:5ca0:82f8:0000:0000:0000:0001 
dst=fd00:ffff:fffe:0100:c4ce:ad03:0272:3513 sport=53 dport=57101 mark=0 
zone=0 use=2
ipv6     10 udp      17 19 src=fd00:ffff:fffe:0100:c4ce:ad03:0272:3513 
dst=fd00:ffff:fffe:0100:0000:0000:0000:0001 sport=49518 dport=53 
[UNREPLIED] src=2804:014d:5ca0:82f8:0000:0000:0000:0001 
dst=fd00:ffff:fffe:0100:c4ce:ad03:0272:3513 sport=53 dport=49518 mark=0 
zone=0 use=2

in nf_conntrack, the answer is coming out with the wrong ip, with prefix 
2804. the interface has 2 ips. The 2804 is dynamic, added by dhcpv6 and 
fd00 is static manually configured.

The query is from fd00 to fd00. shouldn't the answer come out with fd00 too?

What did I do wrong? How do I solve this? Can you help me?

Thanks,

Bruno.



