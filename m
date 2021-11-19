From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Both { tcp, udp} in meta vmap
Date: Fri, 19 Nov 2021 10:02:10 +0100
Message-ID: <YZdoEtSthtB3W+0K@salvia>
References: <CAOLfK3XWGpo9OdjQy68DRp2BQ0ttaNsAznO3ed=Xg6Uky4mC0w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOLfK3XWGpo9OdjQy68DRp2BQ0ttaNsAznO3ed=Xg6Uky4mC0w@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter <netfilter@vger.kernel.org>

On Thu, Nov 18, 2021 at 06:44:22PM -0600, Matt Zagrabelny wrote:
> Greetings,
> 
> I have the following rules:
> 
> table inet filter {
>         chain input {
>                 type filter hook input priority 0; policy drop;
>                 ip6 nexthdr ipv6-icmp icmpv6 type { nd-router-advert,
> nd-neighbor-solicit, nd-neighbor-advert } accept

Replace 'ip6 nexthdr ipv6-icmp icmpv6 type' by 'icmpv6 type' is just fine.
Please have a look at this, there is a note specifically on matching
icmpv6 traffic:

https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_headers#Matching_IPv6_headers

>                 ct state vmap { invalid : drop, established : accept,
> related : accept }
>                 tcp dport { 1812, 1813 } meta protocol vmap { ip :
> jump radius_ipv4, ip6 : jump radius_ipv6 }
>         }
> 
>         # contrived chains...
>         chain radius_ipv4 {
>                 ip saddr { 127.0.0.0/8, } accept
>         }
> 
>         chain radius_ipv6 {
>                 ip6 saddr { ::1 } accept
>         }
> }
> 
> I'd like to change the "tcp dport { 1812, 1813 }" to "{ tcp, udp }
> dport { 1812, 1813 }", but I'm getting the error [...]

Use:

        ... meta l4proto { tcp, udp } th dport { 1812, 1813 }
