From: =?ISO-8859-15?Q?Martin_Gr=F6ger?= <mgroeger1@web.de>
Subject: Re: nftables: bridge filter with queue to userspace
Date: Fri, 30 Oct 2015 21:21:56 +0100
Message-ID: <5633D164.2010400@web.de>
References: <56328E60.4040002@web.de> <20151029221138.GA3447@salvia> <20151029222303.GF18062@breakpoint.cc> <56331945.1080804@web.de> <20151030133812.GB3461@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20151030133812.GB3461@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org, bernhard.thaler@wvnet.at

Am 30.10.2015 14:38, schrieb Florian Westphal:
> Martin Gr=F6ger <mgroeger1@web.de> wrote:
>>>> Florian told me he will come up sooner or later with native queue
>>>> support for nft (ie. no bridge_netfilter required anymore).
>>> Argh.  I'm a moron and forgot about this.
>> How does a native (indepent on bridge) queue support should work ?
> Highlevel?
> nft add bridge filter forward queue
That's exactly what I expected.
> But on the backend/userspace side its a good question.
>
> For instance, where should NFQA_PAYLOAD point to?
>
> Start of ethernet header?
> Start of network header?
However, the full information contained in the paket (incl. VLAN) shoul=
d=20
be given to the user.
So it wouold make sense to point to the ethernet header with NFQA_PAYLO=
AD.
>
> If the former, what should NFQA_HWADDR contain?
> Should it even be present?
>
> What about ->hw_protocol in nfqnl_msg_packet_hdr ?
>
> We also should definitely present VLAN headers to userspace
> in some way.  Standard question is if that should be extra attribute
> or if we should inject the vlan header into the packet data.
>
> I'm leaning towards:
> - NFQA_PAYLOAD starts at beginning of ethernet header
ok
> - nfqnl_msg_packet_hdr->hw_protocol is set to skb->protocol OR
>    skb->vlan_proto in offload case (even though this information is
>    redundant since its also present in the ethernet header ...)
> - NFQA_PAYLOAD maintains illusion of disabled/non-existant VLAN hw
> offload, i.e. we insert it into NFQA_PAYLOAD between mac and network
> header.
Sorry, I don't understand this. The VLAN header is (if exists) after th=
e=20
source MAC. If a paket is bridged, I would expect, that the VLAN header=
=20
is kept unchanged. I would expect to find the VLAN header exactly there=
!=20
Is this wrong?
> - NFQA_HWADDR attribute is not present (redundant, we have this in
>    NFQA_PAYLOAD).
>>> I still have the q&d hack that makes it work but no reroute (re-bri=
dge,
>>> cough) support, just dump-to-userspace.
>> As far as I understand this would be sufficient for my usecase,
>> since I want simply to inspect the packets and then decide to accept
>> or drop them.
> Yes, in fact I think we should just ignore reroute (bad idea) or rebr=
idge
> (what would be the use case of this...?)
>
> If someone really needs to be able to resend/relay packet they could =
do
> this in userspace or just use PRE_ROUTING since thats before bridge
> asks the FDB for the output port.
>
> We could add bridge_me_harder to pick another output device for queue=
ing
> in BRIDGE OUTPUT but I have no idea why one would want such feature.
>
I'm currently trying to understand the structure.
So to add the missing parts:
- there is no change in the nftable kernel modules necessary?
- there are changes in the nftnl library necessary?
- there are changes in nft necessary?
Is this correct?

I didn't find much documentation conecrning the architecture.
Only Pablo_nftables-osd-userday-2013.pdf and=20
Nftables-osd-2013-developer.pdf.
Is there somethimg more to read to get an better understanding of nftab=
les?

Thanks,
Martin






