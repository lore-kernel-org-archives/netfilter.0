From: O-Zone <liste@zerozone.it>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Thu, 20 May 2004 14:54:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201454.50355.liste@zerozone.it>
References: <200405201318.34706.liste@zerozone.it> <200405201330.31625.Antony@Soft-Solutions.co.uk>
Reply-To: liste@zerozone.it
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201330.31625.Antony@Soft-Solutions.co.uk>
Content-Description: clearsigned data
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thanks for reply,

On Thursday 20 May 2004 14:30, Antony Stone wrote:
[ SNIP ]
[INTRANET 10.0.0.0/24]-------------+
                                                      +--[ROUTER]--(NET)
[DMZ SERVER A - 192.168.0.2]----+
[DMZ SERVER B - 192.168.0.3]----+

Each DMZ server is mapped to it's PUBLIC IP. For example:

151.8.47.A ----> 192.168.0.2
151.8.47.B ----> 192.168.0.3
[...]
> It's the reply packets which are the problem.
>
> http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-10.html

i've read that manual but i't not so clear. It say to do a:

# iptables -t nat -A POSTROUTING -d 192.168.1.1 -s 192.168.1.0/24 \
        -p tcp --dport 80 -j SNAT --to 192.168.1.250

but  can't understand what it say for 192.168.1.250. As in my config, i've=
=20
write down that rule:

$IPTABLES -t nat -A POSTROUTING -d 151.8.47.B -s 192.168.0.0/24 -p tcp -j S=
NAT=20
=2D --to 192.168.0.1

=2E..where 192.168.0.1 is the DMZ interface of ROUTER. It don't work. Where=
's=20
the error ?

Thanks. Oz



=2D --=20
Children are natural mimics who act like their parents despite every
effort to teach them good manners.
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFArKqVYuBSFbgkEysRAr5UAJ9BYkyVJ7UP659V1E46GhbWcADehwCgsKj4
2NJvOiTcojDX9CPzQPSG0Nc=3D
=3DJx70
=2D----END PGP SIGNATURE-----


