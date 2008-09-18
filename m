From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Question about conntrack
Date: Thu, 18 Sep 2008 16:05:22 +0200
Message-ID: <48D26022.7060207@netfilter.org>
References: <786c7f0809050531s1a12b40au8c7b2c9387f9b055@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <786c7f0809050531s1a12b40au8c7b2c9387f9b055@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yury Batrakov <batrakov@gmail.com>
Cc: netfilter@vger.kernel.org

Yury Batrakov wrote:
> Hello all!
> 
> I've got a couple of questiona about netfilter's connection tracker,
> could someone clarify it to me?
> 1. When conntrack is being flushed? In /proc/net/ip_conntrack I see
> lots of UNREPLIED connections, I reload conntrack kernel module but
> see the table being filled with old entries. The same looks to happen
> after rebooting Linux box.
> 2. Are UNREPLIED connections being wiped when number of connections to
> track equals to conntrack's capacity? Some web resources tell they
> are, but some tell otherwise. I tried to reduce conntrack's capacity
> and saw that these connections aren't wiped and cause conntrack to
> overflow is it bug or feature?

No, when the table gets full the selected conntracks are those that are
!ASSURED.

> 3. I played with NOTRACK target of table raw and discovered that if I
> add a NOTRACK rule that matches with already established connections,
> they stuck in table as unreplied. Most of them disappear when I set
> net.ipv4.netfilter.ip_conntrack_tcp_loose to 0. Is it recommended to
> kill existing unreplied connections in this way?

You may kill the entries using:

# conntrack -D -s IP -p tcp --dport xyz

See conntrack(8) for reference, or the conntrack-tools website.

> Could it be any side
> effect for new or currently established connections that don't match
> NOTRACK?

No, if you really only kill the conntracks that you don't need anymore.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
