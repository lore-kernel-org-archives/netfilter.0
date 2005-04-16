From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: packet-based load-balanced stateless iptables firewall
Date: Sat, 16 Apr 2005 14:09:03 -0400
Message-ID: <200504161409.03663.Alistair@nerdnet.ca>
References: <425fd35c.4b2f42c3.66d2.ffff9c96SMTPIN_ADDED@mx.gmail.com>
	<9927912d05041611031e3c93f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d05041611031e3c93f@mail.gmail.com>
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

On April 16, 2005 02:03 pm, Visham Ramsurrun wrote:
> Hi to all,
>
> I would like to know how to build a packet-based load-balanced
> stateless iptables firewall.

	If your talking about a load-balanced firewall -- there are some odd things 
you need to check out.....

>
> I came across this:
>
> In IPtables, load balancing is done by specifying multiple IP
> addresses in a DNAT rule. For example:
>
> iptables -t nat -A PREROUTING -i eth0 -o eth1 -d 192.0.34.72 -j DNAT
> --to-destination 192.168.1.2-192.168.1.4

	This rule 'load balances' per connection from the firewall to the destination 
host.  
	Has nowt to do with a load balanced firewall.
>
> Is the load balancing done in a packet-based manner? Does it use the
> round-robin algorithm for it?

	Per connection round robin.
>
> Any help will be very much appreciated..
>
> Regards,
> Visham

