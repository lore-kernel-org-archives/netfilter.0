From: Andreas Bourges <andy-lists@bourges.de>
Subject: ulogd2 / IPFIX
Date: Wed, 11 Mar 2009 09:47:05 +0100
Message-ID: <200903110947.10044.andy-lists@bourges.de>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

..I just compiled ulogd-2.0.0.beta3 and tried to figure out if IPFIX support 
is already included (as mentioned on the web). Unluckily I couldn't find any 
documentation on this topic.

Is IPFIX export (udp is sufficient) currently supported? If yes - can someone 
point me to a piece of documentation?

What I currently get:

root@hal:/usr/local/sbin# ./ulogd --info ../lib/ulogd/ulogd_output_IPFIX.so
Wed Mar 11 09:45:34 2009 <7> ulogd.c:599 load_plugin: 
'../lib/ulogd/ulogd_output_IPFIX.so': ../lib/ulogd/ulogd_output_IPFIX.so: 
undefined symbol: list_add
root@hal:/usr/local/sbin#


?? seems to be broken?


thanks and regards,

Andy

P.S.: I'm currently not subscribed to the list - so if replying please CC the 
above address...

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm3eooACgkQRrny/uOBVy7NuQCfduDU6EsGyLR3W/RlgIIB5+jK
wK8An2TZCgYAh634V5q2e4WCV+MjSXGP
=bIjz
-----END PGP SIGNATURE-----
