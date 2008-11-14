From: Michael <micolous@gmail.com>
Subject: Re: PREROUTING table and quota
Date: Fri, 14 Nov 2008 12:41:31 +1030
Message-ID: <1226628691.3932.5.camel@localhost.localdomain>
References: <1226578553.8310.40.camel@localhost.localdomain>
	 <491C5FCE.9060001@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <491C5FCE.9060001@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

On Thu, 2008-11-13 at 18:11 +0100, Pascal Hambourg wrote:
> Michael a =C3=A9crit :
> > I'm having some issues using the quota module in the PREROUTING tab=
le.
>=20
> There is no such table. Do you mean the PREROUTING _chain_ in the 'na=
t'=20
> table ?

Yes.

> > As far as I can tell, not all packets are actually hitting my quota
> > rules.  Instead only new connections seem to be managed correctly -
> > subsequent and return packets are unaffected, and thus uncounted.
>=20
> This looks like the normal behaviour of the 'nat' table.

Okay.  Thanks for the clarification.

So I will have to implement some rules in the filter table.  As far as =
I
can tell, though, the only way to share a quota counter between rules i=
n
the nat table and filter table is to implement it in userspace.  Is thi=
s
correct?

Thanks,


--michael

