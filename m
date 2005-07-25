From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: iptable for single nic
Date: Sun, 24 Jul 2005 22:45:17 -0400
Message-ID: <65aa6af905072419455a66a4a9@mail.gmail.com>
References: <65aa6af905072419344cc427f1@mail.gmail.com>
	<20050725024137.84418.qmail@web42402.mail.yahoo.com>
Reply-To: Edmundo Carmona <eantoranz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050725024137.84418.qmail@web42402.mail.yahoo.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: john decot <johndecot@yahoo.com>
Cc: netfilter@lists.netfilter.org

could it be the input interface?

Have you tried without -i?

On 7/24/05, john decot <johndecot@yahoo.com> wrote:
> yes i have gone throughout transparent proxy "howto". As i said everythin=
g
> is fine but only the thing is iptables is not working properly. And
> expecting help now.
>=20
> Edmundo Carmona <eantoranz@gmail.com> wrote:=20
> I guess you have to configure squid to do transparent proxy. There' a
> "howto" devoted to that.
>=20
> On 7/24/05, john decot wrote:
> > Hello all,
> > i am facing a problem in iptables as follows:
> > i have single nic which ip is eth0=3D x.x.x.x(public_ip)
> > alias is eth0:1=3Dy.y.y.y( private_ip)
> > the proxy works when ip of server and port 3128 at lan connection is
> configured at client side(windows os).
> > But doesn't work without that whenever i flow traffic to proxy server,
> again i have used ip tables as:
> >=20
> > iptables -A PREROUTING -t nat -p tcp --dport 80 -i eth0 -j REDIRECT 312=
8
> >=20
> > with above it doesn't work then i tried following
> >=20
> > iptables -A PREROUTING -t nat -p tcp --dport 80 -i eth0 -j DNAT $public=
_ip
> or $private_ip:3128
> >=20
> > again the same result.
> > client pc and server is connect at same switch. and clients have privat=
e
> ip where as server has public as well as private ip.
> >=20
> > any help will be appreciated.
> >=20
> > thanks in advance.
> > john
> >=20
> >=20
> > ---------------------------------
> > Do you Yahoo!?
> > Yahoo! Mail - Helps protect you from nasty viruses.
> >
>=20
>=20
>  ________________________________
> Yahoo! Mail for Mobile
>  Take Yahoo! Mail with you! Check email on your mobile phone.=20
>=20
>

