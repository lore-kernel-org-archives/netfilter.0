From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Logging nat translations
Date: Fri, 29 Aug 2008 12:50:29 +0200
Message-ID: <48B7D475.4010100@netfilter.org>
References: <48B6B1CC.5010408@cmet.net> <20080828171740.GB19634@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080828171740.GB19634@khasse.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Carlos_S=FClz?= <csulz@cmet.net>
Cc: Eric Leblond <eric@inl.fr>, netfilter@vger.kernel.org

Eric Leblond wrote:
> Hello,
>=20
> On Thursday, 2008 August 28 at 10:10:20 -0400, Carlos S=FClz wrote:
>> Hi NF people, I've a question related a Logging issue.-
>>
>> I'm already making a log with my conntrack session, but I need to lo=
g =20
>> the "nated-IP" because auditoring.-
>>
>> I mean...
>> the "-j LOG" parameter log the SRC-IP and the DST-IP (src is the IP =
=20
>> before nat and the dst is... well, U know it.)
>> I need something like SRC=3D 10.x.x.x, NAT=3D200.x.x.x , DST=3D201.x=
=2Ex.x
>> If there is a way to get this, please let me know.
>=20
> Have a look at ulogd2 which is able to log every connection tracking
> event in a file or in a database.
>=20
> Some links:
> 	http://netfilter.org/projects/ulogd/index.html
> 	http://software.inl.fr/trac/wiki/ulogd2/user

You can also get them via the command line tool `conntrack':

# conntrack -E --src-nat

or

# conntrack -E --dst-nat

or even:

# conntrack -E --dst-nat 1.2.3.4

to filter only destination NAT to 1.2.3.4.

--=20
"Los honestos son inadaptados sociales" -- Les Luthiers
