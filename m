From: "Alexander W. Janssen" <yalla@ynfonatic.de>
Subject: Re: How to let people see my webcam using Windows Media Encoder
Date: Sun, 2 Feb 2003 18:08:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030202180813.A2604@ynfonatic.de>
References: <000601c2caa5$0a3c1700$0601a8c0@jasper>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000601c2caa5$0a3c1700$0601a8c0@jasper>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jasper,

On Sun, Feb 02, 2003 at 11:22:45AM +0100, Jasper Lingers wrote:
> Also when installed my IP is 192.168.1.6 but now is the thing how people
> can see my webcam from outside. I have no idea where the IPtables config
> file is also cause im using WebMin at the moment so if people could
> explain it me in steps, I would appreciate that.

first you have to know on which port your webcam-program listens.
I would guess it's a small webserver listening on port 80?

Then you just have to do:

iptables -t nat -I PREROUTING -p tcp --dport 80 -j DNAT --to-destination 19=
2.168.1.6:80

This redirects all incoming traffic destined for port 80 on your firewall to
port 80 on your internal windows-box. If you allready use port 80 on your
firewall for some sort of webserver, you can assign another port. For examp=
le,
you might want to redirect port 8888 to port 80 on you internal machine. Th=
en
just do:

iptables -t nat -I PREROUTING -p tcp --dport 8888 -j DNAT --to-destination =
192.168.1.6:80

If your webcam-server doesn't listen to port 80, adapt the 192.168.1.6:n pa=
rt
accordingly.

> I a totally n00b with compiling kernels and stuff, but if it is possible
> to run a program or edit IPtables or so, please help me out, I need it
> get to work for my parents :S

If you are using a recent distribution you don't have to compile any kernel
any more as long as you don't want bleeding-edge features.

> Power2All
> Holland

Umh? :-)

Hope that helps, Alex.


--=20
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so litera=
l."
Instructions for use of this post: Insert tounge in cheek. Read as normal.

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Weitere Infos: siehe http://www.gnupg.org

iEYEARECAAYFAj49UHwACgkQEMMZKORQoYKQ8QCfbbhagZorS+PH14IbweOplKAo
xbkAnjtZlfew2NwQZ426jnW+FuWVI1m2
=Cgof
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--

