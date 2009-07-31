From: Robby Workman <rw@rlworkman.net>
Subject: Re: Local to Local via firewall
Date: Fri, 31 Jul 2009 11:42:44 -0500
Message-ID: <20090731114244.66dc41a6@liberty.rlwhome.lan>
References: <20090731144247.01a4f9bb@zeus.int.pccl>
	<1249056381.27177.12.camel@enterprise.ims-firmen.de>
	<20090731172419.669eb256@zeus.int.pccl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A4Kt.ncWn.1KNU_lS1mV2NT";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090731172419.669eb256@zeus.int.pccl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Andrew Clayton <andrew@digital-domain.net>
Cc: Thomas Jacob <jacob@internet24.de>, netfilter@vger.kernel.org

--Sig_/A4Kt.ncWn.1KNU_lS1mV2NT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 31 Jul 2009 17:24:19 +0100
Andrew Clayton <andrew@digital-domain.net> wrote:

> On Fri, 31 Jul 2009 18:06:21 +0200, Thomas Jacob wrote:
>=20
> > On Fri, 2009-07-31 at 14:42 +0100, Andrew Clayton wrote:
> > [.. accessing outside IPs on a NAT router from
> > the inside network ...]
> >=20
> > > I can't help but think I'm missing something simple. Then again
> > > does what I'm trying to do make sense?
> >=20
> > Just don't DNAT/SNAT packets from the internal network to
> > your public IPs, there is no need for it anyway.
> >=20
> > e.g. do something like this before your other DNATs
> >=20
> > $IPTABLES -t nat -A PREROUTING -i eth1 -s 192.168.0.0/16 -p tcp -d
> > $HOST_E -j RETURN
> >=20
> > Plus, of course, you need to allow access to that IP/port from the
> > internal network in the INPUT chain of the filter table.
>=20
> Thanks for the reply. Unfortunately with the above rule, the ssh just
> ends up going to the firewall and not the host. The firewall is
> configured with the IP address of $HOST_E which is where the DNAT
> comes in to change it to it's internal IP.
>=20
> It seems what I'm trying to do now is something like:
>=20
> internal (workstation)--> external ($HOST_E)--> internal ($HOST_I)
>=20
> I could fudge /etc/hosts on machines with the hosts external DNS name
> pointing to its internal IP address, but doing it with the firewall
> seems better.
>=20
> e.g=20
> host.foo.co.uk has an IP of aaa.aaa.aaa.aaa (accessible from outside
> the office)
> host.foo.bar (internal only DNS name) has an IP of bbb.bbb.bbb.bbb
>=20
> I can put=20
>=20
> bbb.bbb.bbb.bbb foo.co.uk
>=20
> in my /etc/hosts file, and then ssh foo.co.uk, works.
>=20
> But I do think the firewall is the proper place to do this.


I disagree - DNS is the proper place IMNSHO.  However, configuring
/etc/hosts on individual machines simply doesn't scale; instead, set
up a DNS server for your internal LAN (even run it on the firewall=20
itself even), and have it resolve host.foo.bar.uk to bbb.bbb.bbb.bbb=20
(the internal ip).

Have a look here for some helpful information:
  http://jengelh.medozas.de/links/iptables/
If you insist on avoiding the DNS solution, then pay attention to
the "Having NAT Issues?" link.

-RW

--Sig_/A4Kt.ncWn.1KNU_lS1mV2NT
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpzHwQACgkQvGy9tf6lsvsrowCfaRuukaiEWVY5KNxN04SFkWGR
gWEAni/AkxMMg6BBlROZIYuCwSYiNQuz
=eyze
-----END PGP SIGNATURE-----

--Sig_/A4Kt.ncWn.1KNU_lS1mV2NT--
