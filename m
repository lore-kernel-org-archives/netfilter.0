From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Why can't we use DNAT in the INPUT Chain?
Date: Sun, 20 Aug 2017 12:15:15 +1000
Message-ID: <20170820021515.GA3396@dimstar.local.net>
References: <5c984fa5-a2a5-340d-7cb6-6b21c3768e45@gmail.com>
 <20170819132827.GY2027@harrier.slackbuilds.org>
 <6ae93686-46d2-416e-b736-ca6e7fa45231@gmail.com>
 <8980c2d3-8a82-651f-2553-8e15fbebfec8@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8980c2d3-8a82-651f-2553-8e15fbebfec8@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Sat, Aug 19, 2017 at 07:07:41PM +0200, Pascal Hambourg wrote:
> Le 19/08/2017 =E0 16:16, khawar shehzad a =E9crit :
[SNIP]
> > My solution is like the following, which is not working.
> >
> > table ip6 natcap {
> >          map natcap_vmap {
> >                  type ipv6_addr . ipv6_addr : verdict
> >                  elements =3D { 2001::20 . 2001::1:0:0:2 : accept}
> >          }
> >          chain prerouting_filter {
> >                  type filter hook prerouting priority -101; policy drop;
> >                  ip6 saddr . ip6 daddr vmap @natcap_vmap
> >          }
> (...)
>
> What is this syntax ? This is not iptables.
It's nftables, the reason I joined this list (to get my head around nftable=
s ;)

Cheers ... Duncan.
