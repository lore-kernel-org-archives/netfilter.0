From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Different routes for different src addresses
Date: Wed, 7 Jul 2004 14:10:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407071410.02752.Antony@Soft-Solutions.co.uk>
References: <20040707120502.GA23120@nihil>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040707120502.GA23120@nihil>
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

On Wednesday 07 July 2004 1:05 pm, Alpt wrote:

> Hi all,
> is it possible to create a route for a single src address?
> For example these are some routes I'd like to use:
>
> 1) "All the pkts coming from hostA with dst=hostX are routed to eth1".
> 2) "All the pkts coming from hostB with dst=hostT are routed to eth0"
> /*Normal routes start here*/
> 3) "All the pkts (that are not pkts of type 1) and 2)) with dst=hostX
> are routed to eth3"
> 4) "All the pkts (that are not pkts of type 1) and 2)) with dst=hostU
> are routed to eth2"
> 5) And so on...
>
> I mean _routing_, not natting. If I nat the pkts their destination will
> change and I need to keep it intact.

As you say, you mean _routing_, therefore this a routing question, not a 
netfilter question.

You need iproute2 (see http://lartc.org)

Regards,

Antony


-- 
"It is easy to be blinded to the essential uselessness of them by the sense of 
achievement you get from getting them to work at all. In other words - and 
this is the rock solid principle on which the whole of the Corporation's 
Galaxy-wide success is founded - their fundamental design flaws are 
completely hidden by their superficial design flaws."

 - Douglas Noel Adams

                                                     Please reply to the list;
                                                           please don't CC me.


