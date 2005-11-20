From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Sun, 20 Nov 2005 12:20:12 -0500
Message-ID: <4380B04C.3090204@rosi-kessel.org>
References: <20051110032733.GA19073@bostoncoop.net>
	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
	<20051114145348.GA12841@bostoncoop.net>
	<Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
	<4378A8B1.8010206@rosi-kessel.org>
	<Pine.LNX.4.58.0511150855520.4319@blackhole.kfki.hu>
	<4379E61F.5000807@rosi-kessel.org>
	<Pine.LNX.4.58.0511151453480.4373@blackhole.kfki.hu>
	<20051115235319.GA1727@bostoncoop.net>
	<Pine.LNX.4.58.0511160923120.6746@blackhole.kfki.hu>
	<20051118015254.GA21128@bostoncoop.net>
	<Pine.LNX.4.58.0511181144430.11854@blackhole.kfki.hu>
	<437EA014.1060908@rosi-kessel.org>
	<Pine.LNX.4.58.0511192128300.13915@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig4D88EF6630B52CA6CB0FD4C5"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0511192128300.13915@blackhole.kfki.hu>
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
To: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig4D88EF6630B52CA6CB0FD4C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Jozsef Kadlecsik wrote:
>>> Just as a last resort. But the problem is so strange, I can't recall =
any
>>> patch related to such a behaviour.
>> Unfortunately, I just tried a kernel upgrade (which pulled in a new li=
bc6)
>> which totally hosed my RAID/LVM. It took me the better part of the eve=
ning
>> to get the RAID working again on the old kernel, so now I'm quite wary=
 of
>> further kernel upgrades until/unless I figure out what happened there.=

> That can happen, unfortunately. It'd be good to know the kernel version=
,
> however, which caused the problem with RAID/LVM.

I was using 2.6.8 from Debian stable; the upgrade to 2.6.14 hosed the LVM=
=2E
RAID actually was fine according to /proc/mdstat, but LVM was segfaulting=
 on
vgscan, which as far as I could tell was more of a sympton than the real
problem. But I couldn't figure it out, and when I returned to 2.6.8, it
still didn't work. After some combination of bringing the RAID up and dow=
n,
flushing the LVM cache file, running the vg* tools, etc., it finally came=

back up, although I can't really tell you why.

>> So are there no diagnostics, absent rebuilding with netfilters debuggi=
ng on,
>> for tracing a packet in between mangle PREROUTING and nat PREROUTING?
> Without further aid, no.

Okay, so I've rebuilt 2.6.8 with NETFILTER_DEBUG=3DY. What would be the n=
ext
step? From what I can tell, NETFILTER_DEBUG isn't something turned on and=

off in /proc/net or /proc/sys/net, it just is "on," but I'm not quite sur=
e
what sort of debug messages we should be trying to get and how.
--=20
Adam Rosi-Kessel
http://adam.rosi-kessel.org


--------------enig4D88EF6630B52CA6CB0FD4C5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDgLBOdTf3ZklQ6qYRAv8qAKC6GLHqM7I0O4xbg3Da6EyMm78MuQCgysex
xy/WX4sqr7SM9Lc8pFZqTdg=
=/9Ea
-----END PGP SIGNATURE-----

--------------enig4D88EF6630B52CA6CB0FD4C5--

