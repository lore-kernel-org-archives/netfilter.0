From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: Re: Help! NAT unable to routing
Date: Fri, 31 Oct 2003 22:23:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031031222359.2619c4b7.netfilter@schuetter.org>
References: <BEA73FB6B8F62545A5B2818724D0DF2902E70848@u.library.Arizona.EDU>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BEA73FB6B8F62545A5B2818724D0DF2902E70848@u.library.Arizona.EDU>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hallo Yan,

On Fri, 31 Oct 2003 11:59:25 -0700
"Han, Yan" <hany@u.library.arizona.edu> wrote:

>=20
> > # what is wrong ??
> > iptables -t nat -A PREROUTING -i eth0 -p tcp -d 150.135.44.245 --dport =
80
> -j
> > DNAT --to 150.135.45.96
>=20
> >> what does "iptables -t nat -L -n -v" show? Is the counter (first colum=
n)
> increased every time you try to connect your webserver?
>=20
> Yes! It does. The "pkts" increases once I try to connect the address
> 150.135.44.245. I think it is correct that destination "150.135.44.245
> tcp dpt:80  to:150.135.45.96". Any idea?

can you try to sniff (e.g. with tethereal or tcpdump) the traffic on the
interface to the webserver? If the packets leave the interface, then
there should be a problem with the webserver or with the routes.

J=F6rg

--=20
J=F6rg Sch=FCtter           http://www.lug-untermain.de/
joerg@schuetter.org     http://www.schuetter.org/joerg/
ICQ: 298982789          http://mypenguin.bei.t-online.de/


