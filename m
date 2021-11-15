From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: nft named set address types
Date: Mon, 15 Nov 2021 11:40:43 -0600
Message-ID: <CAOLfK3XJHhm5z6b1MOaMFjK2P2V9jyPgOtSOFZUswPSxuEZLEA@mail.gmail.com>
References: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
 <CAOLfK3XW28kgrBGpQvi9eO3h2oQD80kU6tqz0obgSfvkgbF5-A@mail.gmail.com> <YYGeTgBAZfM76k4h@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4HtGgq10g8z9vCBY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qj+4PkVdW8JGsOlaiwgN6JkO4/mw4er5mIRfyer1GGM=;
        b=L4DpMgCTtXe+/bfAzGtWkMuZvX7Gdr5Bhlcp7/poLxI7dKj/N2+L0u/iPJcBaz0x8W
         vqP9JwYcNB6JTst8P1SdfGsPGQQVzo4TUraq7N5LyOt/AdhAA0umMoeafK8cBuNIY/mv
         9tsRDt5poYQhOXmv3my4KTTKEY2vpfp8z/7SYB8TrWbhBLbSfLlbtpDjdOOsO/aTVVu+
         kkedlANCYsauId1g2PtcFJLr+qQAuRoCppiR3SuH9vnIrImTDkH7TWJZIhWgNfoWl/Hc
         OwOrhwVI57a4Qnx/AquIhvJ2PDnRDlFfZGkwqo0M9CUHFMalY42UAiSkog/ZihjrhlA5
         Lh8Q==
In-Reply-To: <YYGeTgBAZfM76k4h@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter <netfilter@vger.kernel.org>

Hello Pablo and others,

I'm attempting to have a similar ICMP{4,6} ruleset as I have for TCP -
thanks Pablo for the vmap hint.

On Tue, Nov 2, 2021 at 3:23 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> Better split your ruleset in a tree using verdict maps:
>
> table inet filter {
>     chain input_ip4 {
>         ip saddr 127.0.0.1 accept
>     }
>
>     chain input_ip6 {
>         ip6 saddr ::1 accept
>     }
>
>     chain input {
>         type filter hook input priority filter; policy drop;
>         ct state vmap { established : accept, related : accept, invalid : drop }
>         # implicit match on 'ct state new,untracked'
>         tcp dport 22 meta protocol vmap { ip : jump input_ip4, ip6 : jump input_ip6 }
>     }
> }

I see there is an icmpx for reject packets. Is there something
equivalent for destination packets?

I've tried:

table inet filter {
    chain icmp_ipv4 {
        ip  saddr $icmp_networks_ipv4 accept
    }

    chain icmp_ipv6 {
        ip6 saddr $icmp_networks_ipv6 accept
    }

    chain input {
        meta protocol {icmp, icmpv6} vmap {
            icmp: jump icmp_ipv4,
            icmpv6: jump icmp_ipv6,
        }
    }
}

Nov 15 11:39:05 watchtower nft[3709857]: In file included from
/etc/nftables.conf.d/100-include.nft:5:1-48:
Nov 15 11:39:05 watchtower nft[3709857]:                  from
/etc/nftables.conf:3:1-37:
Nov 15 11:39:05 watchtower nft[3709857]:
/etc/nftables.conf.d/600-host.d/100-icmp.nft:11:38-41: Error: syntax
error, unexpected vmap, expecting newline or semicolon
Nov 15 11:39:05 watchtower nft[3709857]:         meta protocol {icmp,
icmpv6} vmap {

Is there no vmap for icmp?

Thanks for any help or hints!

-m
