From: Negrea Mihai <mike@spidernet.co.ro>
Subject: Re: Restricting IP addresses from ports
Date: Tue, 25 Feb 2003 17:58:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302251758.40404.mike@spidernet.co.ro>
References: <Pine.LNX.4.44.0302261012070.23380-100000@ns1.teamraf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0302261012070.23380-100000@ns1.teamraf.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Bob <q@teamraf.com>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

put the policy of the chain to DROP and the put rules to accept those por=
ts..
so for INPUT:
iptables -P INPUT DROP
iptables -A INPUT -s 1.1.1.1 -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -s 1.1.1.1 -p tcp --dport 25 -j ACCEPT
=2E..
On Wednesday 26 February 2003 18:13, Bob wrote:
> (I apologize if this message shows up twice.  My system crashed as I wa=
s
> sending it off the first time and I don't see it on the list...)
>
>   How do I allow a specific IP address access to a port like SSH?  I wa=
nt
> to deny all access to ports on a system that I manage except for specif=
ic
> addresses.
>
>   Thanks!
>    Bob

- --=20
Negrea Mihai
http://www.negrea.net
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE+W5Kw8hhhNOp8KlQRAvG0AKCiOsAn0xAn+ktpXaWyG+4Jr/QJrACfagKX
vXWQN3689Y4JTacDTbXoUXc=3D
=3DkCPG
-----END PGP SIGNATURE-----


