From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: insmod: can't read 'ip_queue': No such file or directory?
Date: 18 Jan 2005 03:10:28 +0100
Message-ID: <1106014228.29660.4.camel@nostromo.bgsecm.com>
References: <1105962971.26574.3.camel@nostromo.bgsecm.com>
	<41EA944C.8090904@lazarusalliance.com>
	<1105962971.26574.3.camel@nostromo.bgsecm.com>
	<5.1.0.14.2.20050117153713.00bdfd28@pop.mail.yahoo.it>
	<41EBD138.9040806@lazarusalliance.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41EBD138.9040806@lazarusalliance.com>
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

El lun, 17 de 01 de 2005 a las 15:52, mdpeters escribi=C3=B3:
> I tried this:
>=20
> # /sbin/depmod -a
> # /sbin/insmod ip_queue
> insmod: can't read 'ip_queue': No such file or directory
>=20
> Question?
>=20
> Does the ip_queue get placed into the kernel source by iptables or is i=
t=20
> something already in the kernel that just gets activated?

It's a module. It's a part of the kernel that gets loaded only
if it's needed.

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


