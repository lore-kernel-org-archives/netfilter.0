From: Negrea Mihai <mike@spidernet.co.ro>
Subject: Re: Redirecting incoming traffic to 127.0.0.1
Date: Fri, 21 Mar 2003 16:51:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303211651.16884.mike@spidernet.co.ro>
References: <1048257065.1493.137.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048257065.1493.137.camel@localhost.localdomain>
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
To: Henry Ritzlmayr <h.ritzlmayr@gmx.at>, Netfilter Mailing List <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Maybe the packets reach your service listening on the localhost but they=20
cannot get to the client because it has the source 127.0.0.1

Try SNAT-ing those packets:
iptables -t nat -A POSTROUTING -p tcp -s 127.0.0.1 -j SNAT --to 172.16.17=
2.12

hope I understood the problem

All the best,

- --=20
Negrea Mihai
http://www.negrea.net

On Friday 21 March 2003 16:31, Henry Ritzlmayr wrote:
> I have a service running on a box wich is only able to bind to 127.0.0.=
1
> (hardcoded and I can=B4t get the source to change it). Since I want to =
use
> it from any other box the only way to solve that I think is to nat
> incoming packets to 127.0.0.1.
>
> IPTABLES -t nat -A PREROUTING -p tcp -d 172.16.172.12 -j DNAT
> --to-destination 127.0.0.1
>
> and many others wich I tried don=B4t work.
>
> If I understood REDIRECT correctly it only changes to the local IP wher=
e
> the packet came in (in my situation 172.16.172.12) wich also not solves
> the problem.
>
> any ideas?
>
> Henry

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE+eybk8hhhNOp8KlQRAiRpAJ9h3NJ7OLgMhBnPG+ToZ9dAweXAOwCg3R/4
WtZ8kbHYrihBupFC91nPUeg=3D
=3DPFnF
-----END PGP SIGNATURE-----


