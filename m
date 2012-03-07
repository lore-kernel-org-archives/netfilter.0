From: jonetsu <jonetsu@teksavvy.com>
Subject: Re: ICMP packets seeping through a DROP policy - security concern
Date: Tue, 6 Mar 2012 20:09:25 -0500
Message-ID: <20120306200925.100b9dd4@mistral.stie>
References: <20120304172506.2e79468a@mistral.stie>
	<jj35fo$t1p$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <jj35fo$t1p$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, 05 Mar 2012 19:51:17 +0000,
Kerin Millar <kerframil@gmail.com> wrote :

> In that case, it's the FORWARD chain that matters. The behaviour of 
> kernel 3.0.0 seems correct;

Yes, but there are two different behaviours with the same rules.  One
behaviour when no conntrack module is loaded that specifies this ICMP
timeout, and one behaviour when it is loaded.

Same test as before:

1) Fresh reboot, no nf modules loaded

# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_icmp_timeout
No such file or directory

# lsmod
(no nf conntrack module loaded - no nf module for that matter)

-> ICMP pings stop immediately when the 3 rules are applied

-> nf conntrack modules are now loaded:

 nf_conntrack_ipv4       9995  1 
 nf_defrag_ipv4           879  1 nf_conntrack_ipv4
 xt_state                 859  1 
 nf_conntrack           47425  2 nf_conntrack_ipv4,xt_state


2)  Flush all rules, re-test, above modules already loaded

# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_icmp_timeout
30

-> ICMP pings continues

As observed, the nf conntrack modules are loaded automatically.  But
at least one value (in this case the ICMP conntrack timeout - maybe
there are others) is not taken into account when the rules are
established in this use case.

But, if the modules are previously loaded, then the values are taken
into account.  There seems to be something not right with this.
Shouldn't any module parameter be taken into account when they are
automatically loaded ?  Here we see that the ICMP param is not taken
into account in the first test - can there be any other parameters
like that ?

It can also question the automatic loading of modules.  Either they
are automatically loaded and all params taken into account, or admins
have to know to load the required modules manually before installing
any rules on a freshly rebooted unit (either by script or by
explicitly loading the needed modules at boot).

Can you confirm that this behaviour is what is intended, or is a bug ?

And let me know if the tests are not right.  It'd be appreciated.

As a side note, as shown previously, this observance of the ICMP
conntrack timeout was absent in kernel 2.6.26, module loaded or not,
so this aspect has changed.  I agree that by principle, if a timeout
is specified, then it should be observed.  Which is now the case in
the latest kernels ... that is, if the module is manually and
previously loaded before applying rules only.

Thanks for any comments/suggestions.

