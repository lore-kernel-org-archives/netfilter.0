From: Jason Opperisano <opie@817west.com>
Subject: Re: Questions on state
Date: Sun, 13 Mar 2005 20:42:15 -0500
Message-ID: <1110764535.19878.5.camel@hubcap.ljm.dom>
References: <200503131623.42711.jsimmons@goblin.punk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200503131623.42711.jsimmons@goblin.punk.net>
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

On Sun, 2005-03-13 at 19:23, Jeff Simmons wrote:
> Sorry to bother anyone, but I'm new to iptables, and I'm debugging a working 
> production machine, so I can't really test things too much. :-(
> 
> Is a connection ONLY added to the state table when the first packet matches a 
> rule that contains the --state NEW directive, or can it happen in some other 
> way?

connections begin getting added to the conntrack table as soon as the
ip_conntrack module is loaded.

> When --state INVALID is matched, is it done only on the source and destination 
> addresses and ports, or is something else also involved?

if the tcp_window_tracking patch is applied--sequence and acknowledgment
numbers are also examined.

> Are NAT 'states' available for examination anywhere, like 
> /proc/net/ip_conntrack?

yes.

-j

--
"Mr. Simpson, why are you here?
 Don't say revenge! Don't say revenge!
 Revenge?
 That's it! I'm outta here!"
	--The Simpsons


