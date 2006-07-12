From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: "stand-alone" web server
Date: Wed, 12 Jul 2006 16:33:11 +0200 (CEST)
Message-ID: <20223.5692916021$1152791445@news.gmane.org>
References: <c39d9d00714b2.714b2c39d9d00@southeast.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c39d9d00714b2.714b2c39d9d00@southeast.rr.com>
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
To: KSCOTT9@triad.rr.com
Cc: netfilter@lists.netfilter.org

<citaat van="KSCOTT9@triad.rr.com">
> I am trying to set up a "stand-alone" internet lab environment where my
> web server will be on the internet side of a router serving up a
> training website. The clients will only be able to access those web
> pages, not the "Real" internet. It would best if users were routed to
> that web page regardless of whatever internet address they entered
> (except for server management screens). I'm thinking the following:
>
> Requested website //  Destination page served up
> cnn.com           //    myserver/index.html
> whatever.com      //    myserver/index.html
> myserver:8081     //    myserver/management.html
> cnn.com:8081      //    myserver/management.html
>
> I'm think maybe appropriate entry(s) in iptables will do this but I am
> not quite sure how to proceed. I think I need something like:
>
> iptables -A PREROUTING  -p tcp -dport 80 -j REDIRECT --to-ports 80
>   # web server
> iptables -A PREROUTING  -p tcp -dport 8081 -j REDIRECT --to-ports 8081
>   # mgmt server
> The two server need to be configured to answer on those ports

Correct if the webserver is on the same machine as your router. Otherwise
you need to DNAT.

> or  maybe
> # let only appweb answer normal port 80 traffic
>  iptables -A INPUT -p tcp --dport 80 ! --uid-owner appweb -j REJECT
> --reject -with -tcp-reset

Not sure what you are tring to do here, but it won't work.

HTH,
M4


