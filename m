From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Iptables Network Performance
Date: Wed, 23 Feb 2005 12:02:00 +0100
Message-ID: <1109156520.11713.6.camel@nostromo.bgsecm.com>
References: <421D2CCE.50702@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <421D2CCE.50702@wildcash.com>
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

El mi=C3=A9, 23-02-2005 a las 17:24 -0800, Rudi Starcevic escribi=C3=B3:
> Hi,
>=20
> Could iptables really reduce network speed by more than 50%.
>=20
> It is hard to believe but that seems to be my predicament right now.
>=20
> For this test I have a 12 meg file.
>=20
> When I download this from my Linux box is get a download speed of 47.23=
K/s
>=20
> When I move this 12 meg file to an internal web server and port-forward
> to it from the Linux box I see a download rate of 11.70K/s
>=20
> Does this sound reasonable?

No, it doesn't sound reasonable. I use DNAT and it almost doesn't
affect my download/upload speed on the server. I think you have
another problem.

> If I move my Port-forwarding rule higher up woudld it help?

I don't think so. But it would be better that the rule it's the first
in the nat chain, but it doesn't matter where you put it in
the script. I suppose you knew that.

> Thanks
> Regards
> Rudi     =20

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



