From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Can't compile 1.2.11 because of dstlimit?
Date: Mon, 12 Jul 2004 11:51:00 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0407121140340.24191-100000@blackhole.kfki.hu>
References: <40EEEC1F.7090201@fssi-ca.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40EEEC1F.7090201@fssi-ca.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob McLaren <BobMcLaren@fssi-ca.com>
Cc: netfilter@lists.netfilter.org

Hi Bob,

On Fri, 9 Jul 2004, Bob McLaren wrote:

> I noticed that the ipt_dstlimit.h in my iptables source tree did not
> match the ipt_dstlimit.h in my kernel source tree.
> The one in my kernel source tree does not define a "cfg" struct.  Which
> would explain the error I'm getting, but I still don't understand what I
> need to do to resolve this.
>
> Why would both source trees have ipt_dstlimit.h files?

No official kernel sources contain the ipt_dstlimit.h file.

The header file was added to the iptables source as forward-compatibility
until the dstlimit feature is submitted to the kernel.

> Why would my 2.4.20 kernel source tree have an outdated ipt_dstlimit.h file?

That's due to the RedHat policy on how to add and maintain features, which
hasn't yet been submitted into the official kernel.

> Can I just move my RedHat 7.3 box from 2.4.20 -> 2.6.7 without worry of
> bugs/issues?  I don't know how stable that new kernel is.

If you worry about the 2.6 kernel tree, you are free to use 2.4 - except
that use a standard kernel source release from kernel.org instead of a
vendor-specific one.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


