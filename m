From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Port 25
Date: 08 Feb 2005 10:32:07 +0100
Message-ID: <1107854056.17398.1.camel@nostromo.bgsecm.com>
References: <Pine.LNX.4.05.10502071325260.15692-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.LNX.4.05.10502071325260.15692-100000@darkstar.sysinfo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El lun, 07 de 02 de 2005 a las 19:30, R. DuFresne escribi=C3=B3:
> I've never heard it is bad, but, te question is how nice one wishes to =
be
> to those trying to transgess your security profile.  I tend to use alot=
 of
> drops, especially for ports like ftp, telnet, some of the printer and
> shell exec ports, any ports trojans are fond of.  The drop make the oth=
er
> end continue trying till the command/connect attepmt is either aborted =
or
> timesout, and with autoomated attacks, that can slow down the how littl=
e
> nasty prog.  Kinder to me and my other servers, as well as others on th=
e
> net when I can slow these things down some.  Reject with rst, those are
> for the ports that you wish to treat the otherend nicely from.

I don't have the documentation handy, but it said making just a
DROP could lead you to being DOS attacked. Have anybody heard
something about this?


> Thanks,
>=20
> Ron DuFresne

Regards.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


