From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: promiscuous mode w/ hook
Date: Fri, 22 Oct 2004 09:44:54 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41791CE6.1000400@pbl.ca>
References: <1098393242.b373a500rgopaul@umd.edu> <41791146.8000208@pbl.ca>
	<20041022141152.GF21006@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041022141152.GF21006@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Nick Drage wrote:
> I *think* you're missing what Richard is trying to do.  I'm presuming
> that all packets picked up by the ethernet inferface in promiscuous
> mode, so irrespective of whether they're meant for the host or not,
> should be sent to the prerouting table.
> 
> I would be surprised if this can be done without a great deal of hacking
> around... but most interesting of all, why do you want to do this
> Richard?

Yup, that would make sense.  I too don't see any simple way how to do 
it.  Maybe by creating virtual interface (such as tun or tap, depending 
on the Richards needs) and feeding the packet into it from userspace.

The packet would go through all Netfilter chains, and kernel would do 
the routing.  Both Netfilter and routing parts of kernel will see this 
packet as comming from tun/tap device (not from original physical 
network device).  It is quite possible that the packet will be routed 
back onto the physical interface it was received from (creating a loop 
and causing havoc on the network, unless userspace application and 
Netfilter rules are very carefully crafted to prevent this).  One way of 
avoiding this would be to use firewall marks, so that such packets can 
be identified later on by remaining chains and routing parts of the 
kernel.  However, still, a single typo could bring Richard's network down.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

