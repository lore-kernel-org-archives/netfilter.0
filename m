From: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
Subject: Re: using sets as snat targets in nat tables
Date: Mon, 25 Apr 2022 19:54:37 +0200
Message-ID: <875ymxkq02.fsf@alfa.kjonca>
References: <CAF358wSzMHJQahvxXLofKF-bMc-xev10xjPbGCcZSpie1BMQhQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1650909278; bh=4gB2YCL31kFIwQET9B+DuMtKcgNrnHFONXFZ9LXDPgI=;
        h=From:To:Subject:References:Date:In-Reply-To:From;
        b=eU0El49ThP0UfHkWA9hNMVC2MjAdT3yRI0kFs48pvd0J46Qci0lQRVul7oWu/upAI
         NHudCYOZFHKrkeKX2WNS28G5TjO0/ViXe0+eunselj0xjsovwjrwPdP6jrHbziTN6J
         t5D1wowryh8j+8Hp27xvuTTCyZi2yVfD++MYtf94=
In-Reply-To: <CAF358wSzMHJQahvxXLofKF-bMc-xev10xjPbGCcZSpie1BMQhQ@mail.gmail.com>
        (Maximiliano Estudies's message of "Mon, 25 Apr 2022 17:08:08 +0200")
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Maximiliano Estudies <maxiestudies@gmail.com> writes:

> Hi,
> I'm trying to use a set as a snat target and failing. This is my config:
>
> table ip nat { # handle 73
> set dc-cidr-nat { # handle 3
> type ipv4_addr
> flags interval
> elements = { <internal-network> }
> }
>
> set external-ip-net { # handle 4
> type ipv4_addr
> elements = { <public-ip> }
> }
>
> chain POSTROUTING { # handle 1
> type nat hook postrouting priority srcnat; policy accept;
> ip saddr @dc-cidr-nat oif "enp1s0f0" snat to @external-ip-net comment
> "internet gateway" # handle 7
> }
>
> This fails wtth "Error: syntax error, unexpected string, expecting ll
> or nh or th". Using an anonymous set doesn't work either, but hard
> coding the <external-ip> does. I can't find any hint in the wiki if
> sets are allowed in this context.

Set can have 0 elements or more than 1. What your poor computer should
do in these cases? where it should snat to?

IMO you shoould use kind of map:
table ip nat {

        map dhcp_snat {
                type iface_index : ipv4_addr
        }

        set dhcp_ifaces {
                type iface_index
        }

       
        chain POSTROUTING {
                type nat hook postrouting priority srcnat; policy accept;
                oif @dhcp_ifaces rt ipsec missing snat to oif map @dhcp_snat
        }

}

here, when dhcp script put
  { "wlan0" } into dhcp_ifaces
  and
   { "wlan0" : 192.168.1.1 } into dhcp_snat
traffic outgoing via wlan0 will be snat-ed to 192.168.1.1
KJ


-- 
http://wolnelektury.pl/wesprzyj/teraz/
