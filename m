From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT Port Forward problem in a not so simple network
Date: Thu, 17 Apr 2008 16:49:33 +0200
Message-ID: <4807637D.2070704@plouf.fr.eu.org>
References: <480479E8.3040904@naxe.it> <48049C5D.8040104@bofhland.org> <4804C356.3040405@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4804C356.3040405@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello,

Grant Taylor a =E9crit :
> On 04/15/08 07:15, whiplash wrote:
>=20
>> Of course. A possible solution is to SNAT packets exiting from=20
>> 192.168.0.11 with destination 192.168.0.2.
>=20
> *nod*
>=20
> However, SNATing will have the possibly undesirable side effect of=20
> making the traffic appear to be from the machine that is doing the SN=
ATing.

It does not matter so much as, according to the packet trace, Cisco1=20
appears to SNAT incoming connections forwarded to HPpro1 anyway. So all=
=20
you get in the logs is HPpro1's address instead of Cisco1's...
