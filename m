From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: ftp connection tracking on multiple ports
Date: 30 Oct 2004 23:00:23 +0200
Message-ID: <1099080894.22637.21.camel@nostromo.bgsecm.com>
References: <BC372EA70AC7724B9DE983CBA6D1D7E5126E37@ws03-exchange.iconos.be>
	<1403218a04102804107389b75e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a04102804107389b75e@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

El jue, 28 de 10 de 2004 a las 13:10, Mohamed Eldesoky escribi=C3=B3:
> I don't use natting, do I still need that helper ???

You just need the ip_conntrack_ftp.o helper.

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


