From: Eric Leblond <eric@regit.org>
Subject: Re: Using netfilter in a multi-threaded program
Date: Fri, 12 Jul 2013 16:47:52 +0200
Message-ID: <1373640472.12419.7.camel@ice-age.regit.org>
References: <CAHh8oT7QQKpKoa_2TU8W=-UaGqsY0s=vGEL2DL-+70xhLGJr5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-O4Ky+z7k4wJQI1XZe4JV"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHh8oT7QQKpKoa_2TU8W=-UaGqsY0s=vGEL2DL-+70xhLGJr5Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Michael Kilian <michael.kilian@gmail.com>
Cc: netfilter@vger.kernel.org


--=-O4Ky+z7k4wJQI1XZe4JV
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 12 juillet 2013 =E0 09:23 -0400, Michael Kilian a =E9crit :
> I am a little confused with using netfilter API's using multiple
> threads to access multiple queues presumably to get better
> performance.
>=20
> Is there documentation on what is thread-safe?  How about what can be
> run in parallel?



> From what I can discern from the API structure you have a single fd to
> the NFQUEUE infrastructure (from nfq_open).  All packets flow over
> that.

The fd is per-queue so you can multithread using multiple recev thread
per-fd.

You can find a multithreaded code source example here:

https://redmine.openinfosecfoundation.org/projects/suricata/repository/revi=
sions/master/entry/src/source-nfq.c

and a documentation here:

https://home.regit.org/netfilter-en/using-nfqueue-and-libnetfilter_queue/
>=20
> Question #1:  If I have n threads performing recv's on this fd, am I
> going to get complete packets atomically?  Are multiple simultaneous
> recv's allowed? Or must this be handled with a single thread (and
> doesn't this inherently limit the scalability of this)?

One single thread per fd is the way to go.

> Question #2:  If I have multiple queues (for example, using
> --queue_balance 0:3), it appears that we only see the multiple queues
> in the call back (which I get to by registering the queue number and
> the callback to the single nfqHandle using nfq_create_queue).  So is
> the flow:  single threaded access to the nfqHandle, but once I get to
> the callback I can handle different nfq_q_handles in different
> threads?  This seems to only allow packet processing, verdict
> rendering etc. to be multi-threaded, but not the initial packet read.
> Is this correct?
>=20
> Question #3:  It appears that --queue_balance 0:3 must relate to the
> nfq_q_handles, not the nfq_handle.  Is this right?
>=20
> Ultimately I worry about how to get 10-20 Gbps through this interface
> if I end up single-threaded on the initial receive (see Question #1).
> Is there a programming paradigm that allows the recv's to be handled
> in multiple threads, across multiple CPUs?  For example, in "normal"
> socket programming, content is distributed across the CPUs,
> connections can be accepted in parallel, etc.  It would seem to me to
> be logical to allow the multiple queues specified with the
> --queue_balance to be treated completely independently in the threads.
>  And while I am no kernel expert, don't most NICs now deliver the
> packets across cores today (they certainly can distribute the
> interrupts across cores).

Latest kernel has cpu fanout support which allow to stay on the same CPU
for a single queue. This way you can load balance flow on your network
card and have the packet stay on the same core for treatment (if your
userspace program is bound to the correct cpu).

BR,

>=20
> -- Mike Kilian
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=-O4Ky+z7k4wJQI1XZe4JV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iD8DBQBR4BcYnxA7CdMWjzIRAnWOAJ9h7gzfEdard2I7AZJ3ArJYU+Mi4ACdF1b/
0mkEmAfqQX1RKUsU6DFxW1I=
=U+6B
-----END PGP SIGNATURE-----

--=-O4Ky+z7k4wJQI1XZe4JV--

