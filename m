From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: server in DMZ
Date: Wed, 1 Sep 2004 23:51:16 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040902035116.GA12345@tranquility.scriptkitchen.com>
References: <20040902025038.GA10835@tranquility.scriptkitchen.com>
	<1094094296.1824.96.camel@wolfpack.ljm.dom>
	<20040902031755.GA11485@tranquility.scriptkitchen.com>
	<1094095481.1824.102.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1094095481.1824.102.camel@wolfpack.ljm.dom>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Wed, Sep 01, 2004 at 11:24:41PM -0400, Jason Opperisano wrote:
> i can simplify it to:
> 
>   -A FORWARD -p tcp -s 1.2.3.4 -d 10.10.10.3 --dport 80 -j ACCEPT

Ok easy enough I guess :)

> > it will block access from my local LAN also via. the squid proxy and yes 
> > the gateway (squid proxy) machine does have 3 cards.
> 
> yes--you're probably right that it would break access from the local LAN
> in your current configuration

So, what do I do for such a case?

-Payal

