From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Patch-o-matic and Time Based Rules
Date: 15 Jan 2005 23:19:56 +0100
Message-ID: <1105802280.26750.4.camel@nostromo.bgsecm.com>
References: <75b657f40501142358308ebc64@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <75b657f40501142358308ebc64@mail.gmail.com>
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

El s=C3=A1b, 15 de 01 de 2005 a las 08:58, DurgaPrasad Adusumalli escribi=
=C3=B3:
> I am running FC3 and iptables 1.2.11. I like to add Time Based rules
> module support to my existing system. Is there any possibility of
> adding just the patch I like to without using patch-o-matic ng.
>=20
> Thanks in advance.
> Durga Prasad.

You have to patch the iptables 1.2.11 source code and the kernel
source code with patch-o-matic-ng. Or you can get a kernel, and
an iptables rpm package with the features you want. But both
the kernel and iptables must be synced or it won't work.

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


