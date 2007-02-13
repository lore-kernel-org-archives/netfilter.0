From: vects <alexc@actcom.co.il>
Subject: Re: https permit/deny
Date: Tue, 13 Feb 2007 09:28:58 +0200
Message-ID: <1171351738.32168.42.camel@act17.actcom.co.il>
References: <1171210904.25395.95.camel@act17.actcom.co.il>
	<45CF5652.8050306@solutti.com.br>
	<1171212955.25395.104.camel@act17.actcom.co.il>
	<45CF6392.4080300@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45CF6392.4080300@solutti.com.br>
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
To: Leonardo Rodrigues =?ISO-8859-1?Q?Magalh=E3es?= <leolistas@solutti.com.br>
Cc: netfilter@lists.netfilter.org

On Sun, 2007-02-11 at 15:42 -0300, Leonardo Rodrigues Magalh=C3=A3es wrot=
e:
>=20
> vects escreveu:
> > On Sun, 2007-02-11 at 14:45 -0300, Leonardo Rodrigues Magalh=C3=A3es =
wrote:
> >  =20
> >>     Never used l7 for doing that kind of filtering, dont know if it'=
s=20
> >> possible.
> >>
> >>     Anyway, if you need some hard filtering based on URLs, both http=
 and=20
> >> https, i would recommend that you use an http/https proxy, just like=
=20
> >> squid, for doing that.
> >>
> >>     Completly block https (TCP/443) traffic with iptables and get yo=
ur=20
> >> clients for use an http/https proxy and does the filtering there. I'=
m=20
> >> pretty convinced it will be easier and you'll have a lot more=20
> >> flexibility on the rules. Squid's ACLs are pretty flexible, you shou=
ld=20
> >> give it a try.
> >>    =20
> > Does it work in transparent mode ( I mean for https)?=20
> > I just can't tell all clients to use squid by phone, https filtering
> > must be hidden for them. As I know the latest squid supports totally
> > transparent mode, is that working for https also?
> >  =20
>=20
>     httpS simply cant be treated in completly transparent modes, becaus=
e=20
> that would be detected as a 'man-in-the-middle' attack by the browser=20
> and would break the end-to-end criptography that SSL/TLS uses.
agree.

>=20
>     http can be completly transparent, but https cannot.
I have to find some other solution for my task, sounds like iptables
with l7 is the one for me.=20
Does somebody know another list I can ask for help?

>=20
>     Anyway, if you search the archives, you'll find that it's a common=20
> opinion that iptables it not the right place, even with layer7 patches,=
=20
> to do complex layer7 filtering. It can even do some application=20
> filtering, but it's not supposed for replacing application proxy tools,=
=20
> just like squid for http/https. Complex rules can be applied in an=20
> easier and more flexible way in the application layer, with an=20
> appropriate application proxy.
As I said I have some condition, I can't contact customers and ask them
to define proxy server, this prevents me to use application proxy for
https.=20

Thanks, Alexc
=20




