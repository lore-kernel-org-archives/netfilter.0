From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 11:16:27 +0200
Message-ID: <4C6CF66B.70902@plouf.fr.eu.org>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C65CD.6090707@plouf.fr.eu.org> <4C6C660F.9030400@abpni.co.uk> <alpine.LSU.2.01.1008191027530.29534@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1008191027530.29534@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Jonathan Tripathy <jonnyt@abpni.co.uk>, netfilter@vger.kernel.org

Jan Engelhardt a =E9crit :
> On Thursday 2010-08-19 01:00, Jonathan Tripathy wrote:
>>> It depends what "traffic" means. Ethernet frames, no. IP packets, y=
es if
>>> the box also acts as an IP router between the bridges.
>>>  =20
>> Hmm for such to happen, the bridge where the traffic came in on
>> would have to have an IP address, wouldn't it?
>=20
> Routes are independent of assigned addresses.

Routes and addresses are not the only problem. IIRC, older kernels did
not automatically link an interface to the IP stack (it was not present
in /proc/sys/net/ipv4/conf/) until you do something such as assign an I=
P
address to it.

> Though I guess it may=20
> obstruct ICMP "TTL outlived" replies if the router itself has no addr=
ess=20
> to send with.

Obviously, a router needs at least one non-loopback address in order to
operate properly. If such an address is assigned to another interface,
Linux can use it as a source address on the unnumbered interface.
