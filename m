From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: newbie struggling with p-o-m in kernel 2.6
Date: Sun, 14 Mar 2004 06:32:35 -0500
Sender: netfilter-admin-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Message-ID: <c31fsj$l7s$1@sea.gmane.org>
References: <MPG.1abbd219144e52d99896a5@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-admin-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
Errors-To: netfilter-admin-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
List-Help: <mailto:netfilter-request-wool9L35kiczKOhml7GhPuLxvTOCFHmI2yCS0tKOigE@public.gmane.org>
List-Post: <mailto:netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPuLxvTOCFHmIRj+87qQpzpCql8G6E966Ow@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPuLxvTOCFHmIFcjs2lY4wUfKtGCp0j7rLg@public.gmane.org>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org

Okay, I've figured out a couple of things.

> - I grabbed patch-o-matic-ng-20040302, and tried it.  But it won't apply
> the condition and time patches, because both of them are marked 'linux
> < 2.6.0'.

By deleting the line 'Requires: linux < 2.6.0' from the info files for these
two parches, I got pom-ng to apply both of them to kernel 2.6.3 with
complaint.  The kernel then built with no trouble, although the option help
texts weren't available in 'make xconfig'.  However I haven't tested the
modules yet.  But it seems that at least these two extensions are close to
ready for kernel 2.6.
 
> - Even though I try to run runme in batch mode, it always asks where my
> iptables source code is.  Looking through the script, there doesn't seem
> to be an environment variable to set for that.

Looking through the runme script again, I figured out that we have a new
option for specifying the kernel and iptables source paths:

--path $KERNEL_DIR:$IPTABLES_DIR

Of course this needs to be documented for the user.  And, I should be able
to set an environment variable IPTABLES_DIR just as I do KERNEL_DIR, in
order to avoid typing the directories on the command line each time.



