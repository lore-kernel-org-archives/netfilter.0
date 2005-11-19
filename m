From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Fri, 18 Nov 2005 22:46:28 -0500
Message-ID: <437EA014.1060908@rosi-kessel.org>
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
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigD3A90701C4964190A394AF44"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0511181144430.11854@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigD3A90701C4964190A394AF44
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Jozsef Kadlecsik wrote:
>>> Try to upgrade to a newer kernel.
>> I guess I'd do this as a last resort. I'm trying to keep the system in=

>> question on Debian Stable if possible. Is there reason to think a kern=
el
>> upgrade would just fix it?
> Just as a last resort. But the problem is so strange, I can't recall an=
y
> patch related to such a behaviour.

Unfortunately, I just tried a kernel upgrade (which pulled in a new libc6=
)
which totally hosed my RAID/LVM. It took me the better part of the evenin=
g
to get the RAID working again on the old kernel, so now I'm quite wary of=

further kernel upgrades until/unless I figure out what happened there.

Hopefully there's some way to get this working with the existing kernel.

> So at least we know the packets are seen by the mangle table. As you tr=
ied
> previously to match them with the 'INVALID' state and it proved to be
> false, they are valid packets according to the conntrack. The filter ta=
ble
> is empty, so we can point our finger to nat alone.

So are there no diagnostics, absent rebuilding with netfilters debugging =
on,
for tracing a packet in between mangle PREROUTING and nat PREROUTING? Whe=
n
exactly does the packet get connection tracked? In between mangle and nat=
,
or at the start of nat but before entering the PREROUTING chain?

And how is it that conn_track thinks the connection is ASSURED when there=

actually hasn't been a single packet forwarded from the external server b=
ack
to the internal client?

Adam


--------------enigD3A90701C4964190A394AF44
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDfqAVdTf3ZklQ6qYRAoKrAJwJ2JRSHjG/4XHtz7th9/7rMIs4JgCdH5m7
Rs/LED9WdqUhRu6IE1bHYME=
=62aw
-----END PGP SIGNATURE-----

--------------enigD3A90701C4964190A394AF44--

