From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Blocking forwarding of packets in WLAN
Date: 14 Oct 2004 23:39:27 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097778384.21962.8.camel@nostromo.bgsecm.com>
References: <000501c4b1f4$89506360$db0a11ac@eurecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000501c4b1f4$89506360$db0a11ac@eurecom.fr>
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

El jue, 14 de 10 de 2004 a las 15:48, Claudio Lavecchia escribi=C3=B3:
>  Hello you ppl,=20
>=20
> I am a real newbie to iptables/ipchains/netfilter issues, so please if =
any
> of you can help me, please consider my illetteracy.=20
> I have a really simple question for which I did not find an answer brow=
sing
> the website.=20
>=20
> If I understood correctly there are no C APIs to iptables and this lead=
s me
> to troubles: I am writing a linux daemon that monitors network traffic =
and
> does something when some conditions occur. I work with mobile ad-hoc
> networks where each node acts as a relay for other nodes traffic, so th=
e
> background are WLANs.=20
> I need to write a C function that blocks forwarding of packets that com=
e
> from a given node of the network, identified by its MAC address.=20
>=20
> Prototype for my function is then:=20
>=20
> void block_forwarding(char * MAC_address);=20
>=20
> Is this feasible someway using iptables? Can anyone give me a precise h=
int
> on how to do that? I would be truly grateful if someone could help me.=20
>=20
> Thanks=20
>=20
> Claudio=20

Check libiptc and libipq, they should help for your job, and they
have some documentation you can use.

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


