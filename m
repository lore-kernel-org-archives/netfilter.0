From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: RE: NAT doesn't work (only a fraction of the forwarded packets
	reach the postrouting chain)
Date: Sun, 13 Mar 2005 16:27:31 +0100
Message-ID: <1110727652.27676.3.camel@nostromo.bgsecm.com>
References: <02BB8A4AC86C564C89C7F14CF98CE0C49B74@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C49B74@knowledge.wizdom.nu>
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

El dom, 13-03-2005 a las 14:34 +0100, Sietse van Zanen escribi=C3=B3:
> Because netfilter is a stateful firewall basically.
> It logs the first per NEW and marks the latter as RELATED,ESTABLISHED.
>=20
> Only packets that match the NEW state will increment the counters. It c=
ounts how many connections have been set-up. Not how many packets belongi=
ng to a connection pass. These will be counted in a -j ACEEPT --state REL=
ATED,ESTABLISHED rule, if present.
>=20
> You could bypass this by creating stateless rule, but that would defeat=
 the purpose of a stateless firewall.

But you can use stateful rules to ACCEPT or DROP the packets and
also stateless rules to LOG the packets, or sending them before the
stateful rules ACCEPT of DROP them to a chain that contains RETURN=20
rules to get the counters.

This is what I do and it works quite well.

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



