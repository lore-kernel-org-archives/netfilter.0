From: Askar <askarali@gmail.com>
Subject: Re: by passing transparent proxy
Date: Tue, 6 Sep 2005 17:32:08 +0500
Message-ID: <a0f69e5050906053236bcec9f@mail.gmail.com>
References: <20050906120443.25918.qmail@webmail52.rediffmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050906120443.25918.qmail@webmail52.rediffmail.com>
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
To: netfilter@lists.netfilter.org

On 6 Sep 2005 12:04:43 -0000, bimal pandit <bimal_pandit@rediffmail.com>=20
wrote:
>=20
> Dear Askar,=20
>=20
>=20
> On Tue, 06 Sep 2005 Askar wrote :
> >hi list
> >
> >i have a very simple question, we have a transparent proxy "squid" for=
=20
> our
> >users, this machine is also the default gateway for the user. which mean=
=20
> all
> >the traffic of the client do pass from this machine whether its port 80=
=20
> or
> >not.
> >All teh port 80 traffic redirected to squid 3128 by ...
> >
> >$iptables -t nat -A PREROUTING -i eth0 -p tcp -s 0/0 --dport 80 -j=20
> REDIRECT
> >--to-port 3128
> >
> >Now I want to a client -s xx.xx.xx.xx access a site -d xx.xx.xx.xx then=
=20
> his
> >traffic by pass the squid. actaully if the client xx.xx goes through=20
> squid
> >while accessing that site then the far end web server gives him=20
> permission
> >denied.
> >However on web server I could only allow the static ip of the client
> >xx.xxbut not the squid server. its a secure web server.
> >
> >
> >any help in this regards wil be greatly appreciated
> >
> >regards
> >
> >askar
> >
> >
>=20
> I dont think that accessing https request is an issue, I am quite able=20
> enough to get it as 443 is under safe port in my squid.conf.
>=20


Sorry my bad, from secure means that web server running on port 80 but only=
=20
> accessible from certain IPs (restricted by htaccess)
>=20


remember all connections will go through 3128 and will make high port=20
> connections for the transactions.
>=20
> hope this will help a bit.
>=20
> regards,
>=20
> Bimal
> =20
>=20
> <http://adworks.rediff.com/cgi-bin/AdWorks/sigclick.cgi/www.rediff.com/si=
gnature-home.htm/1507191490@Middle5?PARTNER=3D3>=20




--=20
Unix is very simple, but it takes a genius to understand the simplicity.
(Dennis Ritchie)
