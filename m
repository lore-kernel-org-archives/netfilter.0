From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: RE: Ping only inside my network
Date: 27 Dec 2004 17:32:52 +0100
Message-ID: <1103719534.5956.3.camel@nostromo.bgsecm.com>
References: <20041220073406.E37712F42A@kshira.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041220073406.E37712F42A@kshira.sterenborg.info>
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

El lun, 20 de 12 de 2004 a las 08:34, Rob Sterenborg escribi=C3=B3:
> You don't give much information about what you've done already, but you
> have probably set the policy for the INPUT chain to DROP so it will dro=
p
> any packet for which NF has no rule to accept it.
> In that case you'll have to accept ICMP traffic from your LAN :
> iptables -A INPUT -i $IF_LAN -s $IP_LAN -p icmp -j ACCEPT
>=20
> If you have also set policy to DROP for the OUTPUT chain, you'll want t=
o
> be able to send the reply packets :
> iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>=20
>=20
> Gr,
> Rob

It would be even better if he only accepts the echo-request and
echo-reply packets. That will allow pings but will deny other
kind of icmp packets that could be harmful.

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


