From: Emmanuel lesouef <elesouef@nerim.net>
Subject: Difference between two policies
Date: Tue, 11 Feb 2003 18:54:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030211185455.1d64ea21.elesouef@nerim.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha1"; boundary="=.+SQ?_5XG/Ilujf"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

--=.+SQ?_5XG/Ilujf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello all,

I would like to know if you see a difference between these two script-parts :

script 1 : 

iptables -P INPUT ACCEPT
[... some rules related to INPUT...]
iptables -A INPUT DROP

script 2 :

iptables -P INPUT DROP
[...the same rules related to INPUT...]

Thank you in advance.

-- 
Emmanuel Lesouef
Association CaLviX
Caen - 14000 (France)
elesouef@nerim.net

--=.+SQ?_5XG/Ilujf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+STjzKupdLvq3Q5ERAjnLAJ9jV6/oLm/2ZbindvNeRQHN7A62ZQCgiVia
EBB93lKMUBSHyRNoT3c02OE=
=eAjd
-----END PGP SIGNATURE-----

--=.+SQ?_5XG/Ilujf--

