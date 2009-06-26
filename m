From: Ramunas Vabolis <ramuva@openoffice.lt>
Subject: Re: raw table and NOTRACK target
Date: Fri, 26 Jun 2009 11:20:58 +0300
Message-ID: <20090626082058.GA15490@openoffice.lt>
References: <20090625130555.GB9856@openoffice.lt> <1246000121.3985.5.camel@casper.meteor.dp.ua> <20090626074317.GA11753@openoffice.lt> <4A447E89.7020700@snapgear.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A447E89.7020700@snapgear.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

* Philip Craig <philipc@snapgear.com> [2009-06-26 10:54]:
> Ramunas Vabolis wrote:
> > running lynx http://any.host.com from real.ip
> > 
> > running tcpdump on inner interface:
> > tcpdump -i ethlocal -n host real.ip and port 80 
> > 
> > does show connection attempts while 
> > tcpdump -i ethoutside -n host real.ip and port 80 
> > is silent.
> > 
> > iptables -t raw -vxnL shows that first rule is hit couple times, the
> > second rule is never hit.
> 
> Then the problem is not in the raw table.  Something else is dropping
> the first syn packet after it has been through the raw table.
> You should see an outgoing syn packet before you start worrying
> about the second rule being hit.
	That's why I'm asking for advice :) 
	iptables -n -L |grep DROP -> is empty. I'd paste entire iptables
output, but it is quite biggie (There are quite a lot of chains which do
nothing but ACCEPT packets - for iptables based traffic accounting
solution). I've flushed all FORWARD chain just in case, but it did not
had any influence as I've suspected. 

	What else can be done to pinpoint the problem?
