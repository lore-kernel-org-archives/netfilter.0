From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Marking packets:  order is important?
Date: 16 Sep 2004 18:14:44 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095342489.12579.21.camel@nostromo.bgsecm.com>
References: <086C43C9A9A1A541BFDFABCFDA05F589028E413B@mailnew.tecnun.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <086C43C9A9A1A541BFDFABCFDA05F589028E413B@mailnew.tecnun.es>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El jue, 16 de 09 de 2004 a las 10:51, Arrizabalaga, Saioa escribi=C3=B3:
> I am analysing the script written in the ADSL-Bandwith-Management-HOWTO
> I found in www.tldp.org.
>=20
> It marks all the packets depending on the ports they use, for example:
>=20
> iptables -t mangle -A MYSHAPER-OUT -p tcp --dport 0:1024 \
> -j MARK --set-mark 23     # Default for low port traffic=20
> iptables -t mangle -A MYSHAPER-OUT -p tcp --dport 20 \
> -j MARK --set-mark 26     # ftp-data port, low prio
>=20
> But as far as I can see, the packet that matches the second rule,
> matches the first rule as well, so, I guess that when this packet is
> marked by the first rule (--set-mark 23), follows the chain, sees that
> it also matches the second rule and then it is marked again with the ne=
w
> value(--set-mark 26).=20
>=20
> I would like someone to confirm this. If all this is true, the most
> specific rules should be placed at the end, am I right?
>=20
> Regards,
>=20
> Saioa Arrizabalaga=20

Yes, you are right, the last mark is the one that remains
when the last rule is applied, so you must order your mark
rules from the more general to the more specific ones.

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


