From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: iptables returns "module is wrong version"
Date: 28 Jan 2005 17:02:07 +0100
Message-ID: <1106928124.29980.13.camel@nostromo.bgsecm.com>
References: <r02010100-1037-C21332F2714011D998C6000A95DF6F1E@[192.168.1.112]>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <r02010100-1037-C21332F2714011D998C6000A95DF6F1E@[192.168.1.112]>
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
To: Kurt Yoder <ktynetfilter@richard-group.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 28 de 01 de 2005 a las 16:24, Kurt Yoder escribi=C3=B3:
> How do I figure out which patches were applied to the iptables module?
>=20
> I installed iptables from source with no patches but am still getting
> the same error message.

You can see what patches (or modules) iptables have compiled looking
into the /usr/lib/iptables or /usr/local/lib/iptables directory, and
the kernel ones in
/lib/modules/<kernel-version>/kernel/net/ipv4/netfilter

but the problem it's that the iptables modules and the kernel modules
must be synced and patched with the same path-o-matic, or it won't
work properly.

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


