From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: will port forwarding work here?
Date: 15 Jan 2005 23:20:01 +0100
Message-ID: <1105802749.19421.9.camel@nostromo.bgsecm.com>
References: <20050114153508.GA1189@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050114153508.GA1189@tranquility.scriptkitchen.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

El vie, 14 de 01 de 2005 a las 16:35, Payal Rathod escribi=C3=B3:
> Hi,
> I have 2 squid proxy on two different machines 192.168.0.10 and=20
> 192.168.0.11 All my clients are configured to use 192.168.0.10:3128
> Now I want a few specific clients to use 192.168.0.11:3128
> Is it possible to write some kind of rule on 192.168.0.10 which will=20
> *properly* redirect traffic from 192.168.0.10:3128 to=20
> 192.168.0.11:3128 for those clients.  A friend on chat suggested (he=20
> was not sure),
>=20
> iptables -A PREROUTING -t nat -s 192.168.0.10 --dport 3128 \
>  -j DNAT --to-destination 192.168.0.11
>=20
> Is there anything else missing?
>=20
> With warm regards,
> -Payal

The easiest way to do this without problems it's just using source
routing, with the iproute2 feature of the kernel. Just use some
"ip" commands to route the traffic to one or the other machine.

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


