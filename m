From: "Michael H. Warfield" <mhw@wittsend.com>
Subject: Re: Can I have DES / 3 DES VPN with IPtables Kernal kernel versio n 2. 4.20 with IPSEC installed
Date: Thu, 18 Dec 2003 21:27:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031219022713.GA11514@alcove.wittsend.com>
References: <A44765C986F8D411995B00B0D0795F4B1E9A1B20@hhtnt002>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <A44765C986F8D411995B00B0D0795F4B1E9A1B20@hhtnt002>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Laxmi_Narsaiah <Narsaiah@satyam.com>
Cc: "'John A. Sullivan III'" <john.sullivan@nexusmgmt.com>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2003 at 07:18:38AM +0530, Laxmi_Narsaiah wrote:
> I am sorry, I am not clear...U mean to say this IPTABLES supports 3DES ???

	IPTables itself has no use for 3DES.

	If you mean IPSec (FreeS/WAN), yes, FreeS/WAN supports 3DES.

	IPSec is provided by the FreeS/WAN package, not by IPTables.
But IPSec is an IP protocol (two actually) so it does get processed and
filtered by IPTables, yes.

	IPTables won't know anything about 3DES.  It will know about
AH (IP protocol 51) and ESP (IP protocol 50).  You can filter those in
IPTables.  But the VPN stuff itself will be managed by FreeS/WAN.

	IPTables is in the stock kernels.  FreeS/WAN is an add-on and
can add IPSec to the 2.4 kernels.  IPSec (the kernel level encryption
code) has been added to the 2.6 kernel and can be managed by the user-land
FreeS/WAN utilities.

	Mike

> -----Original Message-----
> From: John A. Sullivan III [mailto:john.sullivan@nexusmgmt.com]
> Sent: Thursday, December 18, 2003 8:25 PM
> To: Laxmi_Narsaiah
> Cc: 'netfilter@lists.netfilter.org'
> Subject: Re: Can I have DES / 3 DES VPN with IPtables Kernal kernel
> version 2. 4.20 with IPSEC installed
>=20
>=20
> On Thu, 2003-12-18 at 07:58, Laxmi_Narsaiah wrote:
> > Hi,
> >=20
> > Can I have DES / 3 DES VPN with IPtables Kernal kernel version 2.4.20
> > with IPSEC installed, please let me know.
> >=20
> <snip>
> 	We do this all the time with FreeS/WAN.  In fact, we are developing
> a
> GUI front end to managed combined firewall and VPN security for large,
> complex implementations.  You can find training slide shows on using
> iptables, FreeS/WAN, iproute2 and DHCP at http://iscs.sourceforge.net -
> Good luck
> --=20
> John A. Sullivan III
> Chief Technology Officer
> Nexus Management
> +1 207-985-7880
> john.sullivan@nexusmgmt.com
> ---
> If you are interested in helping to develop a GPL enterprise class
> VPN/Firewall/Security device management console, please visit
> http://iscs.sourceforge.net=20
> *************************************************************************=
*=20
> This email (including any attachments) is intended for the sole use of the
> intended recipient/s and may contain material that is CONFIDENTIAL AND
> PRIVATE COMPANY INFORMATION. Any review or reliance by others or copying =
or
> distribution or forwarding of any or all of the contents in this message =
is
> STRICTLY PROHIBITED. If you are not the intended recipient, please contact
> the sender by email and delete all copies; your cooperation in this regard
> is appreciated.
> **************************************************************************

--=20
 Michael H. Warfield    |  (770) 985-6132   |  mhw@WittsEnd.com
  /\/\|=3Dmhw=3D|\/\/       |  (678) 463-0932   |  http://www.wittsend.com/=
mhw/
  NIC whois:  MHW9      |  An optimist believes we live in the best of all
 PGP Key: 0xDF1DD471    |  possible worlds.  A pessimist is sure of it!

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iQCVAwUBP+JiAeHJS0bfHdRxAQHDgQQAr5oYe9S+dLA2LkqG9TcnR2r9VLfDGgRf
Zxil4zH5qcV/T42zOziZ+vm9m7EW+njz5Bn4GK65hv8+Zs964NDiLYbERybP2pp5
+ZdqPmnuDGZYxd3kRhEhhwMg4RNzr00gJuvylasr6IR4kuO7V22zQ17tnOmeMu+3
yx+D62pEb30=
=sO+L
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--

