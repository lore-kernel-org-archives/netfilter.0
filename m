From: Alexis <alexis@attla.net.ar>
Subject: Re: Mail Through Firewall
Date: Wed, 18 Feb 2004 14:27:23 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077125243.1595.2.camel@pepelui.baicom>
References: <012201c3f627$18eabbe0$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <012201c3f627$18eabbe0$49caa8c0@caris.priv>
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
To: Peter Marshall <peter.marshall@caris.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

what is the netmask of your network? it sounds like the dest address is
a broadcast address


On Wed, 2004-02-18 at 10:57, Peter Marshall wrote:
> Hey, I am sure this question is going to seem trivial to everyone here ..
> but I will ask anyway.
> I want to get outlook to work on my inside box .... I have it all set up
> correctly, but it can't find the pop / smtp servers ...
> 
> I ran ethereal to see what the problem was ...
> When I try to connect I get 3 requests
> source 10.0.0.2
> dest 10.0.0.255
> Protocol NBNS
> source and dest ports: 137
> 
> and I get no reply's ... ( well, I get an arp request after the 3rd try ...)
> Any ideas how to get this working ?
> 
> BTW, I am using IPTables
> 
> Thanks
> Peter Marshall
-- 
Alexis <alexis@attla.net.ar>


