From: =?ISO-8859-15?Q?Martin_Gr=F6ger?= <mgroeger1@web.de>
Subject: Re: nftables: bridge filter with queue to userspace
Date: Sat, 31 Oct 2015 10:02:09 +0100
Message-ID: <56348391.8060500@web.de>
References: <56328E60.4040002@web.de> <20151029221138.GA3447@salvia> <20151029222303.GF18062@breakpoint.cc> <56331945.1080804@web.de> <20151030133812.GB3461@breakpoint.cc> <5633D164.2010400@web.de> <20151030212703.GC3461@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20151030212703.GC3461@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org, bernhard.thaler@wvnet.at

Am 30.10.2015 22:27, schrieb Florian Westphal:
> Martin Gr=F6ger <mgroeger1@web.de> wrote:
>>> - NFQA_PAYLOAD maintains illusion of disabled/non-existant VLAN hw
>>> offload, i.e. we insert it into NFQA_PAYLOAD between mac and networ=
k
>>> header.
>> Sorry, I don't understand this. The VLAN header is (if exists) after
>> the source MAC. If a paket is bridged, I would expect, that the VLAN
>> header is kept unchanged. I would expect to find the VLAN header
>> exactly there! Is this wrong?
> Yes, there is no VLAN header, its removed (usually by hardware offloa=
ds)
> and stored in meta data only.
>
> Thats why I think we should transparently re-insert when sending
> the copy to userspace.
>
> (I.e. undo what hardware offloads did).

Ok, now I understand.

So there are basically 2 options:
1.) reinsert the VLAN header
     pro: looks like the wire
     con: Is the insert measurable in terms of performance?
2.) pass der VLAN header also as meta data to the user.
     pro: network header is always on the same offset, so it might be=20
easier for higher layer inspection
     con: not like the wire

So, although I would have expected option 1, I think option 2 has=20
advantages too. So I think both shoud be ok.
>
>>> - NFQA_HWADDR attribute is not present (redundant, we have this in
>>>    NFQA_PAYLOAD).
>>>>> I still have the q&d hack that makes it work but no reroute (re-b=
ridge,
>>>>> cough) support, just dump-to-userspace.
>>>> As far as I understand this would be sufficient for my usecase,
>>>> since I want simply to inspect the packets and then decide to acce=
pt
>>>> or drop them.
>>> Yes, in fact I think we should just ignore reroute (bad idea) or re=
bridge
>>> (what would be the use case of this...?)
>>>
>>> If someone really needs to be able to resend/relay packet they coul=
d do
>>> this in userspace or just use PRE_ROUTING since thats before bridge
>>> asks the FDB for the output port.
>>>
>>> We could add bridge_me_harder to pick another output device for que=
ueing
>>> in BRIDGE OUTPUT but I have no idea why one would want such feature=
=2E
>>>
>> I'm currently trying to understand the structure.
>> So to add the missing parts:
>> - there is no change in the nftable kernel modules necessary?
> Not to nftables but to nfnetlink_queue module (and to bridge netfilte=
r
> kernel part).
 From the presentation Nftables-osd-2013-developer.pdf I understood,=20
that there is a generic instruction set part of the kernel. New=20
functionality will be added by new combination of this instruction set.=
=20
Additionally there must be some code for each hook, but I would expext,=
=20
that this code provides the packet and some metadata to the engine,=20
which process the instructions. Also for the interface from the main=20
engine to the nfnetlink_queue module I would expect the packet and a=20
metadata structure. Since the queueing for the IP hook works, I expecte=
d=20
that all generic instructions for this purpose are available and just=20
have to be used for the bridge hook.

So obviously somehow my expectation is wrong - but what's wrong?

>
>> - there are changes in the nftnl library necessary?
> No, unless we add extra attribute e.g. for vlan header but I'd like
>   avoid it.
Ok, is this again an argument for Option 1 above?
Is this, because there is currently in the generic instructions no=20
option to add VLAN metadata somehow to the nfnetlink_queue?
>
>> - there are changes in nft necessary?
> No, nft side should already work just fine.
>
>> Only Pablo_nftables-osd-userday-2013.pdf and
>> Nftables-osd-2013-developer.pdf.
>> Is there somethimg more to read to get an better understanding of nf=
tables?
> Sorry, not that I know of.  Perhaps Patrick or Pablo have more
> information available somewhere.
>

