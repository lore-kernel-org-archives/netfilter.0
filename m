From: Florian Westphal <fw@strlen.de>
Subject: Re: Nftables 2 WAN
Date: Sun, 16 Aug 2020 23:54:01 +0200
Message-ID: <20200816215401.GK1660@breakpoint.cc>
References: <6bd2a7b2-4244-3695-4b62-64957bfd71c5@tootai.net>
 <f271e8e7-12c1-480f-0a06-3db5ebc5875a@tootai.net>
 <20200816184041.GA1545@salvia>
 <edd8f4fd-0509-572d-0622-c4246246ae53@tootai.net>
 <20200816212759.GJ1660@breakpoint.cc>
 <044c6480-b7d0-a60a-211c-ff80e5affe98@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <044c6480-b7d0-a60a-211c-ff80e5affe98@tootai.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Daniel <tech@tootai.net>
Cc: Netfilter list <netfilter@vger.kernel.org>

Daniel <tech@tootai.net> wrote:
>=20
> Le 16/08/2020 =E0 23:27, Florian Westphal a =E9crit=A0:
> > Daniel <tech@tootai.net> wrote:
> > > Le 16/08/2020 =E0 20:40, Pablo Neira Ayuso a =E9crit=A0:
> > > > On Fri, Aug 14, 2020 at 11:26:31PM +0200, Daniel wrote:
> > > > [...]
> > > > > UPDATE: I discover that the traffic I see on interface gretunnel =
is only the
> > > > > local generated one which is going out with the eth0 ipv6 address=
. I modify
> > > > > mangle table which now looks like
> > > > >=20
> > > > > # nft table mangle ip6
> > > > > #
> > > > > $fwtables delete table ip6 mangle 2>/dev/null || true
> > > > > $fwtables add table ip6 mangle 2>/dev/null || true
> > > > > $fwtables add chain ip6 mangle output "{ type nat hook output pri=
ority -199
> > > > > ; policy accept ; }"
> > > > Why chain type 'nat' ? Probably you meant to specify here 'mangle'.
> > > > NAT chains only see the first packet of flows.
> > > Because mangle is not accepted.
> > :-)
> >=20
> > Its 'route'.  You need this for output in case you want to re-route the
> > packet if e.g. skb->mark has been altered.
> >=20
> > Default 'filter' won't do that.
>=20
> Like this ?
>=20
> $fwtables add chain ip6 mangle output "{ type route hook output priority
> -199 ; policy accept ; }"
>=20
> No changes.

Then you have another problem.  Make sure that
ip route get $daddr and/or ip route get $daddr mark $MARK

give the expected results, then make sure the ip6 output chain that
serves as 'route' logic marks those packets correctly.
