From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Port 25
Date: 08 Feb 2005 14:52:28 +0100
Message-ID: <1107870748.13418.17.camel@nostromo.bgsecm.com>
References: <Pine.LNX.4.05.10502071325260.15692-100000@darkstar.sysinfo.com>
	<1107854056.17398.1.camel@nostromo.bgsecm.com>
	<1107868554.4399.4.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1107868554.4399.4.camel@hubcap.ljm.dom>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mar, 08 de 02 de 2005 a las 14:15, Jason Opperisano escribi=C3=B3:
> i propose that the exact opposite is true.  why should i make my
> firewall undertake the effort of generating a RST packet for every yaho=
o
> on the Internet that wants to scan my IP range for TCP 139, 445, etc.
>=20
> DROP-ing a packet doesn't take any real effort on the firewall's part;
> whereas generating a RST packet adds at least some overhead--which in
> the extreme case could be significant.
>=20
> -j

I see your point, but just googling a bit:

http://www.chiark.greenend.org.uk/~peterb/network/drop-vs-reject

so things are maybe somewhat more complex.

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


