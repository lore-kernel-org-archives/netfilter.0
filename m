From: Florian Boelstler <euphoria@web.de>
Subject: Handling incoming DCC session
Date: Wed, 02 Jun 2004 00:55:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40BD097B.60709@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

a long time ago someone posted a patch for 2.4.18 kernels [1], which
allowed incoming DCCs get caught by a default 'related' rule.

As far as I know this patch wasn't applied by the module maintainer.
Unfortunately the sources have changed in the meantime and the patch
doesn't work anymore.

I was trying to adapt the patch to kernel 2.6.5. But I don't have enough
knowledge to successfully modife it.

Is there anybody out there who owns a patch for 2.6.x series?

Thanks for your help!

  Florian


[1]
http://lists.netfilter.org/pipermail/netfilter-devel/2002-July/008665.html



- --
Public PGP key is available on common key servers.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Debian - http://enigmail.mozdev.org

iD8DBQFAvQl7wT2gPfZm6tURAv2eAKCyXR+3FBzZX4qlm8em5EiJfBCthACeIOYI
N2YuqzKk0chg8VAanrTbp9g=
=JXtM
-----END PGP SIGNATURE-----

