From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft named set address types
Date: Tue, 16 Nov 2021 09:35:25 +0100
Message-ID: <YZNtTRijDHe41jNl@salvia>
References: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
 <CAOLfK3XW28kgrBGpQvi9eO3h2oQD80kU6tqz0obgSfvkgbF5-A@mail.gmail.com>
 <YYGeTgBAZfM76k4h@salvia>
 <CAOLfK3XJHhm5z6b1MOaMFjK2P2V9jyPgOtSOFZUswPSxuEZLEA@mail.gmail.com>
 <YZK5OsnQjzhbBOD3@salvia>
 <YZMVgt18aNFWZqqI@salvia>
 <CAOLfK3XahvuNNJbB2Ji-SwsiQT5vrJy8O_adidy+qPbMh5p3DA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOLfK3XahvuNNJbB2Ji-SwsiQT5vrJy8O_adidy+qPbMh5p3DA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter <netfilter@vger.kernel.org>

On Mon, Nov 15, 2021 at 08:55:19PM -0600, Matt Zagrabelny wrote:
> Hey Pablo and others...
> 
> On Mon, Nov 15, 2021 at 8:22 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> >
> > On Mon, Nov 15, 2021 at 08:47:10PM +0100, Pablo Neira Ayuso wrote:
> > > On Mon, Nov 15, 2021 at 11:40:43AM -0600, Matt Zagrabelny wrote:
> > [...]
> > > > Is there no vmap for icmp?
> > >
> > > instead of:
> > >
> > >          meta protocol {icmp, icmpv6} vmap {
> > >              icmp: jump icmp_ipv4,
> > >              icmpv6: jump icmp_ipv6,
> > >          }
> > >
> > > this should be:
> > >
> > >          meta protocol vmap {
> > >              icmp: jump icmp_ipv4,
> > >              icmpv6: jump icmp_ipv6,
> > >          }
> >
> > Wrong selector actually:
> 
> 
> Ha. Yup. I'm just discovering this as you sent your email. I was going
> to reply with a few questions. So your reply was well timed.
> 
> 
> > # nft describe meta protocol
> > meta expression, datatype ether_type (Ethernet protocol) (basetype integer), 16 bits
> >
> > pre-defined symbolic constants (in hexadecimal):
> >         ip                              0x0800
> >         arp                             0x0806
> >         ip6                             0x86dd
> >         8021q                           0x8100
> >         8021ad                          0x88a8
> >         vlan                            0x8100
> >
> > you should used meta l4proto instead
> >
> > # nft describe meta l4proto
> > meta expression, datatype inet_proto (Internet protocol) (basetype integer), 8 bits
> >         ip                              0
> >         icmp                            1
> >         igmp                            2
> >         ggp                             3
> >         ipencap                         4
> >         st                              5
> >         tcp                             6
> >         ...
> >
> > Therefore:
> >
> >           meta l4proto vmap {
> >               icmp: jump icmp_ipv4,
> >               icmpv6: jump icmp_ipv6,
> >           }
> 
> Agreed. This is working better than the previous vmap.
> 
> I search for "nftables icmp" on the interwebs and found these rules:
> 
>         meta nfproto ipv4 icmp type { echo-request } counter accept
>         meta nfproto ipv6 icmpv6 type echo-request counter accept

The following is just fine:

        icmp type echo-request counter accept
        icmpv6 type echo-request counter accept

but the problem is that you will end up with an IPv4 rule and an IPv6
rule, that's why I suggest you to split the IP-dependent part into
chains, ie.

        meta protocol vmap { ip : jump ipv4_input, ip6 : ipv6_input }

Please, have a look at the nft manpage and wiki.
