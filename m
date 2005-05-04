From: bharathi <bharathi@au-kbc.org>
Subject: Iptables logs on High bandwidth traffic network
Date: Wed, 04 May 2005 18:15:18 +0530
Message-ID: <4278C3DE.7010403@au-kbc.org>
Reply-To: bharathi@au-kbc.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigDD7C995020643B51C8E08AA8"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigDD7C995020643B51C8E08AA8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,
        I am planning to implement iptables log feature on a server
machine(Dual xeon processor,Intel e100 cards,80GB SCSI and 2GB RAM)
which is running in bridge mode (On RH 7.3).The average traffic on this
machine is vary from 40-60Mbps.Hence I require some suggestion for some
my questions like,

1) On this High traffic the kernel will be stable/crash ?
2) What would be the CPU Load and the server is able to do this job
without any pain ?
3) Up to how much traffic the iptables/kernel can able to handle without
any issue and what should I do additionally if I need the
   iptable-log should handle this much traffic?


Advance thanks for your suggestion and pointers.

bharthix.   
         

--------------enigDD7C995020643B51C8E08AA8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFCeMPj6Du9P0f3T7ARAkZyAJ4mQzKj8LtGGkrOL4v+JYcU3nIbFwCfVArG
iURwFUsTk3bmLr+pAStZOLE=
=v+9X
-----END PGP SIGNATURE-----

--------------enigDD7C995020643B51C8E08AA8--

