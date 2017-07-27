From: James <vger_tracker@trackivity.com>
Subject: Re: recent module in nftables
Date: Thu, 27 Jul 2017 18:18:53 -0400
Message-ID: <81f26443-f000-96d2-a049-427e29605a7b@trackivity.com>
References: <20170727155959.758138ab@lustre.ryper.org>
 <20170727214626.GB25160@harrier.slackbuilds.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20170727214626.GB25160@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

>> It may be way to early to ask this question, but I thought I might
>> as well see if anyone has any information on it.
>>
>> Will the "recent" module or an option with a similar function be
>> introduced into nftables in the future? Are there any plans to
>> create something like this? It has always been a very good tool
>> for keeping bad IPs from touching my system.
> 
> I don't know nftables yet, but I do know that ipset(8) and the set
> match and the SET target can accomplish the same things recent does.
> Also, I believe a set functionality exists in nftables.
> 

How about the following?  It's trimmed/sanitized from my full config (I hope
there are no typo's in this).  Currently blocking ~4,000 addresses.

Separately, I use swatchd to extract addresses from log files and add them
to various other sets (that are not included in this extract) as my own take
on fail2ban.

nftables is great!

<--- snip --->

#!/usr/sbin/nft -f

flush ruleset

# flush table inet firewall

table inet firewall {
  set v4autohole { type ipv4_addr; timeout 31d; }
  set v6autohole { type ipv6_addr; timeout 31d; }
  chain incoming {
   type filter hook input priority 0; policy drop;
   iifname lo accept
   ct state { invalid } drop
   ip saddr @v4blackhole drop
   ip6 saddr @v6blackhole drop
   ip protocol { icmp } icmp type { echo-request } accept
   ip6 nexthdr { ipv6-icmp } icmpv6 type { echo-request } accept
   ip6 nexthdr { ipv6-icmp } icmpv6 type { nd-router-advert, nd-redirect, nd-neighbor-advert, nd-neighbor-solicit } accept
   ct state { new } tcp dport { ssh } accept
   ct state { established, related } accept
   # Following are some well-established public content-providing service ports that it is
   # reasonable folks would go looking for so drop 'em but don't bother autoholing them
   udp dport { dns, ntp } drop
   tcp dport { ftp, smtp, dns, gopher, http, ntp, https } drop
   # Drop everyone else into a deep dark hole for 31 days
   meta protocol ip set add ip saddr @v4autohole
   meta protocol ip6 set add ip6 saddr @v6autohole
  }
  chain forwarding {
   type filter hook forward priority 0; policy drop;
  }
  chain outgoing {
   type filter hook output priority 0; policy drop;
   iifname lo accept
   ip6 nexthdr { ipv6-icmp } icmpv6 type { echo-request, nd-neighbor-advert, nd-neighbor-solicit } accept
   ct state { new, established, related } accept
  }
}

<--- snip --->

-- 

  - James
