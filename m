From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Question about POM
Date: Sun, 13 Feb 2005 20:25:22 +0100
Message-ID: <1108322722.17214.1.camel@nostromo.bgsecm.com>
References: <cuo6t4$q0h$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cuo6t4$q0h$1@sea.gmane.org>
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
To: netfilter@lists.netfilter.org

El dom, 13-02-2005 a las 18:41 +0000, Simon Turvey escribi=C3=B3:
> Hi all,
>=20
> Are the POM patches only supposed to apply to a particular 2.4.x or=20
> 2.6.x?  The reason I ask is that the ipsec* patches don't seem to apply=
=20
> cleanly to my 2.6.10 tree.

They are supposed to be for both 2.4 and 2.6, but in my own
experience it works better on newer kernels. Now that Netfilter
doesn't gives you an official pom you can check their snapshots
from the CVS. The last one should be prepared for 2.6.10.

> Thanks,
>=20
> Simon

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



