From: Alexander Samad <alex@samad.com.au>
Subject: Re: Target Request for QOS.
Date: Tue, 23 Mar 2004 07:27:18 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040322202718.GJ9647@samad.com.au>
References: <4213.194.2.155.29.1079971741.squirrel@www.pingus.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQAwcd5tHl0Qlnzi"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4213.194.2.155.29.1079971741.squirrel@www.pingus.org>
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


--LQAwcd5tHl0Qlnzi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi


Brice, slightly off topic, but my understanding in this scenario is that
once the tcp stream is setup it will only use one of the routers, so a
tcp stream (be it ftp or VOIP) so setting your QOS to 4Mb/s is not
actually true

If you had controll over the other end you could setup a EQ interface
and that would/could use the full 4Mb/s


Wouldn't ftp be ingress, I thought ingress flow control doesn't work to
well ( we are talking TC here yes?)

Alex

On Mon, Mar 22, 2004 at 05:09:01PM +0100, Brice GIBOUDEAU wrote:
> Hi,
>=20
> I can see different patch for iptables :
>      - a patch to mark packet from IP information (Source-IP,
> Destination-IP, sport, dport, protocol, etc ...)
>      - a patch to setup unusual route.
> But nothing to mark packet coming-from and going-to a router.
>=20
> This is an example of a problem i trie to solve.
> I have 2 providers with 2 routers (one per provider), this 2 routers
> announce BGP route to my LinuxBox running iptables and Zebra.
> The 2 routers and my LinuxBox is on the same subnet.
>=20
>=20
>          |                      |
>          |                      |
>    ------------            ------------
>    -          -            -          -
>    -  Router1 -            - Router2  -
>    -          -            -          -
>    ------------            ------------
>          |                      |
>          |     -------------    |
>          -------   SWITCH  ------
>                -------------
>                      |
>                      |
>                ------------
>                -          -            -------------
>                - LinuxBox -------------|    DMZ    |
>                -          -            -------------
>                ------------
>                      |
>                      |
>                      |
>                ------------
>                |   LAN    |
>                ------------
>=20
>=20
>=20
>=20
>=20
> I use QOS on the LinuxBox, for exemple :
>=20
>     - if i have 2 lines of 2 Mb/s than my ROOT Fifo (10:) size is 4Mb/s.
>     - I mark traffic for one of my server with 100 (ex : VoIP or VPN).
>     - I mark all other traffic with 101.
>     - I configure 2 FiFo, one of 10Kb/s for 101 fwmark and one of 3996Kb/s
> for 100 fwmark, with the options Bounded-Isolated disabled to share
> bandwidth.
>     My configuration is to prioritize traffic of VoIP or VPN and the free
> bandwidth can be used for download and upload by users.
>=20
> The problem is :
> ----------------
>=20
>     - A phoneCall or a VPN connection is open with a small traffic 10Kb/s.
>     - A user start a download on a FTP server at 2Mb/s (Full line
> Bandwidth) with the same outgoing & incoming Line than the VoIP or VPN
> connection.
>     -> The QOS don't think the line is full and the quality of VPN or
> PhoneCall is degraded (PacketLoss, etc ...).
>=20
> My question is :
> ----------------
>=20
>     - Is it possible to add a target to mark a packet comming from a
> mac-address or the IP of the previous router.
>     - Is it possible to add a target to mark a packet going to a
> mac-address or the IP of the next router (With BGP i have all routing
> information in the routing table).
>     With this two target i can make a difference between the 2 routers
> traffic, than i can remove the FiFo of 4Mb/s and add 2 FiFo of 2Mb/s
> etc ....
>=20
> This is an other configuration i trie to solve the problem :
> ------------------------------------------------------------
>=20
>=20
>          |                      |
>          |                      |
>    ------------            ------------
>    -          -            -          -
>    -  Router1 -            - Router2  -
>    -          -            -          -
>    ------------            ------------
>          |                      |
>          |                      |
>          --------       --------
>                  |      |
>                  |      |
>                  |      |
>                ------------
>                -          -            -------------
>                - LinuxBox -------------|    DMZ    |
>                -          -            -------------
>                ------------
>                      |
>                      |
>                      |
>                ------------
>                |   LAN    |
>                ------------
>=20
>=20
> I change configuration of the 2 routers to connect the routers directly to
> a dedicated interface, with that i can mark packet with the
> incoming/outgoing interface.
> If you do that traffic can go out with the router1 and return by router2
> than the Conntracking reject the packet and i need it on my LinuxBox ....
> Than the only solution is the 2 new target.
>=20
>=20
> Thanks,
> Brice GIBOUDEAU
>=20
>=20

--LQAwcd5tHl0Qlnzi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAX0wmkZz88chpJ2MRAo8bAJ4qjgz19sGFnmXEYniTABjDfl1//QCg18Md
LB+bo6r87zlf8DGtJYsMslo=
=5q6f
-----END PGP SIGNATURE-----

--LQAwcd5tHl0Qlnzi--

