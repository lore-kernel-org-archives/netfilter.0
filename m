From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: final packet not natted, rfc1918 address sent to internet
Date: Wed, 24 Nov 2010 11:24:44 +0100
Message-ID: <4CECE7EC.7050703@plouf.fr.eu.org>
References: <B7A55E8C969B974FBC89274E565B8B2D02012CCA83@US-COL-EXCHMBX1.green.sophos> <alpine.DEB.2.00.1011240938190.27970@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1011240938190.27970@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Sparks <Dave.Sparks@Sophos.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Jozsef Kadlecsik a =E9crit :
> On Wed, 24 Nov 2010, Dave Sparks wrote:
>=20
>> I noticed a problem that happens on all our firewalls (various 2.6 a=
nd=20
>> Shorewall version) where sometimes the final packet in a conversatio=
n=20
>> will not be natted.  What happens is the src IP is not rewritten, an=
d=20
>> the rfc1918 src address is sent to the internet.
[...]
> I guess the packet in question has got INVALID state: those are not=20
> NAT-ed (being INVALID, cannot be). So add a rule which drops INVALID=20
> packets.

I agree. In a NAT setup, packets with the INVALID state should be
dropped because NAT relies on connection tracking.

The trace shows that the last packet is a FIN segment retransmitted
multiple times because it was not ACK'ed by the other side. It should
not be the last packet of the connection, the other side should send an
ACK segment. I guess that after a 60-second delay the connection
tracking entry expired and this is why the FIN packet got the INVALID
state. The root cause is the missing ACK.
