From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: promiscuous mode w/ hook
Date: Fri, 22 Oct 2004 15:11:52 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041022141152.GF21006@metastasis.org.uk>
References: <1098393242.b373a500rgopaul@umd.edu> <41791146.8000208@pbl.ca>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41791146.8000208@pbl.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Oct 22, 2004 at 08:55:18AM -0500, Aleksandar Milivojevic wrote:
> Richard Gopaul wrote:

> >I'm trying to put my ethernet interface into promiscuous mode and
> >have all traffic sent to the netfilter prerouting hook.  I've read
> >documentation on line and in the source that says that traffic
> >doesn't make it to netfilter until after foreign promiscuous packets
> >are dropped though, which makes me think this will be a bit of a
> >challenge.  Any ideas?  
> 
> Either I'm missing what you want to do, or the question doesn't make
> any sense.  It doesn't matter if interface is in promiscuous mode or
> not.  If apropriate Netfilter modules are loaded, packets will end up
> in prerouting chain (unless something in kernel drops them earlier,
> such as rp_filter).

I *think* you're missing what Richard is trying to do.  I'm presuming
that all packets picked up by the ethernet inferface in promiscuous
mode, so irrespective of whether they're meant for the host or not,
should be sent to the prerouting table.

I would be surprised if this can be done without a great deal of hacking
around... but most interesting of all, why do you want to do this
Richard?

-- 
We are the Willing, led by the Unknowing,
Are doing the Impossible, for the Ungrateful.
We have done so much, for so long, with so little,
We are now qualified to do anything with nothing.

