From: Gary Thomas <gary@chez-thomas.org>
Subject: Re: [Fwd: PPTP in 2.4.20]
Date: 22 Dec 2003 05:52:03 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072097523.25353.1.camel@hermes>
References: <1072058922.1641.29.camel@hermes>
	 <20031222104912.GH5058@obroa-skai.de.gnumonks.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031222104912.GH5058@obroa-skai.de.gnumonks.org>
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
To: Harald Welte <laforge@netfilter.org>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>

On Mon, 2003-12-22 at 03:49, Harald Welte wrote:
> On Sun, Dec 21, 2003 at 07:08:43PM -0700, Gary Thomas wrote:
> > Harald,
> > 
> > I'm in a bit of a pickle here & need to get this working.  The 
> > mailing list has not come up with any ideas, so if you have any, 
> > I'd sure appreciate them.
> 
> Sorry, we've never ever had a single report about this error message.
> 
> It basically means that somebody else has already registered for the
> SO_GET_ORIGDST socket option.  I have no idea who else could be the
> culprit.  Maybe you have loaded (or statically linked into the kernel)
> one of the backwards compatibility modules for ipchains or ipfwadm?
> 

So, these modules are incompatible with "ipchains"?  I'm currently 
using a homebrew firewall based on ipchains, but if I have/need to,
I'll upgrade to one using iptables.

> Also, please make sure that the kernel and the modules are out of the
> same build, otherwise you might experience all kinds of inconsistencies
> 
> > Thanks.
> 
> > -- 
> > Gary Thomas <gary@chez-thomas.org>
> 
> Content-Description: Forwarded message - PPTP in 2.4.20
> > Subject: PPTP in 2.4.20
> > From: Gary Thomas <gary@chez-thomas.org>
> > To: netfilter@lists.netfilter.org
> > Organization: 
> > X-Spam-Score: -8.1 (--------)
> > List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
> > Date: 20 Dec 2003 08:32:45 -0700
> > X-Spam-Status: No, hits=-6.2 required=5.0
> > 	tests=AWL,BAYES_01,KNOWN_MAILING_LIST,USER_AGENT_XIMIAN version=2.55
> > X-Spam-Level: 
> > X-Spam-Checker-Version: SpamAssassin 2.55 (1.174.2.19-2003-05-19-exp)
> > 
> > I've tried to build kernel 2.4.20, using the patches applied
> > via patch-o-matic (thanks, Harald!)  However, I can't get the
> > PPTP modules to load.  In particular, when I try to load
> > 'ip_conntrack', I get these messages:
> > 
> > [root@hermes gthomas]# insmod ip_conntrack
> > Using /lib/modules/2.4.20-TEST/kernel/net/ipv4/netfilter/ip_conntrack.o
> > /lib/modules/2.4.20-TEST/kernel/net/ipv4/netfilter/ip_conntrack.o: init_module: Device or resource busy
> > [root@hermes gthomas]# tail /var/log/messages
> > Dec 20 07:34:31 hermes kernel: ip_conntrack version 2.1 (4094 buckets, 32752 max) - 312 bytes per conntrack
> > Dec 20 07:34:31 hermes kernel: Unable to register netfilter socket option
> > 
> > Of course, without this module loaded, I can't load any of the 
> > other [important for PPTP] ones.
> > 
> > Any help or ideas greatly appreciated.
> > 
> > -- 
> > Gary Thomas <gary@chez-thomas.org>
> > 
-- 
Gary Thomas <gary@chez-thomas.org>


