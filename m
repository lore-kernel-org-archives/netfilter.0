From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: log websites visited
Date: 01 Oct 2004 20:33:32 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096655611.5577.5.camel@nostromo.bgsecm.com>
References: <415D5063.4020707@datalux-spain.com>  <415D59F1.60804@unav.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <415D59F1.60804@unav.es>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 01 de 10 de 2004 a las 15:21, Emilio Casbas escribi=C3=B3:
> Vicent Gozalbes wrote:
>=20
> > Hello to all, I'm new in this list.
> > I have an iptables firewall running in a Debian system in my Office.
> > I would like to view all websites visited (IPs or name) for my worker=
s.
> > it's possible with iptables without using a proxy-cache, isn't it?
> >
> Iptables works on layer 3 and 4 of the OSI network model,
> this mean it operates on the IP and TCP/UDP level, it doesn' t
> designed to work in a application layer, for this purpose is used
> the proxy server.
> http://www.squid-cache.org is a good option.
>=20
> Thanks
> Emilio C.

You can add calamaris to the squid proxy with the
transparent proxy feature of iptables to obtain
statistics of the use of the proxy the user are
doing.

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


