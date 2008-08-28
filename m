From: Eric Leblond <eric@inl.fr>
Subject: Re: Logging nat translations
Date: Thu, 28 Aug 2008 19:17:40 +0200
Message-ID: <20080828171740.GB19634@khasse.inl.fr>
References: <48B6B1CC.5010408@cmet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48B6B1CC.5010408@cmet.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Carlos =?iso-8859-1?Q?S=FClz?= <csulz@cmet.net>
Cc: netfilter@vger.kernel.org

Hello,

On Thursday, 2008 August 28 at 10:10:20 -0400, Carlos S=FClz wrote:
> Hi NF people, I've a question related a Logging issue.-
>
> I'm already making a log with my conntrack session, but I need to log=
 =20
> the "nated-IP" because auditoring.-
>
> I mean...
> the "-j LOG" parameter log the SRC-IP and the DST-IP (src is the IP =20
> before nat and the dst is... well, U know it.)
> I need something like SRC=3D 10.x.x.x, NAT=3D200.x.x.x , DST=3D201.x.=
x.x
> If there is a way to get this, please let me know.

Have a look at ulogd2 which is able to log every connection tracking
event in a file or in a database.

Some links:
	http://netfilter.org/projects/ulogd/index.html
	http://software.inl.fr/trac/wiki/ulogd2/user

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/
