From: "Victor Wren" <vwren@timension.com>
Subject: Re: AW: a NAT question
Date: Fri, 16 Jul 2004 12:39:13 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F7CC71.20447.7EDE11@localhost>
References: <7C9884991ADAE0479C14F10C858BCDF591E342@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20040716185022.GA20595@tranquility.scriptkitchen.com>
Content-description: Mail message body
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

> On Fri, Jul 16, 2004 at 11:43:05AM -0700, Daniel Chemko wrote:
> 
> > The setup of a Script-only setup isn't too hard. You have to abandon the
> > concept of ip aliases since netfilter dropped support for the concept.
> > You only deal with the root interface and ip addresses.
> 
> You mean the something like eth0:1 isn't supported? Do I have to
> learn the ip thing instead of ifconfig?
> For a while I would prefer ifconfig.

It's not as bad as all that, and it's really sound policy, If you think about 
it.  It's matching packets that come into a particular physical interface.  
It doesn't care what the ip address of that port is, or whether it has one 
address or twenty, so when you say "-i eth0" (or -o) just remember that 
you're also catching "eth0:56, eth0:fred, eth0:arf" etc.

I like this way of doing it.  Having the filter match aliases just mudies the 
water (and frankly, they'll all arp to the same ethernet mac address, so 
what's the point?)  If you really want to match on a particular address (or 
subnet), you can still do that with the "-d " switch.

Victor Wren


