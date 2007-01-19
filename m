From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: redirecting on a local machine
Date: Fri, 19 Jan 2007 19:47:47 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701191946210.18606@yvahk01.tjqt.qr>
References: <008101c73bf9$dc9d99c0$0700a8c0@stormbook>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <008101c73bf9$dc9d99c0$0700a8c0@stormbook>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: saspan <saspan@web.de>
Cc: netfilter@lists.netfilter.org


> A simple
>
> iptables -t -nat -A OUTPUT -m owner ! --owner-uid squid -p tcp --dport 80 -j
> REDIRECT --to-destination 3128
>
> doesn't seem to work, cause a browser would not be expecting a reply from a
> transparent proxy when waiting for replies to its requests.

So configure squid to actually act transparent. Or better, reject the 
traffic and make everyone actively use the proxy. It does not have as 
many caching caveats as transparent.
 

	-`J'
-- 

