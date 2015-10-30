From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables: bridge filter with queue to userspace
Date: Fri, 30 Oct 2015 22:27:03 +0100
Message-ID: <20151030212703.GC3461@breakpoint.cc>
References: <56328E60.4040002@web.de>
 <20151029221138.GA3447@salvia>
 <20151029222303.GF18062@breakpoint.cc>
 <56331945.1080804@web.de>
 <20151030133812.GB3461@breakpoint.cc>
 <5633D164.2010400@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5633D164.2010400@web.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Martin =?iso-8859-15?Q?Gr=F6ger?= <mgroeger1@web.de>
Cc: Florian Westphal <fw@strlen.de>, Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org, bernhard.thaler@wvnet.at

Martin Gr=F6ger <mgroeger1@web.de> wrote:
> >- NFQA_PAYLOAD maintains illusion of disabled/non-existant VLAN hw
> >offload, i.e. we insert it into NFQA_PAYLOAD between mac and network
> >header.
> Sorry, I don't understand this. The VLAN header is (if exists) after
> the source MAC. If a paket is bridged, I would expect, that the VLAN
> header is kept unchanged. I would expect to find the VLAN header
> exactly there! Is this wrong?

Yes, there is no VLAN header, its removed (usually by hardware offloads=
)
and stored in meta data only.

Thats why I think we should transparently re-insert when sending
the copy to userspace.

(I.e. undo what hardware offloads did).

> >- NFQA_HWADDR attribute is not present (redundant, we have this in
> >   NFQA_PAYLOAD).
> >>>I still have the q&d hack that makes it work but no reroute (re-br=
idge,
> >>>cough) support, just dump-to-userspace.
> >>As far as I understand this would be sufficient for my usecase,
> >>since I want simply to inspect the packets and then decide to accep=
t
> >>or drop them.
> >Yes, in fact I think we should just ignore reroute (bad idea) or reb=
ridge
> >(what would be the use case of this...?)
> >
> >If someone really needs to be able to resend/relay packet they could=
 do
> >this in userspace or just use PRE_ROUTING since thats before bridge
> >asks the FDB for the output port.
> >
> >We could add bridge_me_harder to pick another output device for queu=
eing
> >in BRIDGE OUTPUT but I have no idea why one would want such feature.
> >
> I'm currently trying to understand the structure.
> So to add the missing parts:
> - there is no change in the nftable kernel modules necessary?

Not to nftables but to nfnetlink_queue module (and to bridge netfilter
kernel part).

> - there are changes in the nftnl library necessary?

No, unless we add extra attribute e.g. for vlan header but I'd like
to avoid it.

> - there are changes in nft necessary?

No, nft side should already work just fine.

> Only Pablo_nftables-osd-userday-2013.pdf and
> Nftables-osd-2013-developer.pdf.
> Is there somethimg more to read to get an better understanding of nft=
ables?

Sorry, not that I know of.  Perhaps Patrick or Pablo have more
information available somewhere.
