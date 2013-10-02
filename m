From: Husnu Demir <hdemir@metu.edu.tr>
Subject: ipset iface list
Date: Wed, 02 Oct 2013 09:12:13 +0300
Message-ID: <524BB93D.6040803@metu.edu.tr>
Reply-To: hdemir@metu.edu.tr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I tried to get an interface list with IPSET. Since there is no only
iface list, I tried to write like this and it works. Perhaps anybody
can use that.


ipset create IntList hash:net,iface family inet hashsize 1024 maxelem
65536
ipset add IntList 0.0.0.0/0,vlan1
ipset add IntList 0.0.0.0/0,eth2
ipset add IntList 0.0.0.0/0,vlan3


iptables -t raw -A PREROUTING \! -s 10.10.0.0/16 -m set --match-set
IntList dst,src -j SPOOFING

The key point is the 0.0.0.0/0.


Best regards,

Husnu Demir.
Network.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJSS7k9AAoJEISpBAM51qlEsxwIAKY9RSdzTeUQFs4eLP4eAmep
H+gu6m17Q+hj4DLg7sOH81QGlW4FVMi7MzV3P8pFb7wtW7UZxxB/0ARkzU10LgPx
srqmYr4SdNLi7a/nq3x5ZLc+FuY4bKUZh4Tvc2ZJFIMFHMGXAE12sn5w6di51wmE
sGR7Rdn/mn1ChCi96RJwJdyKChp7eTC/b2rchXyR4gGt2gwBYZKwmT/lkEw+/nDm
RnKt4z8k9hcFmjrTRXdTvUE79gB7bZgr+BMt6FPecrtxTGj2Xqsu70B02BCyPDEM
x7PtvVPULO4dMNhBId/OXAW/ZfuLrRqX1u3bCUifdDVYreKWgcD1wjPivsF66BE=
=UO+y
-----END PGP SIGNATURE-----
