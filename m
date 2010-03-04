From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: miscellaneous netfilter questions
Date: Fri, 05 Mar 2010 00:36:00 +0100
Message-ID: <4B9043E0.90608@plouf.fr.eu.org>
References: <20100303165419.87692fvlklxfna68@webmail.physik.uni-muenchen.de>	 <4B8E94F7.4080908@plouf.fr.eu.org> <1267697943.22478.17.camel@etppc09.garching.physik.uni-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1267697943.22478.17.camel@etppc09.garching.physik.uni-muenchen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Christoph Anton Mitterer a =E9crit :
>=20
>> For IPv4, indeed when conntrack is enabled incoming fragmented datag=
rams
>> are reassembled before the PREROUTING chains. Note that packets whic=
h
>> are to be delivered locally are reassembled by the stack (not by
>> conntrack) before the INPUT chains anyway, so you never see fragment=
s in
>> INPUT chains.
> ok... well...
> a) What about packages not delivered locally? I assume they're simply
> passed on in the fragmented state as they are? Is this always the cas=
e?

Yes, unless conntrack is enabled.

> E.g. if the next hop network as an MTU that is smaller than the fragm=
ent
> size?

Some time ago I had observed on 2.4 kernels that packets which are too
big with DF=3D0 are fragmented to fit the MTU after the FORWARD chain.
However if nat is enabled, datagrams are reassembled again in
nat/POSTROUTING and fragmented again afterwards. I did not check whethe=
r
it is the same on 2.6 kernels or it was optimized in order to reassembl=
e
and fragment only once at most.

> b) All these things which you say that are happening on the stack (e.=
g.
> the defragmentation here, dropping of packets with bogus addresses or
> source addresses that match the address of a local interface)... thes=
e
> things generally happen _before_ netfilter, right? Or at which place =
are
> they happening?

They happen at different stages of the packet path, betweek netfilter
hooks. Netfilter and the rest of the stack are interleaved. E.g, the
input routing decision is between PREROUTING and INPUT/FORWARD. Diagram=
s
are available throughout the web.

>> AFAIK things work a bit differently for IPv6 : fragmented datagrams =
are
>> "virtually" reassembled for conntrack (the reason being that an IPv6
>> router does not handle fragmentation/reassembly), but continue to ex=
ist
>> as fragments through the ip6tables chains and the IPv6 stack.
> Ah... I see... uhm... in this case, how would the following work?
> Image one wants to allow incomming packets for ssh so we have about:
> :INPUT DROP
> -A INPUT --protocol tcp -m tcp --destination-port ssh -j ACCEPT
>=20
> Now packets come in fragmented,... this would not work for later
> fragments right, as the port is not known... so as soon as fragmentat=
ion
> happens, the above would not work (as expected).

I guess so. However IPv6 deprecates fragmentation by routers and makes
path MTU discovery mandatory, so fragmentation with TCP should be very
uncommon.

> But it should work with those rules:
> :INPUT DROP
> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A INPUT --protocol tcp -m tcp --destination-port ssh --syn -j ACCEPT
>=20
> ..because contrack still works, and the fragmented packets are accept=
ed
> by the first rule.
>=20
> Do I understand this correctly?

I guess so. However I haven't played much with IPv6 conntrack yet,
although I use IPv6.
