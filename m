From: vects <alexc@actcom.co.il>
Subject: Re: https permit/deny
Date: Sun, 11 Feb 2007 18:55:55 +0200
Message-ID: <1171212955.25395.104.camel@act17.actcom.co.il>
References: <1171210904.25395.95.camel@act17.actcom.co.il>
	<45CF5652.8050306@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45CF5652.8050306@solutti.com.br>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Leonardo Rodrigues =?ISO-8859-1?Q?Magalh=E3es?= <leolistas@solutti.com.br>
Cc: netfilter@lists.netfilter.org

On Sun, 2007-02-11 at 14:45 -0300, Leonardo Rodrigues Magalh=C3=A3es wrot=
e:
>     Never used l7 for doing that kind of filtering, dont know if it's=20
> possible.
>=20
>     Anyway, if you need some hard filtering based on URLs, both http an=
d=20
> https, i would recommend that you use an http/https proxy, just like=20
> squid, for doing that.
>=20
>     Completly block https (TCP/443) traffic with iptables and get your=20
> clients for use an http/https proxy and does the filtering there. I'm=20
> pretty convinced it will be easier and you'll have a lot more=20
> flexibility on the rules. Squid's ACLs are pretty flexible, you should=20
> give it a try.
Does it work in transparent mode ( I mean for https)?=20
I just can't tell all clients to use squid by phone, https filtering
must be hidden for them. As I know the latest squid supports totally
transparent mode, is that working for https also?

Thanks, Alexc.

>=20
>=20
> vects escreveu:
> > Hi,
> >
> > I'm looking for solution of the next problem, I have to enable/disabl=
e
> > an access to list of https web servers, I don't know in advance IPs o=
f
> > them, permit rule must be based of the url user typed in location bar.
> >
> > Is possible to do that by iptables and extentions?
> > I thought about l7 filter.
> >
> >  =20
>=20


