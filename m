From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Fw: IPTables dynamic routing for school
Date: 07 Apr 2003 18:39:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049733564.4868.16.camel@raylinux.internal>
References: <OE31nHM3SOlbpH71yEX0000100b@hotmail.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-nNbgmHh1Lf3q1db9pn2b"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OE31nHM3SOlbpH71yEX0000100b@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-nNbgmHh1Lf3q1db9pn2b
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

I think you can accomplish this by using squid acl's.

You would need to setup squid (either as a transparent or
non-transparent (opaque?) ) proxy.
Configure a squid acl to use a file.
Have the web application (where students check out assignments) write
the acl file that squid requires.

That's it.

Ray


On Wed, 2003-04-02 at 02:31, Danny Patel wrote:
> Hi,
>   Thanks for the awesome packet filtering tool. It has really come in
> handy for our school setup. I have on issue that I am hoping you can
> help me with. After thoroughly researching this issue I can't seem to
> find any solution to the following situation in my school setup:
> =20
> The server is Gateway/Firewall
> IPTables ver: 1.2.6
> Kernel: 2.4.18 (Red Hat)
> Cable Modem (with DHCP for external address)
> Internal network: 192.168.1.0/24
> Internal interface: eth0
> External interface: eth1
> Internally we use DHCP service to allocate ips to the student PCs.
> (192.168.1.0/24)
> =20
> Goal of what I am trying to do: When the firewall first starts we
> would like to redirect all HTTP traffic headed to the internet from
> the student PCs to our internal webserver (192.168.1.1) where the
> students are first required to pick an assignment. Once a student
> picks an assignment then we would like to allow only that student's ip
> to access the internet, hence allow his HTTP traffic out to the
> internet. This way we can restrict the students from wasting time and
> allow us to keep records of each student accepting assignments before
> having access to the internet to do the research for the assignment.
> =20
> The key here is to only allow those student PCs that have selected an
> assignment access to the internet and redirect all other students to
> our local webserver till they pick an assignment.
> =20
> From my current understanding of IPTables it appears that you can only
> do redirection/dnat in the -t nat PREROUTING chain but then this ends
> up applying to all IPs instead of select few.
> =20
> Any help is greatly appreciated.
> =20
> Thanks in advance

--=-nNbgmHh1Lf3q1db9pn2b
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+kam8h1fuR/Bv+ygRAu9aAKCSjjqNurqG3eu286fENWlhyvCHcACgp3bD
OqPfjoGoIvwGk7TLFVQ/MNE=
=A+ri
-----END PGP SIGNATURE-----

--=-nNbgmHh1Lf3q1db9pn2b--


