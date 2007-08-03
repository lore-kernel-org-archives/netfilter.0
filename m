From: Gregory Carter <gcarter@aesgi.com>
Subject: Re: NAT on stateless firewall ?
Date: Thu, 02 Aug 2007 20:49:36 -0500
Message-ID: <46B289B0.5080104@aesgi.com>
References: <46B26400.7050504@andrei.myip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B26400.7050504@andrei.myip.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I think as long as you do not use an INPUT queue, leave it blank and 
make it default accept, you do not need to use state.

Anything requiring an INPUT target though needs state.

-gc

Florin Andrei wrote:
> I need to build a firewall in front of a cluster of HTTP servers. The 
> firewall has 2 interfaces, "inside" (facing the cluster) and "outside" 
> (facing the Internet).
> Each server has a private IP address, so the firewall must translate 
> each server address to a public address on the external interface (I 
> guess that's called 1:1 NAT, it's exactly what a PIX firewall would do 
> via a "static (inside,outside) foobar-out foobar-in netmask 
> 255.255.255.255" statement).
>
> Since HTTP is the only thing traversing the firewall, I don't really 
> need a stateful firewall. In fact, in order to build some redundancy 
> into the firewalling layer, a stateless firewall is even better: I 
> just build 2 or more stateless firewalls and only transfer the IP and 
> MAC if the primary fails - no need to transfer the state.
> Moreover, since the total bandwidth will be very high, that's one more 
> reason to not do stateful filtering (less work for the firewall).
>
> The problem is, NAT seems to imply stateful filtering. The moment I 
> start playing with the nat table, the ip_conntrack module gets loaded.
>
> Questions:
>
> Is there a way to do NAT on a true stateless firewall? (no conntrack 
> loaded)
>
> If the answer to the previous q is negative, can I just ignore 
> conntrack and build the filter and nat tables as if conntrack would 
> not exist? I'm trying to figure out if there's any interaction with 
> conntrack in this scenario, but I don't know netfilter well enough to 
> be 100% sure.
>


