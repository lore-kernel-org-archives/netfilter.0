From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: sysctl ip_queue_maxlen variable
Date: Thu, 15 Jul 2004 08:51:27 +0200
Sender: kernelnewbies-bounce@nl.linux.org
Message-ID: <20040715065127.GA21084@zion.homelinux.com>
References: <OFE5293A42.0467D741-ON65256ED2.001F2429@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <kernelnewbies-bounce@nl.linux.org>
Content-Disposition: inline
In-Reply-To: <OFE5293A42.0467D741-ON65256ED2.001F2429@hss.hns.com>
Errors-to: kernelnewbies-bounce@nl.linux.org
List-help: <mailto:ecartis@nl.linux.org?Subject=help>
List-unsubscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=unsubscribe>
List-software: Ecartis version 1.0.0
List-Id: <netfilter.vger.kernel.org>
List-subscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=subscribe>
List-owner: <mailto:riel@nl.linux.org>
List-post: <mailto:kernelnewbies@nl.linux.org>
List-archive: <http://mail.nl.linux.org/kernelnewbies/>
To: aksingh@hss.hns.com
Cc: kernelnewbies@nl.linux.org, netfilter@lists.netfilter.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hit Amit,

On Thu, Jul 15, 2004 at 11:17:22AM +0530, aksingh@hss.hns.com told us:
>=20
> Hi,
>=20
>   how does the sysctl ip_queue_maxlen variable
> work(net.ipv4.ip_queue_maxlen). This is used by the ip_queue.o module in
> the kernel to queue packets that have to be sent to user land using netli=
nk
> sockets. I felt that this sysctl variable helped us define the max length
> for the queue maintained by ip_queue.o, but when I looked at ip_queue.c ,
> the value for the sysctl variable is stored at &sysctl_maxlen, where as
> before enqueing a packet using the function __ipq_enqueue_entry, the
> present len is compared against the variable queue_maxlen and not against
> sysctl_maxlen, why is that so ?? so afterall is the queue max len
> configurable ?? i have tried using sysctl from command line on
> ip_queue_maxlen, it works fine and allows me to set it to any value
> sizeof(int), but is this value usde somewhere inside ip_queue, I could not
> find that in ip_queue.c ... any clues ??

in which kernel version did you find this?? I've looked at 2.6.8-rc1
and 2.4.26, and in both kernel versions the variable used for the
sysctl and for checking in ip_queue.c. There is no variable=20
sysctl_maxlen in this file.

(from 2.4.26, around line 590):
static ctl_table ipq_table[] =3D {
	{ NET_IPQ_QMAX, NET_IPQ_QMAX_NAME, &queue_maxlen,
	  sizeof(queue_maxlen), 0644,  NULL, proc_dointvec },
 	{ 0 }
};

(from 2.4.26, around line 67, function __ipq_enqueue_entry):
       if (queue_total >=3D queue_maxlen) {
               if (net_ratelimit())=20
                       printk(KERN_WARNING "ip_queue: full at %d entries, "
                              "dropping packet(s).\n", queue_total);
               return -ENOSPC;
       }


HTH

Sven
>=20
> regards
> Amit

--=20
Linux zion 2.6.8-rc1 #3 Mon Jul 12 22:38:00 CEST 2004 i686 athlon i386 GNU/=
Linux
 08:45:07  up 2 days, 10:02,  1 user,  load average: 0.08, 0.06, 0.01

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFA9ilvo4FAdB2PneQRAuYyAJ9yzCVwf8O81fwLYf9eCgPwKFCeZACePS5J
A5Cn+jE49Gk79oyITcHNbSQ=
=6kJL
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--

--
Kernelnewbies: Help each other learn about the Linux kernel.
Archive:       http://mail.nl.linux.org/kernelnewbies/
FAQ:           http://kernelnewbies.org/faq/

