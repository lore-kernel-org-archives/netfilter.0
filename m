From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Masquerading with selectively open ports -- nftables
Date: Thu, 29 Oct 2015 20:55:18 +0100
Message-ID: <20151029195518.GB1778@salvia>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com>
 <20151028231533.GA2371@salvia>
 <17D2CE38-D4D5-4838-9749-B1FBC907E239@gmail.com>
 <CAOkSjBiQ3uGZW9-mUXqGp8xFbfjwHnGd0T=S_1-Qhm0q+cq-cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOkSjBiQ3uGZW9-mUXqGp8xFbfjwHnGd0T=S_1-Qhm0q+cq-cQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Johannes Ernst <johannes.ernst@gmail.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On Thu, Oct 29, 2015 at 09:11:03AM +0100, Arturo Borrero Gonzalez wrote=
:
> On 29 October 2015 at 05:51, Johannes Ernst <johannes.ernst@gmail.com=
> wrote:
> >> On Oct 28, 2015, at 16:15, Pablo Neira Ayuso <pablo@netfilter.org>=
 wrote:
[...]
> >> Moreover, make sure you also compiled masquerading support for nf_=
tables:
> >>
> >> CONFIG_NFT_MASQ=3Dm
> >
> > Ahh, that might be it. The Arch build script is here [2] and I
> > don=E2=80=99t see anything that looks like CONFIG_NFT_MASQ. I=E2=80=
=99ll recompile
> > tomorrow and see where that leads us.
> >
>=20
> this config option is from the linux kernel, for example:
>=20
> % grep CONFIG_NFT_ /boot/config-4.2.0-1-amd64
> CONFIG_NFT_EXTHDR=3Dm
> CONFIG_NFT_META=3Dm
> CONFIG_NFT_CT=3Dm
> CONFIG_NFT_RBTREE=3Dm
> CONFIG_NFT_HASH=3Dm
> CONFIG_NFT_COUNTER=3Dm
> CONFIG_NFT_LOG=3Dm
> CONFIG_NFT_LIMIT=3Dm
> CONFIG_NFT_MASQ=3Dm
> CONFIG_NFT_REDIR=3Dm
> CONFIG_NFT_NAT=3Dm
> CONFIG_NFT_QUEUE=3Dm
> CONFIG_NFT_REJECT=3Dm
> CONFIG_NFT_REJECT_INET=3Dm
> CONFIG_NFT_COMPAT=3Dm
> CONFIG_NFT_CHAIN_ROUTE_IPV4=3Dm
> CONFIG_NFT_REJECT_IPV4=3Dm
> CONFIG_NFT_CHAIN_NAT_IPV4=3Dm
> CONFIG_NFT_MASQ_IPV4=3Dm
> # CONFIG_NFT_REDIR_IPV4 is not set
> CONFIG_NFT_CHAIN_ROUTE_IPV6=3Dm
> CONFIG_NFT_REJECT_IPV6=3Dm
> CONFIG_NFT_CHAIN_NAT_IPV6=3Dm
> CONFIG_NFT_MASQ_IPV6=3Dm
> # CONFIG_NFT_REDIR_IPV6 is not set
> CONFIG_NFT_BRIDGE_META=3Dm
> CONFIG_NFT_BRIDGE_REJECT=3Dm

It would be good to have a sort of "compiling nf_tables kernel
support" on the wiki, in case anyone finds the time to contribute it.
We can use what Eric Leblond wrote time ago on his quick howto and
update it.

[...]
> In nftables tables has no special semantic apart of storing chains.
> Beware of families however, I doubt the inet family can hold NAT
> stuff.

I confirm this: We have no nat table for inet, only filter.
