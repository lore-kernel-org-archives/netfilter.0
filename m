From: Alexander Samad <alex@samad.com.au>
Subject: Re: Trying to use NETMAP for 1-1 NAT
Date: Mon, 15 Mar 2004 15:13:48 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040315041348.GT26800@samad.com.au>
References: <Pine.GSU.4.58.0403142225080.22714@adore.lightlink.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8KmZJhJMEENkOiL3"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.GSU.4.58.0403142225080.22714@adore.lightlink.com>
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


--8KmZJhJMEENkOiL3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Okay, my answer is not really a netfiler answer, but why not run an
IPSEC tunnel between each site and then route over the ipsec tunnel.

If you want to aggregate the head end you could use an equaliser devices
to pull 2 or more xDSL lines together.

As you stated you will need an interaface per ADSL modem in bridge mode.


On Sun, Mar 14, 2004 at 10:57:18PM -0500, Nick Taylor wrote:
> I am posting a newbie question here, so I hope for your patience with me.
> We have had an unsolved problem which is driving us crazy for quite a
> while, and I stumbled upon the NETMAP patch, which seems to do exactly
> what we require.  Unfortunately, I haven't been able to use the module,
> and I'm hoping someone on the list can point me in the right direction.
> Thanks in advance for your help.
>=20
> We have a remote office with a T1 line, which is quite expensive for us to
> maintain, and saturates frequently.  We wish to increase the bandwidth
> available to us, and our remote office is close enough to use DSL over
> bare copper which our telco will provision for us, so the problem is
> multiplexing over the various DSL modems.  If someone has a clever scheme
> for this already, I would love to hear about it, I could obviate the need
> for the NETMAP module.  However, the following details what I want to do,
> and where in the process I stopped...
>=20
> Many, many netblocks are routed from our main office to the remote
> office.  The DSL modems we use, however, are only capable of storing 8
> routes, so we figured we could 1:1 NAT each of the subnets of interest in=
to
> a large private space, send it across the DSL modems, and 1:1 NAT it back
> to the real IP addresses at the other end.  The other option we thought of
> was to use the modems as bridges, but it seems this would require a
> seperate (physical) interface in the linux box at each end for each modem.
> While this solution would work right now, it doesn't scale well.
>=20
> So, enter NETMAP...
>=20
> I downloaded linux-2.4.25.tar.gz from ftp.kernel.org, and after a few
> attempts got a kernel that worked for everything else I needed.  I got the
> patch-o-matic as per the instructions in
> http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO.=
html
> .
>=20
> I patched my kernel with NETMAP, turned it on in make menuconfig, did:
> make dep && make bzImage && make modules && make modules_install
> cp arch/i386/boot/bzImage /boot/vmlinux-2.4.25-patched
> lilo
> reboot
>=20
>=20
> Then I played with:
> iptables -t nat -A POSTROUTING -s 192.168.33.0/24 -j NETMAP --to \
>    192.168.44.0/24
>=20
> which gives the error:
> iptables v1.2.7a: Unknown arg `--to'
>=20
> so, I try:
> iptables -t nat -A POSTROUTING -s 192.168.33.0/24 -j NETMAP
> iptables v1.2.7a: Couldn't load target
> `NETMAP':/usr/lib/iptables/libipt_NETMAP.so: cannot open shared object fi=
le: No such file or directory
>=20
> Right...
> find / -regex '.*NETMAP.*' -print
> ...
> /lib/modules/2.4.25/kernel/net/ipv4/netfilter/ipt_NETMAP.o
> ...
>=20
> Okay, so it's a kernel module, not a shared object, and that's what I
> expected...  so, maybe I need to modprobe it?  That has exactly the
> same results.  Maybe the userspace tool needs an update?  Following
> instructions again found in
> http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO.=
html,
> I do:
> cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic login
> cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic co netfilter/userspa=
ce
> cvs server: warning: new-born netfilter/userspace has disappeared
>=20
> Uh, oh!  Now I am stuck.  Is there a new location I should be looking for
> the userspace?  Is updating the userspace the right thing to be doing?  Is
> this patch "not right" on 2.4.25?  Anyone have any other suggestions what
> I should do?
>=20
> Thanks for your help!
>=20
>=20

--8KmZJhJMEENkOiL3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVS18kZz88chpJ2MRAnFEAJ46NSLd+DA3HeuSw1j2WhSE1sitfQCfatsR
TozsqtNsBCYU4V1XYKLwL6w=
=69FN
-----END PGP SIGNATURE-----

--8KmZJhJMEENkOiL3--

