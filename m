From: Martin Stricker <shugal@gmx.de>
Subject: Re: Can I add a module to a prebuilt kernel?
Date: Wed, 02 Jun 2004 23:04:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40BE40E2.F39FCB5F@gmx.de>
References: <20040602073846.GO18797@wellnow.com>
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

Jeff Gordon wrote:

> I'm running a RH ES 3 system, and it appears _support_ for ipt_recent
> is included in the kernel but libipt_recent.so is nowhere to be
> found. Kernel source for the prebuilt kernel in the distribution is
> available.
> 
> Is there a simple way to build ipt_recent from source and have it
> function with this kernel, without compiling a kernel from scratch?

Yes. You can use the module from another computer, given it was compiled
for the exactly same kernel version, using the same compiler and
compiler flags.

Usually, on a given system, all you have to do is make config or make
menuconfig, add the module you want as module (M), end the kernel
configuration, and do a make modules (maybe also a make modules install,
but maybe you would rather copy the module by hand and add it to the
modules.conf).

Best regards,
Martin Stricker
-- 
Homepage: http://www.martin-stricker.de/
Linux Migration Project: http://www.linux-migration.org/
Red Hat Linux 9 for low memory: http://www.rule-project.org/
Registered Linux user #210635: http://counter.li.org/

