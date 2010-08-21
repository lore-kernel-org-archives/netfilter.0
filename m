From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridges
Date: Sat, 21 Aug 2010 14:48:10 +0200
Message-ID: <4C6FCB0A.9030402@plouf.fr.eu.org>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk> <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <alpine.LSU.2.01.1008201038140.16356@obet.zrqbmnf.qr> <4C6E4550.1020808@plouf.fr.eu.org> <alpine.LSU.2.01.1008201107550.18181@obet.zrqbmnf.qr> <4C6E583D.7070706@plouf.fr.eu.org>
  <4C6EA72E.9050501@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6EA72E.9050501@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor a =E9crit :
> On 08/20/10 05:26, Pascal Hambourg wrote:
>> Hasn't anybody ever created a bridge with only one interface just in=
=20
>> order to be able to use ebtables on this interface ?
>=20
> I'd be very surprised if someone somewhere has not done that.
>=20
> I would think that it would be a very special use case scenario where=
=20
> you needed to do something in EBTables that couldn't be done in IPTab=
les=20
> / ARPTables.

Ethernet does not carry only IP and ARP. There are other protocols in
use out there. One may want to do MAC-based filtering and mangling on
normal ethernet interfaces.
IMO restricting ebtables to bridges would be like restricting iptables
to routers.
