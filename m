From: Cyber Dog <cyberdog3k@gmail.com>
Subject: Problem with policy match extension...
Date: Sat, 29 Oct 2005 00:16:14 -0400
Message-ID: <cbb8f04c0510282116y58f7001dg17eccab80815a176@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I'm really hoping this isn't a stupid question, but I feel like it
will be.  I've been using the Shorewall program to configure iptables
firewalls for various purposes.  I have a problem where I can run
ipsec no problem until I add ip compression, at which point the
firewall is dropping the packets as "protocol 0."  Tom, creator of
shorewall, strongly recommends patching the kernel with the ipsec and
policy match patches when using ipsec, so I figured I would try that
first before I start complaining about my ipcomp problem.

I'm running a custom Linux kernel, using 2.6.14 as of yesterday. I'm
also running the standard iptables 1.3.3. I downloaded today's
patch-o-matic-ng and unzipped, and did runme.  I selected y for the
policy match patch and no others to test the water.  It applied
without error so I went into my kernel config and selected the new
option and recompiled.  The kernel module seems to have been a success
as I now have the ipt_policy module.  Now the problem:

I can't get the policy extension to compile into iptables.  My
iptables source has libipt_policy.c and libipt_policy.man in the
extensions directory.  I do a make clean && make, but I see no
reference to the policy extension being compiled, and there are no new
files generated.  Furthermore doing iptables -m policy --help produces
Couldn't load match `policy'.

I checked the recent mailing list archives and the documentation and I
didn't see further instructions for extensions.  What am I missing?

Thanks...

