From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Multiple IPSEC VPNs through a firewall based on 2.4.2X kernel
Date: Thu, 26 Aug 2004 07:14:39 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <412DF04F.4030904@shorewall.net>
References: <09D3F703EF3B0A4CBE28449EA9F3D32069F456@nicta-atp-mail.in.nicta.com.au>	<1093339912.2050.208.camel@localhost>	<20040826091328.GD18545@arkena.dk>
	<1093516765.2021.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1093516765.2021.8.camel@localhost>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: Thomas Kirk <thomas@arkena.com>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

John A. Sullivan III wrote:

|
| I do like the way in which *swan uses a separate interface for IPSec
| traffic.  This makes it simple to identify the VPN traffic in iptables
| although it is not impossible to do so with the kernel IPSec.
|
|

The 'policy' match feature in Patch-O-Matic allows you to differentiate
the VPN traffic. You also need to install the ipsec-netfilter patches to
ensure that VPN traffic is passed properly through the various netfilter
builtin chains.

- -Tom
- --
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net
PGP Public Key   \ https://lists.shorewall.net/teastep.pgp.key
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFBLfBPO/MAbZfjDLIRAgTIAKCUoKABy8qboj/YdNpgQy7zOrH8zwCePHKX
qUwyxq6xUNPGSaI2TGKGW0U=
=6vBN
-----END PGP SIGNATURE-----

