From: Eric Leblond <eric@inl.fr>
Subject: Re: Blocking programs with IPtables
Date: Fri, 30 Jul 2004 18:26:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091204797.7514.30.camel@porky>
References: <410A5D82.4050109@alimentos-granix.com.ar>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-AerMfUnQ2N2B6F6qK6V4"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <410A5D82.4050109@alimentos-granix.com.ar>
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


--=-AerMfUnQ2N2B6F6qK6V4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-07-30 at 16:38, Leonardo Teves wrote:
> Hi,
> I=B4m new in this forum, and i have a little question.
> ient without deinstalling Outlook from every workstation.
> Is my question clear?
> Any ideas?

It's a planned feature of NuFW. So it can not solved your problem but it
will soon.
In fact, NuFW is a authenticating firewall which extend Netfilter. It's
basic goal has been extended with interesting features (QOS per user,
SSO capabilities, user activities logging). One of the next planned
feature is to have the client warn about the soft that established the
connection and to be able to filter on this parameter. You will be able
to say things like :
"I want user of the group accountant to be able to connect to IMAP
server with thunderbird if there OS is newer than WIN2K"

"I want admins to be able to connect to IMAP server with any client
software if OS is Linux"

More informations on :
	http://www.nufw.org

BR,
--=20
Eric Leblond <eric@regit.org>
NuFW, Now User Filtering Works : http://www.nufw.org

--=-AerMfUnQ2N2B6F6qK6V4
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBCna8nxA7CdMWjzIRAo/7AJ0cmVNrW6coBqU5DennIH8AAhRkVQCcDsi8
YDo+7h9qrL90pntIGlsgZrU=
=4ok0
-----END PGP SIGNATURE-----

--=-AerMfUnQ2N2B6F6qK6V4--


