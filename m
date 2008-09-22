From: "Kristopher L. Bachtal" <kbachtal@gmail.com>
Subject: IPSEC VPN Pass-Through/Nat-T Help Needed
Date: Mon, 22 Sep 2008 16:10:13 -0400
Message-ID: <48D7FBA5.70402@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

I have a Fedora Core 5 machine running kernel 2.6.20-1.2320 and
iptables/netfilter acting as a gateway/Nat for a private network to the
internet. I have several client machines (aprox. 10, Running Windows XP)
that are behind this router that need to create individual IPSec VPN
(Cisco IPSec Software Cleint)connections over the internet to a Cisco
VPN Concentrator (Diagram Below). I can only seem to get one client at a
time to work. If I try to start a second VPN connection from another
machine it connects to the VPN Concentrator but will not carry any data.
(i.e. Cant ping, traceroute, etc.) I'm thinking I need some type of
connection tracking kernel module for IPSec Connections (like
nf_conntrack_ftp but for Ipsec instead of FTP) but I cant find any
reference to one in the documentation or google searches that I have
done. Any help would be greatly appreciated.

Clients(10) -->	Gateway/Nat	--->	Internet  --->	Remote Network
(Windows XP)	(Fedora Core 5)				(Cisco VPN Box)
Private IP	Private IP / Public IP			Public IP		

Thank you,
Kristopher L. Bachtal
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFI1/ulG8acbTj+cSARAkkMAJwPUYm28gw5pSYogD6tZ+FZhjVVDACghRos
V4paWyVloiFRbSBBjFfT/A8=
=TNUn
-----END PGP SIGNATURE-----
