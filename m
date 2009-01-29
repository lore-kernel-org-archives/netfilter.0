From: Thomas Jacob <jacob@internet24.de>
Subject: Re: SMP load balancing of softirqs
Date: Thu, 29 Jan 2009 13:06:04 +0100
Message-ID: <1233230764.8230.8.camel@enterprise.ims-firmen.de>
References: <49817DD4.1010402@redpill-linpro.com>
	 <1233226181.13705.24.camel@enterprise.ims-firmen.de>
	 <498191AD.7010302@redpill-linpro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <498191AD.7010302@redpill-linpro.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tore Anderson <tore.anderson@redpill-linpro.com>
Cc: netfilter@vger.kernel.org

On Thu, 2009-01-29 at 12:23 +0100, Tore Anderson wrote:
> * Thomas Jacob
> 
> > Some newer NICs (some of Intel's for instance) support several packet
> > queues to make it possible to deal with just this problem.
> > 
> > Check out http://lwn.net/Articles/289137/ for a start...
> 
> Interesting link, thanks!   However, I was under the impression that the
> problem is incoming (RX) frames, that causes an interrupt to be raised
> on a certain CPU (core) which in turn causes the frame to be processed
> by that particular CPU by the NET_RX softirq handler.

Correct... maybe this info isn't quite up to date...

> The multiqueue patch seem to be about being able to submit outgoing (TX)
> frames to multiple hardware queues.  So I don't think it will make much
> of a difference for me?

Don't know about the current state of general Linux driver support for
this, but the Intel hardware also supports multiple RX queues:

http://www.intel.com/network/connectivity/resources/technologies/10_gigabit_ethernet.htm


and their current ixgbe driver docs say:


RSS - Receive Side Scaling (or multiple queues for receives)
------------------------------------------------------------
Valid Range: 0 - 16
0 = disables RSS
1 = enables RSS and sets the descriptor queue count to 16 or the number
of
    online cpus, whichever is less.
2-16 = enables RSS, with 2-16 queues
Default Value: 1
RSS also effects the number of transmit queues allocated on 2.6.23 and
newer kernels with CONFIG_NETDEVICES_MULTIQUEUE set in the
kernel .config file.
CONFIG_NETDEVICES_MULTIQUEUE only exists from 2.6.23 to 2.6.26.  Other
options
enable multiqueue in 2.6.27 and newer kernels.


MQ - Multi Queue
----------------
Valid Range: 0, 1
0 = Disables Multiple Queue support
1 = Enabled Multiple Queue support (a prerequisite for RSS)
Default Value: 1








