From: Jason Opperisano <opie@817west.com>
Subject: Re: Port-forwarding + collisions
Date: Thu, 24 Feb 2005 08:16:17 -0500
Message-ID: <1109250977.7583.3.camel@hubcap.ljm.dom>
References: <421EA02A.3030606@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <421EA02A.3030606@wildcash.com>
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

On Thu, 2005-02-24 at 22:48, Rudi Starcevic wrote:
> Hi,
> 
> I'm still working on why I have poor performance and have found some 
> data I need to check as I'm not that familiar.
> 
> Below I have the output from ifconfig.
> eth0 is my Internet NIC with eth1 my internal 192.168.0.x network.
> 
> On my eth0 NIC we can see there is 0 collisions
> 
> On eth1 we can see collisions:6810362

i would go out on a limb and say that's your problem.  how's about
tcpdumping eth1 on the linux machine and see what's really going on on
the wire?

i would also point back to the possibility that the internal switch is
horribly misconfigured.

-j

--
"I bet Einstein turned himself all sorts of colors before he invented
 the light bulb."
	--The Simpsons


