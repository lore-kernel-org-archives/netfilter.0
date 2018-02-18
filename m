From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: nftables: How to filter only ipv6 SSH traffic in an inet table?
Date: Sun, 18 Feb 2018 19:52:52 +1100
Message-ID: <20180218085252.GA5058@dimstar.local.net>
References: <20180206172809.f7a238e06cef71d52ec92ae0@bluenox07.de>
 <20180207003251.GA2621@dimstar.local.net>
 <20180207192632.6h2xczcmnpgai4yk@salvia>
 <20180208041415.96bade9856ee027fbab56fd5@bluenox07.de>
 <20180218040051.GA2428@dimstar.local.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180218040051.GA2428@dimstar.local.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Sun, Feb 18, 2018 at 03:00:51PM +1100, Duncan Roe wrote:
> Hi Merlin,
>
> On Thu, Feb 08, 2018 at 04:14:15AM +0100, Merlin B=FCge wrote:
> > On Wed, 7 Feb 2018 20:26:32 +0100
> > Pablo Neira Ayuso <pablo@netfilter.org> wrote:
...
>
> > #!/usr/sbin/nft -f
> > flush ruleset
> >
> > # (existing table omitted)
> >
> > table inet filter \
> > {
> >   chain input \
> >   {
> >      type filter hook input priority 100; policy drop;
> >
> >      # Only for wlan0
> >      iif ne "wlan0" accept
> >
> >      ip6 nexthdr tcp tcp dport ssh counter drop;
> >      meta nfproto ipv6 tcp dport ssh counter accept
> >      counter log prefix "nft6: " level debug
> >    }
> > }
> > list ruleset
>
> *list ruleset* above produced the following:
>
> > table inet filter {
> >	 chain input {
> >		 type filter hook input priority 100; policy drop;
> >		 iif !=3D "wlan0" accept
> >		 meta nfproto ipv6 ip6 nexthdr tcp tcp dport ssh counter packets 0 byt=
es 0 accept
> >		 meta nfproto ipv6 meta l4proto tcp tcp dport ssh counter packets 0 by=
tes 0 accept
> >		 counter packets 0 bytes 0 log prefix "nft6: " level debug
> >	 }
> > }
>
> while stand-alone *nft list ruleset* shows:
>
> > table inet filter {
> >	 chain input {
> >		 type filter hook input priority 100; policy drop;
> >		 iif !=3D "wlan0" accept
> >		 tcp dport ssh counter packets 0 bytes 0 accept
> >		 tcp dport ssh counter packets 0 bytes 0 accept
> >		 counter packets 0 bytes 0 log prefix "nft6: " level debug
> >	 }
> > }
>
I just re-tried this with the latest git snapshot (latest change 2018-02-15=
),
and the output from stand-alone *nft list ruleset* has changed to:

> table inet filter {
>         chain input {
>                 type filter hook input priority 100; policy drop;
>                 iif !=3D "wlan0" accept
>                 ip6 nexthdr tcp tcp dport ssh counter packets 0 bytes 0 a=
ccept
>                 meta nfproto ipv6 tcp dport ssh counter packets 0 bytes 0=
 accept
>                 meta l4proto ipv6-icmp counter packets 1 bytes 72 accept
>                 counter packets 1 bytes 84 log prefix "nft6: " level debug
>         }
> }

i.e. exactly as per the original script (whitespace and counter values exce=
pted)

Cheers ... Duncan.
