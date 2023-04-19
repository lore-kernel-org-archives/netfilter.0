From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: UTF8 for non-breaking space reports junk in nftables [was Re: Rule
 error using ct helper for TFTP]
Date: Wed, 19 Apr 2023 10:30:13 +0200
Message-ID: <ZD+mlbFYeLpj0fs+@calendula>
References: <20988da8-f5d0-063d-0507-5472772b0b18@helixd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20988da8-f5d0-063d-0507-5472772b0b18@helixd.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Dario Alcocer <dalcocer@helixd.com>
Cc: netfilter@vger.kernel.org

Hi,

On Wed, Apr 19, 2023 at 01:14:23AM -0700, Dario Alcocer wrote:
> The nftables utility fails when using a "ct helper" rule for TFTP:
> 
> # /usr/sbin/nft -f /usr/share/netfw/netfw.conf
> /usr/share/netfw/netfw.conf:32:30-33: Error: Could not process rule: No such
> file or directory
>                  udp dport 69 ct helper set tftp
> ^^^^
> 
> How should nftables be configured so TFTP is allowed with a default-deny
> firewall?
> 
> For the record, I'm using nftables 1.0.2 built for an i.MX8 embedded
> platform running Linux 5.15.71.
> 
> The complete ruleset is:
> 
> flush ruleset
> table inet filter {
>         ct helper tftp {
>                 type "tftp" protocol udp;
>                 l3proto inet
>         }
>         chain input {
>                 type filter hook input priority filter; policy drop;
>                 ct state invalid drop comment "early drop of invalid
> packets"
>                 ct state established,related accept
>                 iif lo accept
>                 iif != lo ip daddr 127.0.0.1/8 drop
>                 iif != lo ip6 daddr ::1/128 drop
>                 ip protocol icmp accept
>                 ip6 nexthdr icmpv6 accept
>                 udp dport 69 ct helper set tftp
>         }
>         chain forward {
>                 type filter hook forward priority 0; policy drop;
>         }
> }

Changing topic.

Uh, copy and paste of this shows you use UTF8 for non-breaking space.

I have already seen this on several websites, the copy and paste of
the nftables snippets does not work because of this.

Typical error is:

x.nft:3:1-1: Error: syntax error, unexpected junk
        ct helper tftp {
^

Easy to fix with

sed -i 's/\xC2\xA0/ /g' myfile.
