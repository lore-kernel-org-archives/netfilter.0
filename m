From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: nfs ports
Date: 28 Jan 2005 19:55:45 +0100
Message-ID: <1106938544.11290.5.camel@nostromo.bgsecm.com>
References: <200501281250.55466.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200501281250.55466.JALaramie@Loudoun-Fairfax.com>
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

El vie, 28 de 01 de 2005 a las 18:50, Jeffrey Laramie escribi=C3=B3:
> Hi All,
>=20
> I've been fighting the good fight trying to maintain nfs connections th=
ough my=20
> firewall but I'm not winning. Every time I think I have opened the port=
s I=20
> need nfs (portmapper?) uses a different port. My questions:
>=20
> 1.  Is there a netfilter patch for tracking nfs ports similar to the on=
e for=20
> ftp?
>=20
> 2.  If not, can someone point me to a list of ports used by nfs so that=
 I can=20
> open up what I need once and for all?
>=20
> Thanks
>=20
> Jeff

NFS uses the ports 2049/tcp 2049/udp, but you can obtain them
from the server using rpcinfo with:

rpcinfo -p localhost|grep "nfs"|grep "tcp"|tr ' ' '\n'|grep -v
"nfs"|tail -n 2|head -n 1

rpcinfo -p localhost|grep "nfs"|grep "udp"|tr ' ' '\n'|grep -v
"nfs"|tail -n 2|head -n 1

and for the services quota, lock, stat and mount we use the same method
but changing the grep "nfs" by grep "mount", by example. Lockd only
uses udp, quota uses tcp and udp, mount uses tcp and udp and stat uses
also tcp and udp.

For portmap we use the same method but changing nfs by portmapper. It
uses tcp and udp. Normally it uses 111/tcp and 111/udp.

This is the method we use in our GPL bastion-firewall software to
find the ports.

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


