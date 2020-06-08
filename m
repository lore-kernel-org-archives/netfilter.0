From: Max Ehrlich <max.ehr@gmail.com>
Subject: Re: Simplifying DNAT Rules using Maps
Date: Mon, 8 Jun 2020 10:13:42 -0400
Message-ID: <CAPyx93wMpdBEA58ixPxYVWEXGSO3mQZv7Ub=iNX87JXnM2c_NQ@mail.gmail.com>
References: <CAPyx93x8RtJA8ghab2W630WwpHZP+K-dA26SWkj7+wstasM5mw@mail.gmail.com>
 <20200607214008.GB24054@salvia> <CAPyx93xmpSRSQFtMC=bqxh5f3_g_jyMXEGaUB-EjMa1m6SN5Gg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GEBsQ/STSJu6hobskJ5c1MfCPPMIv381BTPMrHwvWu8=;
        b=vMkiQ8sDGEKvDj6YTxmhgfpprBaSD5hI9QTFk+sPPpHgvMh+njsjdSgPnPT73Cl7Fn
         ZCYmx16VyNe77oeLrW0XX34Ra5tRqiO+EVPbwmKpp6sNDsvLryKPVaBO75Y+JbIx/RAG
         4HBcAj3mwFc1fijTYZWTF9V2MYTEX9koJTNeI4yJgJjEcUVB3ZIYxWvQu59wYpLzVm3K
         dscl6XnXzKkB2flW1uqTVW6y1zbznJuXESqB0HN0gBZkFtpJTrzaJsBXENZxkyGj118p
         WgxBTNdjwdo4frQez+gOj8l6okmBbOGc5u3KmZwn0mTxA1H5kjvvR14CE8Qv1IHqn6XZ
         7Wiw==
In-Reply-To: <CAPyx93xmpSRSQFtMC=bqxh5f3_g_jyMXEGaUB-EjMa1m6SN5Gg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Just to put some more context, I was able to do this using a map and a
set as follows:

```
define dnat_targets = {
80 : 10.0.10.1 . 8080,
25565 : 10.0.10.8 . 25565
}

define dnat_allowed = {
10.0.10.1 . 8080,
10.0.10.8 . 25565
}

table inet nat {
map dnat_destinations {
type inet_service : ipv4_addr . inet_service
elements = $dnat_targets
}

set dnat_masq {
type ipv4_addr . inet_service
elements = $dnat_allowed
}

chain prerouting {
ip daddr != 10.0.0.0/8 fib daddr type local dnat ip addr . port to tcp
dport map @dnat_destinations
}

chain postrouting {
ip saddr 10.0.0.0/8 ip daddr . tcp dport @dnat_masq masquerade
}
}

table inet filter {
set dnat_allowed {
type ipv4_addr . inet_service
elements = $dnat_allowed
}

chain forward {
ip daddr . tcp dport @dnat_allowed accept
}
}
```

however note that values of the map `dnat_targets` is the same as the
set `dnat_allowed`, I wonder if there is a way to do this with only
the map `dnat_targets`? Something like using only the values of the
map as a set?

On Mon, Jun 8, 2020 at 9:42 AM Max Ehrlich <max.ehr@gmail.com> wrote:
>
> Thanks a lot Pablo this is working great for the dnat rule:
>
> ```
> ip daddr != 10.0.0.0/8 fib daddr type local dnat ip addr . port to tcp
> dport map @dnat_destinations
> ```
>
> Do you know how I can use that map to write the masquerade rule as
> well? And I'm assuming I'll need another rule for the filter table
> rule since  I can't reference a map in another table correct?
>
> On Sun, Jun 7, 2020 at 5:40 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> >
> > On Wed, Jun 03, 2020 at 12:08:50PM -0400, Max Ehrlich wrote:
> > > Hi,
> > >
> > > I'm switching from iptables to nftables, specifically from a high
> > > level translator (awall) to using nftables directly since the
> > > scripting environment is so expressive.
> > >
> > > I have quite a few ipv4 DNAT rules that I need to translate, and they
> > > all have a similar form like the following for a web service:
> > >
> > > table ip nat {
> > >   chain prerouting {
> > >     ip daddr != 10.0.0.0/8 fib daddr type local tcp dport http dnat
> > > 10.1.1.112:8080
> > >   }
> > >
> > >   chain postrouting {
> > >     ip saddr 10.0.0.0/8 ip daddr 10.1.1.112 tcp dport 8080 masquerade
> > >   }
> > > }
> > >
> > > table ip filter {
> > >   chain forward {
> > >     ip daddr 10.1.1.112 tcp dport 8080 accept
> > >   }
> > > }
> > >
> > > I want to simplify this using a map so that I can add services to the
> > > map instead of having to copy all three rules every time. Something
> > > like this
> > >
> > > table ip nat {
> > >   map dnat_services {
> > >     type inet_service: ipv4_addr . inet_service
> > >     elements = {
> > >       http: 10.1.1.112 . 8080
> > >     }
> > >   }
> > >
> > >   chain prerouting {
> > >     ip daddr != 10.0.0.0/8 fib daddr type local dnat tcp dport map
> > > @dnat_services
> > >   }
> > > ...
> > >
> > > would be great but it seems like the dnat target doesnt accept
> > > concatenations. I get that this can be done with two maps but it makes
> > > it quite ugly to write although there are performance benefits. Also I
> > > have no idea what to do about the filter and masquerade rules. For
> > > example
> > >
> > > chain postrouting {
> > >   ip saddr 10.0.0.0/8 ip daddr tcp dport map @dnat_services masquerade
> > > }
> > >
> > > doesn't parse (my assumption was this would have been that the ip
> > > daddr would be the result of looking up the tcp dport in the given
> > > map, it matches the dnat syntax)
> > >
> > > So is there a cleaner way to write these rules using maps?
> >
> > This is supported since nftables >= 0.9.4
> >
> > # cat ruleset.nft
> > table ip nat {
> >         map destinations {
> >                 type ipv4_addr . inet_service : ipv4_addr . inet_service
> >         }
> >
> >         chain f {
> >                 type nat hook postrouting priority srcnat; policy accept;
> >                 snat ip addr . port to ip daddr . tcp dport map @destinations
> >         }
> > }
> > # nft -f ruleset.nft
> >
> > Then, you can add elements to the `destinations' map that contains the
> > mapping.
> >
> > nft add element ip nat destinations { 1.1.1.1 . 80 : 2.2.2.2 . 443 }
