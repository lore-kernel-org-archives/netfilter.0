From: Eric Leblond <eric@regit.org>
Subject: Re: nfq_bind_pf() simultaneously in 2 separate programs?
Date: Tue, 11 Jan 2011 03:01:04 +0100
Message-ID: <1294711264.29036.13.camel@ice-age>
References: <AANLkTikumMyi8wSQt1ipz10w0TDyjqo6g8Wet-QJ63Pq@mail.gmail.com>
	 <1294698289.29036.8.camel@ice-age>
	 <AANLkTi=OUOR+txCwyQiMmSOOUpnpjYB=FXC_TuVPP2o0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-T6KnSDsi2h1OUNfsdJ9N"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=OUOR+txCwyQiMmSOOUpnpjYB=FXC_TuVPP2o0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Ajay Lele <ajay.lele@gmail.com>
Cc: netfilter@vger.kernel.org


--=-T6KnSDsi2h1OUNfsdJ9N
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 10 janvier 2011 =E0 15:36 -0800, Ajay Lele a =E9crit :
> On Mon, Jan 10, 2011 at 2:24 PM, Eric Leblond <eric@regit.org> wrote:
> > Hello,
> >
> > Le lundi 10 janvier 2011 =E0 12:31 -0800, Ajay Lele a =E9crit :
> >> Hi All
> >>
> >> I am using netfilter_queue library (version 1.0.0, nfnetlink version
> >> 1.0.0) to queue certain packets to user-space and it works great
> >>
> >> Now I want to run 2 instances on this program simultaneously with each
> >> program receiving and processing packets received on a different
> >> queue. The 1st instance of program runs fine, but call to
> >> nfq_unbind_pf()/nfq_bind_pf() for AF_INET fail in the 2nd instance
> >>
> >> Is it not possible to use netfilter_queue APIs simultaneously in 2
> >> programs when each one of them is listening to a separate queue? Any
> >> other approach which can be used to get this to work? - I don't want
> >> to merge the processing of packets on the 2 queues into a single
> >> program
> >
> > nfq_bind_pf() call is linking the kernel nf_queue capability with the
> > nfnetlink_queue module for a given protocol. This has only to be done
> > once on a system (as nfnetlink_queue is the only userspace queuing
> > module for now).
> >
> > Thus your program can simply ignore the return on nfq_[un]bind_pf()
> > function.
>=20
> Thanks Eric for your quick reply
>=20
> I tried ignoring the return from nfq_[un]bind_pf() but
> nfq_create_queue() fails with return value NULL. Target machine is
> running CentOS 5.3

NFQ initialisation in NuFW is working fine since some years now. You can
find it here:
https://nufw.edenwall.com/projects/nufw/repository/revisions/master/entry/s=
rc/nufw/packetsrv.c#L219

BR,

>=20
> Regards
> Ajay
>=20
> >
> > BR,
> >
> >>
> >> Thanks in advance
> >>
> >> Regards
> >> Ajay
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe netfilter" i=
n
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> > --
> > Eric Leblond <eric@regit.org>
> >
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Eric Leblond <eric@regit.org>

--=-T6KnSDsi2h1OUNfsdJ9N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iD8DBQBNK7ncnxA7CdMWjzIRAkFBAJ4m73LZs8kLuLfV1uh3xVlD6I39ogCfa+sd
0udhQ3Np2Uj6PdqasItZqvk=
=K4iW
-----END PGP SIGNATURE-----

--=-T6KnSDsi2h1OUNfsdJ9N--

