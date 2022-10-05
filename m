From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Rule does not work. This is configuration error or bug?
Date: Thu, 6 Oct 2022 00:25:54 +0200
Message-ID: <Yz4Ecl0JWtxPYMsc@salvia>
References: <88178cba-fbcf-70d0-bf11-380c4260d0cc@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <88178cba-fbcf-70d0-bf11-380c4260d0cc@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bruno Meirelles <bmeirelles@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

On Fri, Sep 23, 2022 at 07:07:05PM -0300, Bruno Meirelles wrote:
> 
> Hi friends,
> 
> I have a dns cache on my server listening on port 53 tcp/udp on dual stack.
> I'm trying to use the following rule to capture traffic and redirect to my
> server:
> 
> nft add rule inet nat PREROUTING iifname "$LAN" meta l4proto {tcp, udp} th
> dport 53 counter redirect to :53 comment Redirect-DNS
> 
> In ipv4 traffic, the rule works perfectly. In ipv6 traffic I do not receive
> a response.
> 
> in the rule counter, the incoming packet appears:
> table inet nat {
>         chain PREROUTING {
>                 type nat hook prerouting priority dstnat; policy accept;
>                 iifname "br0" meta l4proto { tcp, udp } th dport 53 counter
> packets 5 bytes 466 redirect to :53 comment "Redirect-DNS"
> 
> on nf_conntrack it appears unreplied:
>  cat /proc/net/nf_conntrack | grep dport=53
> 
> ipv6     10 udp      17 19 src=fd00:ffff:fffe:0100:c4ce:ad03:0272:3513
> dst=fd00:ffff:fffe:0100:0000:0000:0000:0001 sport=54959 dport=53 [UNREPLIED]
> src=2804:014d:5ca0:82f8:0000:0000:0000:0001             
> dst=fd00:ffff:fffe:0100:c4ce:ad03:0272:3513 sport=53 dport=54959 mark=0
> zone=0 use=2
> ipv6     10 udp      17 18 src=fd00:ffff:fffe:0100:c4ce:ad03:0272:3513
> dst=fd00:ffff:fffe:0100:0000:0000:0000:0001 sport=57101 dport=53 [UNREPLIED]
> src=2804:014d:5ca0:82f8:0000:0000:0000:0001
> dst=fd00:ffff:fffe:0100:c4ce:ad03:0272:3513 sport=53 dport=57101 mark=0
> zone=0 use=2
> ipv6     10 udp      17 19 src=fd00:ffff:fffe:0100:c4ce:ad03:0272:3513
> dst=fd00:ffff:fffe:0100:0000:0000:0000:0001 sport=49518 dport=53 [UNREPLIED]
> src=2804:014d:5ca0:82f8:0000:0000:0000:0001
> dst=fd00:ffff:fffe:0100:c4ce:ad03:0272:3513 sport=53 dport=49518 mark=0
> zone=0 use=2
> 
> in nf_conntrack, the answer is coming out with the wrong ip, with prefix
> 2804. the interface has 2 ips. The 2804 is dynamic, added by dhcpv6 and fd00
> is static manually configured.
> 
> The query is from fd00 to fd00. shouldn't the answer come out with fd00 too?
> 
> What did I do wrong? How do I solve this? Can you help me?

Could you check if packets are being marked as invalid by conntrack?
In such case packets get no conntrack entry attached, in such case NAT
cannot be applied.
