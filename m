From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: insmod: can't read 'ip_queue': No such file or directory?
Date: 17 Jan 2005 14:15:07 +0100
Message-ID: <1105962971.26574.3.camel@nostromo.bgsecm.com>
References: <41EA944C.8090904@lazarusalliance.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41EA944C.8090904@lazarusalliance.com>
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

El dom, 16 de 01 de 2005 a las 17:20, mdpeters escribi=C3=B3:
> Does anyone know how I might fix this error? I am running Fedora Core 2=
=20
> fully patched and iptables-1.2.11, kernel vmlinuz-2.6.10-1.9_FC2smp.
>=20
> # ./insmod ip_queue
> insmod: can't read 'ip_queue': No such file or directory

Try: modprobe ip_queue
and check that you have the ip_queue.ko file and it's
readable.

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


