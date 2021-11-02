From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft named set address types
Date: Tue, 2 Nov 2021 21:23:42 +0100
Message-ID: <YYGeTgBAZfM76k4h@salvia>
References: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
 <CAOLfK3XW28kgrBGpQvi9eO3h2oQD80kU6tqz0obgSfvkgbF5-A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOLfK3XW28kgrBGpQvi9eO3h2oQD80kU6tqz0obgSfvkgbF5-A@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter <netfilter@vger.kernel.org>

On Tue, Nov 02, 2021 at 02:39:33PM -0500, Matt Zagrabelny wrote:
> Replying to myself...
> 
> On Mon, Nov 1, 2021 at 3:46 PM Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
> >
> > Hello,
> >
> > I'd like to use the "inet" address family in a named set. I see nft
> > supports the following address families [AF] (among others):
> >
> >        ip       IPv4 address family.
> >
> >        ip6      IPv6 address family.
> >
> >        inet     Internet (IPv4/IPv6) address
> >                 family.
> 
> 
> I'm not sure nftables even would allow an "inet" to be used in a rule such as:
> 
> table inet filter {
>     chain input {
>         inet saddr { 127.0.0.1, ::1 } tcp dport 22 accept
>     }
> }
> 
> Instead, it seems I must do:
> 
> table inet filter {
>     chain input {

there is no chain definition here, this chain sees no traffic.

          type filter hook input priority filter; policy drop;

is missing.

>         ip saddr 127.0.0.1 tcp dport 22 accept
>         ip6 saddr ::1 tcp dport 22 accept

Better split your ruleset in a tree using verdict maps:

table inet filter {
    chain input_ip4 {
        ip saddr 127.0.0.1 accept
    }

    chain input_ip6 {
        ip6 saddr ::1 accept
    }

    chain input {
        type filter hook input priority filter; policy drop;
        ct state vmap { established : accept, related : accept, invalid : drop }
        # implicit match on 'ct state new,untracked'
        tcp dport 22 meta protocol vmap { ip : jump input_ip4, ip6 : jump input_ip6 }
    }
}
