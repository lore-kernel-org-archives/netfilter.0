From: Stephen Frost <sfrost@snowman.net>
Subject: Re: AW: iptables wishes
Date: Tue, 1 Apr 2003 07:13:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030401121306.GX18434@ns.snowman.net>
References: <65F646CE24EBF24AA3714070D537988E017F04@gargoyle.seaan.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rYAl11fiF69JSutc"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <65F646CE24EBF24AA3714070D537988E017F04@gargoyle.seaan.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: mailinglists <mailinglists@belfin.ch>
Cc: netfilter@lists.netfilter.org


--rYAl11fiF69JSutc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* mailinglists (mailinglists@belfin.ch) wrote:
> Generally I think this is a problem of too large rule sets. Is there a wa=
y to make containers of src/dst addresses? e.g. like this:
>=20
> container_untrusted_dns=3D"ip.addr.A, ip.addr.B, ip.addr.C"
> container_trusted_dns"ip.addr.D, ip.addr.E"
>=20
> iptables -A FORWARD -p 6 -m state -s $container_trusted_dns --sport 1024:=
 -d $container_untrusted_dns --dport 53 -o $waneth --state NEW,ESTABLISHED =
-j ACCEPT

It's overkill for this but you can use ipt_recent for matching on many
disseperate addresses or ippool for faster matching on IP addresses in
small ranges.  ippool in netfilter currently uses a bitfield for it's
IP address storage so you have to specify the range ahead of time and if
the range is very large it takes up gobs of memory.  ipt_recent is meant
for doing matches on recently seen IP addresses but can also be used for
static lists without penalty if you use --rcheck for the check (and not
--update).  ipt_recent is implemented as a hash table and so you can
throw any address you want in it without concern for memory size beyond
the total number of IP addresses you want to be able to store at once
instead of their disparity.  More information on ipt_recent is available
in the netfilter extension FAQ and at the homepage
http://snowman.net/projects/ipt_recent/ .  ippool is documented as part
of netfilter.

	Stephen

--rYAl11fiF69JSutc
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+iYJSrzgMPqB3kigRAt8WAJ9Qbsi6ZOCMTxgfBDbrGQMDugTblACgjGTm
ZtL+LjfozpZ8ukq0sfhG10E=
=fJd+
-----END PGP SIGNATURE-----

--rYAl11fiF69JSutc--

