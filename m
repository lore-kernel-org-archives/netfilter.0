From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: RE: virus scanning with iptables
Date: 10 Sep 2004 18:37:59 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094820933.30362.23.camel@nostromo.bgsecm.com>
References: <01CEA3A5B8B2D511890F0002A5870AEC02CE644C@exchange.admin.slc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <01CEA3A5B8B2D511890F0002A5870AEC02CE644C@exchange.admin.slc.edu>
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

El vie, 10 de 09 de 2004 a las 02:36, Khanh Tran escribi=C3=B3:
> How about port scanning clients behind from the firewall?  Suggestions?
> I'm thinking of something that could be scripted to append an iptables
> rule to block the MAC address of the offending client, then notify me.
> Am I looking at an NMAP plugin possibly?
>=20
>=20
> Khanh Tran
> Network Operations
> Sarah Lawrence College

You can look at snort+guardian to make this kind of rules, but
have in mind that are easy to bypass and also there's a real
danger of having a DOS if you don't have a list of IPs you never
want to block, as your DNS server, your own machines and so.

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


