From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: ip_conntrack_max vs ip_conntrack
Date: 28 Sep 2004 16:27:53 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096376802.28905.38.camel@nostromo.bgsecm.com>
References: <4154A112.20308@suse.cz>
	<1403218a0409280059123fa77f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a0409280059123fa77f@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

El mar, 28 de 09 de 2004 a las 09:59, Mohamed Eldesoky escribi=C3=B3:
> But still,
> The /proc/net/ip_conntrack should contain all connections tracked by
> that firewall (ie, passing through the firewall), am I right ??

Yes, and it will remember the connections made for a time. It's
a list of all the connections the conntrack system have seen, and
it's used to check the established and related connections.

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


