From: David T-G <davidtg-netfilter@justpickone.org>
Subject: Re: SuSEfirewall2 and NAT help : i am so lost!
Date: Fri, 16 May 2003 11:16:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030516151617.GC53289@justpickone.org>
References: <20030515203925.GA48230@justpickone.org> <20030515211805.GA53289@justpickone.org> <20030515224546.GB53289@justpickone.org> <200305161449.29544.faide@alphacent.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200305161449.29544.faide@alphacent.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: NetFilter Users' List <netfilter@lists.netfilter.org>
Cc: Aide Florent <faide@alphacent.com>


--cYtjc4pxslFTELvY
Content-Type: multipart/mixed; boundary="tNQTSEo8WG/FKZ8E"
Content-Disposition: inline


--tNQTSEo8WG/FKZ8E
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Florent, et al --

=2E..and then Aide Florent said...
%=20
% Le Vendredi 16 Mai 2003 00:45, David T-G a =E9crit :
% > Hi again, all --
=2E..
% > I've attached `iptables -L` so that you can see if anything looks wrong.
%=20
% you should try
%=20
% iptables -t nat -nvL
%=20
% if you want to see what is "NATed" by your machine.

Ah.  Oops!  Now *that* is attached.


%=20
% Hope it helps.

I don't really know what I'm reading, but I admit that it looks somewhat
sparse.  I hope someone can tell me what pieces I'm missing!


%=20
% Florent AIDE


Thanks again & HAND

:-D
--=20
David T-G                      * There is too much animal courage in=20
(play) davidtg@justpickone.org * society and not sufficient moral courage.
(work) davidtgwork@justpickone.org  -- Mary Baker Eddy, "Science and Health"
http://justpickone.org/davidtg/      Shpx gur Pbzzhavpngvbaf Qrprapl Npg!


--tNQTSEo8WG/FKZ8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=iptables-tnat-nvL
Content-Transfer-Encoding: quoted-printable

Chain PREROUTING (policy ACCEPT 326 packets, 31713 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion        =20

Chain POSTROUTING (policy ACCEPT 5 packets, 260 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion        =20
  384 22065 MASQUERADE  all  --  *      eth1    0.0.0.0/0            0.0.0.=
0/0         =20

Chain OUTPUT (policy ACCEPT 221 packets, 13301 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion        =20

--tNQTSEo8WG/FKZ8E--

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (FreeBSD)

iD8DBQE+xQDBGb7uCXufRwARAuA/AJ9SpnpliiiGVaAd1oBiKD8ADzefMACbBM9J
O3sNQ/wMPTdSasIES/Ha08s=
=Ww2/
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--

