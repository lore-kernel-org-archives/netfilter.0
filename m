From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables: bridge filter with queue to userspace
Date: Fri, 30 Oct 2015 14:38:13 +0100
Message-ID: <20151030133812.GB3461@breakpoint.cc>
References: <56328E60.4040002@web.de>
 <20151029221138.GA3447@salvia>
 <20151029222303.GF18062@breakpoint.cc>
 <56331945.1080804@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56331945.1080804@web.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Martin =?iso-8859-15?Q?Gr=F6ger?= <mgroeger1@web.de>
Cc: Florian Westphal <fw@strlen.de>, Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org, bernhard.thaler@wvnet.at

Martin Gr=F6ger <mgroeger1@web.de> wrote:
> >>Florian told me he will come up sooner or later with native queue
> >>support for nft (ie. no bridge_netfilter required anymore).
> >Argh.  I'm a moron and forgot about this.
> How does a native (indepent on bridge) queue support should work ?

Highlevel?
nft add bridge filter forward queue

But on the backend/userspace side its a good question.

=46or instance, where should NFQA_PAYLOAD point to?

Start of ethernet header?
Start of network header?

If the former, what should NFQA_HWADDR contain?
Should it even be present?

What about ->hw_protocol in nfqnl_msg_packet_hdr ?

We also should definitely present VLAN headers to userspace
in some way.  Standard question is if that should be extra attribute
or if we should inject the vlan header into the packet data.

I'm leaning towards:
- NFQA_PAYLOAD starts at beginning of ethernet header
- nfqnl_msg_packet_hdr->hw_protocol is set to skb->protocol OR
  skb->vlan_proto in offload case (even though this information is
  redundant since its also present in the ethernet header ...)
- NFQA_PAYLOAD maintains illusion of disabled/non-existant VLAN hw
offload, i.e. we insert it into NFQA_PAYLOAD between mac and network
header.
- NFQA_HWADDR attribute is not present (redundant, we have this in
  NFQA_PAYLOAD).

> >I still have the q&d hack that makes it work but no reroute (re-brid=
ge,
> >cough) support, just dump-to-userspace.
> As far as I understand this would be sufficient for my usecase,
> since I want simply to inspect the packets and then decide to accept
> or drop them.

Yes, in fact I think we should just ignore reroute (bad idea) or rebrid=
ge
(what would be the use case of this...?)

If someone really needs to be able to resend/relay packet they could do
this in userspace or just use PRE_ROUTING since thats before bridge
asks the FDB for the output port.

We could add bridge_me_harder to pick another output device for queuein=
g
in BRIDGE OUTPUT but I have no idea why one would want such feature.
