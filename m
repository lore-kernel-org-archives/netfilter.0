From: Lopsch <lopsch@lopsch.com>
Subject: question about --tcp-flags
Date: Thu, 02 Dec 2004 23:08:21 +0100
Message-ID: <41AF9255.4040408@lopsch.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature";
	boundary="------------enigE3CE79644C4D0FA4C8675847"
Content-Transfer-Encoding: 7bit
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
To: Netfilter-Mailinglist <netfilter@lists.netfilter.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigE3CE79644C4D0FA4C8675847
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

I only want to know how iptables uses this option. For example=20
--tpc-flags SYN,ACK,RST SYN  how is it then used? Am I right that the=20
flags SYN,ACK,RST are inspected and only the SYN flag is allowed to be=20
set? Or is it so that SYN,ACK,RST are inspected and the SYN flag must be=20
set but the other are optional so that all can be set but only SYN has=20
to be set? I=B4m a little confused :). And another question what flags=20
cobos are allowed/not allowed. I only know about a few so SYN,RST set is=20
an illegal set also SYN,FIN. Or SYN,ACK when initiating a connection.

Thank=B4s in advance for replies.

--=20

PGP-ID 0xF8EAF138

--------------enigE3CE79644C4D0FA4C8675847
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (MingW32)

iQIVAwUBQa+SWiXe0Lt4Z4FpAQEIkg/7BiXEjccq1EPdXY+G2KT2SlBSK5E5guEw
Gl9H/5ShaMFbRubNx3rxHA3aLtqYaOtiYHeS6IVI9XdfFASDKgUtXUCRrU6q7BJM
t05gIPuAEtSBN3vr5wDVVoxnUjeK0JA51GjWiHOAuUCpICvVk1PFKPgbg9Pe+Ot6
seItdxfSog2RrS1rLJNMJd4RzQ3+z/uivWRpKPsIp8tt+Yj4T0ysgu4pwKPKNyzm
CTQTFG37PZCUiZYJAMkEFD6ZrOLYnfU/EBKH7fu12xsaLChZmBuf1b9wV11hTeLW
VPZKK6BI5jnufjx2MlvBmDha/rg1Fo8bxu+w6C4+frWQwM3MQFqKzQXf1CvR+bd8
RGVg46+duKJVqlrAAVgdDWhpHeVLZe2u7Dchmu2I9W+XHoY2YmCgK5K/Jk15NKUK
KK8h09v6vPhrNWSnYi8+Q8JwQCQc1J45Cr69yYRLcpMGMgRl4CMtCc2H2y7vpiDQ
14RCfV5tFJ+PZLFoY6m9fn8vCN64TW9PpjjKl/BDPFn9IWQgLkgdgClRVLa3nH2N
1RzKUXv4QyEHXxOv8Xpqe//KdnKdB9B5vfgbYHLJQhm4KvuCjfKaHmn7Yvkom7Ai
Mp5jedWla7RMd+ylt0h+C/sqqx0wkql4zOfsTddPFA6wY31n9idHuXigp69cEyNJ
+/VXdjO4LWg=
=om81
-----END PGP SIGNATURE-----

--------------enigE3CE79644C4D0FA4C8675847--


