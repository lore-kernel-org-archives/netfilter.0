From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridges
Date: Sun, 22 Aug 2010 23:02:43 +0200
Message-ID: <4C719073.7090506@plouf.fr.eu.org>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk> <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <4C6DB5FD.8030607@abpni.co.uk> <4C6E42A6.9080308@plouf.fr.eu.org> <4C704924.3080909@abpni.co.uk> <alpine.LSU.2.01.1008220122410.30882@obet.zrqbmnf.qr> <4C70E853.6050107@abpni.co
  .uk> <alpine.LSU.2.01.1008221108160.26133@obet.zrqbmnf.qr> <4C70E9A2.3040907@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C70E9A2.3040907@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Jonathan Tripathy a =E9crit :
> On 22/08/10 10:09, Jan Engelhardt wrote:
>>
>> And as previously mentioned, routing does not usually care about add=
resses,
>> but routes (`ip r`).
>=20
> I'm sorry I don't really follow. Are you saying that there is no way =
to=20
> disable IP forwarding in a Linux box?

No one said that. As we already explained, IP forwarding can be disable=
d
globally or per interface.

"IP routing" may have different meanings. It can be a synonym for "IP
forwarding", like in "IP routers do IP routing". But in the context of
the Linux IP stack, it rather means the handling of an IP packet
according to the routing table. In short :
- for an incoming packet, determine whether it is for local delivery or
to be forwarded ;
- for an outgoing or forwarded packet, determine the output interface
and gateway.
