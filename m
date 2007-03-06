From: Eric Leblond <eric@inl.fr>
Subject: Re: [libipq] owner of packet, possible patch
Date: Tue, 06 Mar 2007 16:51:47 +0100
Message-ID: <1173196307.23222.17.camel@localhost>
References: <619420780703060739k18ec820dnc8f681b8fc517825@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-p/qzoxq3J44YGbT4peef"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <619420780703060739k18ec820dnc8f681b8fc517825@mail.gmail.com>
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
To: Jack Bauer <mlsubscriber@gmail.com>
Cc: netfilter@lists.netfilter.org


--=-p/qzoxq3J44YGbT4peef
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Le mardi 06 mars 2007 =E0 16:39 +0100, Jack Bauer a =E9crit :
> Hi,
>=20
> I'm a student in computer science and for my master thesis i have to
> handle packets in a userspace queue. Libipq works fine for me, except
> one information which is missing: the owner of a (transmitted) packet.

ipqueue is deprecated in favor of libnetfilter_queue and I'm quiet sure
that no new functionnalities will be pushed to upstream. You may try to
port this to libnetfilter_queue and send your patch to netfilter-devel.

> With the following two additional lines, the problem seems to be solved:
>=20
> in file
>    include/linux/netfilter_ipv4/ip_queue.h
> in
>    typedef struct ipq_packet_msg_t
> line 33 add:
>=20
>         unsigned int uid;               /* uid of packet owner*/
>=20
>=20
> in file
>    net/ipv4/netfilter/ip_queue.c
> line 249 add:
>=20
>         pmsg->uid             =3D entry->skb->sk->sk_socket->file->f_uid;

I don't think this information will be available for non-local packet
(What happens if you queue a packet in FORWARD chain ?). You need at
least to protect the assignement.

> Initial tests have been successful and are showing the correct uid in
> ipq_packet_msg_t in userspace. Please tell me, what you think about
> this modification.
>=20
> Since I found some other people who are looking for the same
> information, i wonder if there is a possibility to include the uid
> field officially in the source of netfilter?!

Don't think so.

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-p/qzoxq3J44YGbT4peef
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBF7Y4TnxA7CdMWjzIRAqVZAJ9gihyHYf/Yvoq9wTkG9za+n3tshACeI+2M
ESxymlERJAx2y1qtgUNxpIw=
=NnXl
-----END PGP SIGNATURE-----

--=-p/qzoxq3J44YGbT4peef--


