From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: more than 1 ISP
Date: 17 Nov 2004 20:14:34 +0100
Message-ID: <1100714893.27541.20.camel@nostromo.bgsecm.com>
References: <20041117115158.GA30794@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041117115158.GA30794@tranquility.scriptkitchen.com>
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

El mi=C3=A9, 17 de 11 de 2004 a las 12:51, Payal Rathod escribi=C3=B3:
> Hi,
> My ISP gives me a speed of 48kbps maximum (actually 64kbps is promised
> but it never goes about 48). For a month or 2 we are taking one more co=
nnection
> of 48kbps from another ISP (actually a nearby company) for uploading da=
ta to
> our client's computer.
> Can I terminate it in my Linux box (which is the gateway) and for few o=
f my windows
> clients make that IP my default gateway or is lartc needed here?
> I don't mind if even FTP protocol passes through the other link and the=
 first
> one is used for browsing and mails.
> I need a simple solution to this and lartc was becoming too complex.
>=20
> Any ideas anyone?
> With warm regards,
> -Payal

You can use the iproute2 command "ip" with the parameter
nexthop to use the 2 ISPs.

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


