From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Diagnosing "Error: NAT is only supported for IPv4/IPv6"
Date: Tue, 22 Aug 2017 19:33:15 +0200
Message-ID: <20170822173315.GA18186@salvia>
References: <5156c091-4b06-9efd-fd33-9a117f526572@wagsky.com>
 <94b2bbfe-b72f-992f-b1c6-ec36e0aa4c1b@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <94b2bbfe-b72f-992f-b1c6-ec36e0aa4c1b@wagsky.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeff Kletsky <netfilter@allycomm.com>
Cc: netfilter@vger.kernel.org

On Tue, Aug 22, 2017 at 09:55:10AM -0700, Jeff Kletsky wrote:
> Digging into the cause (and, for now ignoring the unhelpful error message=
),
> this appears to be a bug in nft
>=20
> No matter what the documentation says, it appears that NAT statements can=
't
> be in an "inet" table
>=20
> Parses and loads with "table ip"
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> #!/usr/sbin/nft -f
>=20
> flush ruleset
>=20
> table ip global {
>=20
> =A0=A0=A0 chain nat_in {
> =A0=A0=A0 =A0=A0=A0 type nat hook prerouting priority -100
> =A0=A0=A0 continue
> =A0=A0=A0 }
>=20
> =A0=A0=A0 chain nat_out {
> =A0=A0=A0=A0=A0=A0=A0 type nat hook postrouting priority -100
> =A0=A0=A0 continue
> =A0=A0=A0 }
>=20
> }
>=20
>=20
> Fails with "table inet"
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> #!/usr/sbin/nft -f
>=20
> flush ruleset
>=20
> table inet global {
>=20
> =A0=A0=A0 chain nat_in {
> =A0=A0=A0 =A0=A0=A0 type nat hook prerouting priority -100
> =A0=A0=A0 continue
> =A0=A0=A0 }
>=20
> =A0=A0=A0 chain nat_out {
> =A0=A0=A0=A0=A0=A0=A0 type nat hook postrouting priority -100
> =A0=A0=A0 continue
> =A0=A0=A0 }
>=20
> }
>=20
>=20
> The error messages here are different, but equally useless
>=20
> $ sudo nft -f nftables.conf
> nftables.conf:3:1-14: Error: Could not process rule: No such file or
> directory
> flush ruleset
> ^^^^^^^^^^^^^^
> nftables.conf:3:1-14: Error: Could not process rule: No such file or
> directory
> flush ruleset
> ^^^^^^^^^^^^^^
> nftables.conf:3:1-14: Error: Could not process rule: No such file or
> directory
> flush ruleset
> ^^^^^^^^^^^^^^
> nftables.conf:3:1-14: Error: Could not process rule: No such file or
> directory
> flush ruleset
> ^^^^^^^^^^^^^^

This is working since:

commit 509671dfa03365bba727b8be5e522b737da93a6f
Author: Pablo Neira Ayuso <pablo@netfilter.org>
Date:   Thu Jun 15 14:35:33 2017 +0200

    src: error reporting for nested ruleset representation

Would you give a try to nft.git snapshot to confirm this?

This will be included in the next release.
