From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: Both { tcp, udp} in meta vmap
Date: Sat, 20 Nov 2021 20:46:02 -0600
Message-ID: <CAOLfK3W2c9HO0UxTJyKpKue+GFWiBJupousfg4cdorZYGwnMBg@mail.gmail.com>
References: <CAOLfK3XWGpo9OdjQy68DRp2BQ0ttaNsAznO3ed=Xg6Uky4mC0w@mail.gmail.com>
 <YZdoEtSthtB3W+0K@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4HxZXk4pbwz9vBqj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2BR6uewDKgQSlyOwETqc/mvWOIymz7Fd1YgN+S5NvSM=;
        b=cazW6lZK2r3pYwKJr7yASDT9yt9zaQKAXaE+zaDKXFgRjMUHAF3wpo4HpiOjCJofDe
         mrHbpeCIscmvQZXx4kJ/wDuAHnDxVS2X/23AQhcWgREMXhN1bhYT0r2ObvTjMLyYZ/MC
         n/fAAfAhy3YdKtbIYW7WqmXrQQokynLN2pAKBtBddKjj+OmE849smjOpvR+y5ywqx58M
         CxnSzJRyBK7bqE1f7TjqZYh8w+Sepu7Mc2rxAnH2+gfdTaqw9GVrIomJ+/sIf0LcrMs/
         BQ5gHER3EtQIOc/H69r7sHsBI7BqMMWikFJDQcg2zNuLh2rNZwG1r5+cINyy2iBoUxOd
         tFsg==
In-Reply-To: <YZdoEtSthtB3W+0K@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter <netfilter@vger.kernel.org>

Hey Pablo...

On Fri, Nov 19, 2021 at 3:02 AM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Thu, Nov 18, 2021 at 06:44:22PM -0600, Matt Zagrabelny wrote:
> > Greetings,
> >
> > I have the following rules:
> >
> > table inet filter {
> >         chain input {
> >                 type filter hook input priority 0; policy drop;
> >                 ip6 nexthdr ipv6-icmp icmpv6 type { nd-router-advert,
> > nd-neighbor-solicit, nd-neighbor-advert } accept
>
> Replace 'ip6 nexthdr ipv6-icmp icmpv6 type' by 'icmpv6 type' is just fine.
> Please have a look at this, there is a note specifically on matching
> icmpv6 traffic:
>
> https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_headers#Matching_IPv6_headers

Thanks for the tip. I'll submit a bug to the Debian package to get the
documentation updated to reflect the above.

>
> >                 ct state vmap { invalid : drop, established : accept,
> > related : accept }
> >                 tcp dport { 1812, 1813 } meta protocol vmap { ip :
> > jump radius_ipv4, ip6 : jump radius_ipv6 }
> >         }
> >
> >         # contrived chains...
> >         chain radius_ipv4 {
> >                 ip saddr { 127.0.0.0/8, } accept
> >         }
> >
> >         chain radius_ipv6 {
> >                 ip6 saddr { ::1 } accept
> >         }
> > }
> >
> > I'd like to change the "tcp dport { 1812, 1813 }" to "{ tcp, udp }
> > dport { 1812, 1813 }", but I'm getting the error [...]
>
> Use:
>
>         ... meta l4proto { tcp, udp } th dport { 1812, 1813 }

Makes sense. Thanks again for the help!

-m
