From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: strange traffic
Date: 26 Sep 2004 22:34:21 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096228503.31631.32.camel@nostromo.bgsecm.com>
References: <a0f69e504092408533ebc42d7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e504092408533ebc42d7@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: netfilter <netfilter@lists.netfilter.org>

El vie, 24 de 09 de 2004 a las 17:53, Askar escribi=C3=B3:
> hi all=20
> can someone tell me  what type of traffic is this....
> #tcpdump -n port not 22 -c 100 and -t host xxx.xx.xx.xx
>=20
> xx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
> xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
> xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
> xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
> xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
> xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
> xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
> xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
> xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
> xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
> xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
> xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
> xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
>=20
> xxx... is our client IP we are getting lot of like these.. days with
> different source ip each time.
> regards

Port 36 is unnasigned, so it maybe it's a worm or any kind
of attack. You could stop it in your firewall with no problem.

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


