From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: nft named set address types
Date: Mon, 15 Nov 2021 20:55:19 -0600
Message-ID: <CAOLfK3XahvuNNJbB2Ji-SwsiQT5vrJy8O_adidy+qPbMh5p3DA@mail.gmail.com>
References: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
 <CAOLfK3XW28kgrBGpQvi9eO3h2oQD80kU6tqz0obgSfvkgbF5-A@mail.gmail.com>
 <YYGeTgBAZfM76k4h@salvia> <CAOLfK3XJHhm5z6b1MOaMFjK2P2V9jyPgOtSOFZUswPSxuEZLEA@mail.gmail.com>
 <YZK5OsnQjzhbBOD3@salvia> <YZMVgt18aNFWZqqI@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4HtVzl6JyTz9vCC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fxq+ILR1GwjJiTOAxFBWAK6uaya9ZVohKkRzgDX2fHM=;
        b=UnkHpjnpd6QM9Y1tBmHmjdDbwE+A0bcQfcEFmcgFP8z7Jv6qEQX4entnAR9Uvd8n+R
         xwMMLuYm9R7zXfr1C1Uc3NU9I2DGMXyWgCKSh88u3jjPMvKCHRzaqWzZDGX6A7Q6tvE4
         2JWq5A5dWZ7lTn2jmywKTUIyRvT261bo1r+k7cUgEduGEi3mSJymOaOW3U+n86epzxVY
         VAw2WJLNArR4ugkOjrSe5uMqCREnfCGxWMZTMunbE1VkQsPJCUStLC4M0lGYFk7TANJI
         G7NEJI6iKyRvRYbdtGUbespTNJ/mQ/9ltEThNdi9ktp2fPcV7z6KbNC2F9VAwBL7xxGd
         7Xxw==
In-Reply-To: <YZMVgt18aNFWZqqI@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter <netfilter@vger.kernel.org>

Hey Pablo and others...

On Mon, Nov 15, 2021 at 8:22 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Mon, Nov 15, 2021 at 08:47:10PM +0100, Pablo Neira Ayuso wrote:
> > On Mon, Nov 15, 2021 at 11:40:43AM -0600, Matt Zagrabelny wrote:
> [...]
> > > Is there no vmap for icmp?
> >
> > instead of:
> >
> >          meta protocol {icmp, icmpv6} vmap {
> >              icmp: jump icmp_ipv4,
> >              icmpv6: jump icmp_ipv6,
> >          }
> >
> > this should be:
> >
> >          meta protocol vmap {
> >              icmp: jump icmp_ipv4,
> >              icmpv6: jump icmp_ipv6,
> >          }
>
> Wrong selector actually:


Ha. Yup. I'm just discovering this as you sent your email. I was going
to reply with a few questions. So your reply was well timed.


> # nft describe meta protocol
> meta expression, datatype ether_type (Ethernet protocol) (basetype integer), 16 bits
>
> pre-defined symbolic constants (in hexadecimal):
>         ip                              0x0800
>         arp                             0x0806
>         ip6                             0x86dd
>         8021q                           0x8100
>         8021ad                          0x88a8
>         vlan                            0x8100
>
> you should used meta l4proto instead
>
> # nft describe meta l4proto
> meta expression, datatype inet_proto (Internet protocol) (basetype integer), 8 bits
>         ip                              0
>         icmp                            1
>         igmp                            2
>         ggp                             3
>         ipencap                         4
>         st                              5
>         tcp                             6
>         ...
>
> Therefore:
>
>           meta l4proto vmap {
>               icmp: jump icmp_ipv4,
>               icmpv6: jump icmp_ipv6,
>           }

Agreed. This is working better than the previous vmap.

I search for "nftables icmp" on the interwebs and found these rules:

        meta nfproto ipv4 icmp type { echo-request } counter accept
        meta nfproto ipv6 icmpv6 type echo-request counter accept

Not sure how they compare to the above "meta l4proto..." commands.


> Careful with this idiom, because it might not do what you want.

Alright... Currently it looks like it is doing what I want.

>
> If you do not previously classify traffic at layer 3,

How do you classify traffic at layer 3? Is that a manual configuration?

then depending
> on your ruleset, this might allow for packet crafting such as
> IPv4/ICMPv6 and IPv6/ICMPv4.

Hmmm... Are there any (potential) security problems with cross
version/protocol packets?

Thanks for the help and the words of caution.

Cheers,

-m
