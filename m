From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: ip_queue.o and libipq
Date: Wed, 26 May 2004 09:37:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040526073747.GA9500@zion.homelinux.com>
References: <OF35BDBBAA.9AF2C01B-ON65256EA0.001C4D30@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OF35BDBBAA.9AF2C01B-ON65256EA0.001C4D30@hss.hns.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: aksingh@hss.hns.com
Cc: netfilter@lists.netfilter.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Amit,

On Wed, May 26, 2004 at 10:45:23AM +0530, aksingh@hss.hns.com told us:
>=20
> Hi,
>=20
>    Does anybody have an idea which function of ip_queue.c is invoked when
> a userland process does a ipq_read ?

ipqueue works via netlink. When a packet is queued ipq_enqueue_packet
is called with the skb as one of its arguments. This function then
prepares the netlink packet and sends it to userspace via=20
netlink_unicast. netlink_unicast itself will enqueue the netlink packet
on the socket receive queue of the socket (see net/netlink/af_netlink.c::
netlink_sendskb which is called from netlink_unicast). When userspace
(ipq_read) reads from the netlink socket, when there's data on this
socket receive queue the first packet will be dequeued and returned to
userspace.

(I hope this explanation is understandable, I'm still in the learning
process with regard to how the kernel works, so should I be wrong
anybody please correct me :)

> Also, once a NF_QUEUE is returned by a netfilter hook and till the packet
> is copied to userland by ipq_read how many copies are involved ?.
>=20
> I believe there is just one copy when the packet is copied from sk_buff in
> the queue maintained by ip_queue is copied to the buffer supplied by
> ipq_read ? or are there more involved ?
>=20
> also --- is netfilter server down ? havent received any mails since the
> last two days, there seems to be no problem at my mail server ?

Seems like it's down, I didn't receive mails since may 23rd...
>=20
> thanks
> Amit
>=20
> "DISCLAIMER: This message is proprietary to Hughes Software Systems Limit=
ed

Do you think such a disclaimer makes sense when posting to a
mailing list??


Sven

--=20
Linux zion 2.6.6-tcp #4 Thu May 13 20:39:05 CEST 2004 i686 athlon i386 GNU/=
Linux
 09:27:29  up 12 days, 11:30,  1 user,  load average: 0.10, 0.03, 0.01

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAtElLo4FAdB2PneQRAvYXAJ9oLMR2UM3BhVmy90QvyHvtRYv8EACcDITp
HJx3boKgnTxe+5cylglIqWo=
=ICQY
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--

