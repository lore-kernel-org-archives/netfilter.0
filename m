From: Florian Boelstler <euphoria@web.de>
Subject: Re: Can I add a module to a prebuilt kernel?
Date: Thu, 03 Jun 2004 00:13:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40BE50F4.7040608@web.de>
References: <20040602073846.GO18797@wellnow.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040602073846.GO18797@wellnow.com>
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

Jeff Gordon wrote:

>> I'm running a RH ES 3 system, and it appears _support_ for ipt_recent
>> is included in the kernel but libipt_recent.so is nowhere to be found.
>> Kernel source for the prebuilt kernel in the distribution is available.


In general, if a kernel feature is built into the kernel there is no
appropriate module file. Because the functionality is in the kernel.



>> Is there a simple way to build ipt_recent from source and have it
>> function with this kernel, without compiling a kernel from scratch?


I never tried it, but if you got an appropriate kernel config for your
running kernel you could start by "make modules && make modules_install"
(regarding 2.4.x series)

This only works of course if
- - you just miss the module file
- - it is _not_ build into the kernel
- - and your kernel is prepared to load that feature through a module

Good luck,

  Florian


- --
Public PGP key is available on common key servers.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Debian - http://enigmail.mozdev.org

iD8DBQFAvlDzwT2gPfZm6tURAi53AJ49iNNxVbwpHYvnKDj95T3XcW8PTgCeI4oJ
o+djvtT7/l+eAfDttdl4JvQ=
=OXnQ
-----END PGP SIGNATURE-----

