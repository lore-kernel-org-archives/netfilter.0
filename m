From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Iptables, php , realtime bandwidth usage
Date: Thu, 05 May 2005 13:18:13 +0200
Message-ID: <1115291894.21073.4.camel@nostromo.bgsecm.com>
References: <000e01c5515e$b0b62570$1701a8c0@info2000256>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000e01c5515e$b0b62570$1701a8c0@info2000256>
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

El jue, 05-05-2005 a las 12:39 +0200, Robert Becskei escribi=C3=B3:
> Hello everyone,
>=20
>=20
>  I wonder if someone could help me find something similiar to this :
>=20
>  -can monitor bandwidthd usage in real time (php maybe...)
>=20
>  -if possible it could resolve ip address to dns name ? ( I have setup =
my own dynamicdns dhcp server combo )
>=20
> =20
>=20
>  I found a tool if someone would like to try it, but it is not a soluti=
on to my current problem.
>=20
>  http://web4.hm/index.php?http://web4.hm/html/webserver_root.html

Best think I know to monitor bandwidth is Ntop, but it's not realtime,
it's based in rrdtool so you have data each some minutes.

To monitor realtime bandwidth you could use pmacct in a Cacti script,
and watch the results graphically with a browser.

>  Sincerely
>  Robert B

Regards.

--=20

Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


