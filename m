From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Port 25
Date: 07 Feb 2005 10:17:34 +0100
Message-ID: <1107767854.10815.3.camel@nostromo.bgsecm.com>
References: <Pine.LNX.4.05.10502061541590.352-100000@darkstar.sysinfo.com>
	<1107723808.4679.44.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1107723808.4679.44.camel@hubcap.ljm.dom>
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

El dom, 06 de 02 de 2005 a las 22:03, Jason Opperisano escribi=C3=B3:
> Ron has an excellent point here about IDENT.  a "good Internet citizen"
> thing to do when running a mail server is to reject ident instead of
> dropping it:
>=20
>   iptables -A INPUT -p tcp --syn --dport 113 \
>     -j REJECT --reject-with tcp-reset

Isn't it advisable for every tcp port you want to block?
I have some documentation that says that doing otherwise
it's even bad for your network communications.

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


