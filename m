From: Peter Surda <shurdeek@panorama.sth.ac.at>
Subject: SNAT "accounting"
Date: Tue, 17 Sep 2002 19:11:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020917171102.GE2829@noir.cb.ac.at>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pY3vCvL1qV+PayAL"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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


--pY3vCvL1qV+PayAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

I seem to have a problem I don't know how to solve.

Intro: it is pretty easy to do accounting of various types by creating an
iptables rule without a target.

What I am trying to do is to write rules that match the source IP of a SNAT
with multiple sources. Example:

iptables -t nat -A masquerade -s local_subnet -j SNAT --to-source source_ip1 --to-source source_range1

This should, according to docs, "loadbalance" the source IPs and I would like
to do accounting for each of them. However, I don't know what rule to write.
In the POSTROUTING chain in nat table, the original one is used even after the
SNAT rule, as well as in the whole filter chain.

I'm using iptables-cvs from july 30th and kernel 2.4.19-rc3-ac3.

If possible please cc, I'm not on the list.

Bye,

Peter Surda (Shurdeek) <shurdeek@panorama.sth.ac.at>, ICQ 10236103, +436505122023

--
                           Reboot America.

--pY3vCvL1qV+PayAL
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9h2ImzogxsPZwLzcRAt+KAJ96VrBUvonOozUpXS00doeTtSo0tQCfakrx
RsXTpuQwCG+QWPntPacULRc=
=pVkr
-----END PGP SIGNATURE-----

--pY3vCvL1qV+PayAL--

