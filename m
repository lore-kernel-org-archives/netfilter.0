From: "Volkm@r" <plsdontreply@arcor.de>
Subject: Re: minimal iptables ruleset for laptop
Date: Wed, 25 May 2005 12:42:27 +0200
Message-ID: <d71kn9$lfi$1@sea.gmane.org>
References: <d6utcg$6hb$1@sea.gmane.org>
	<42930273.10208@hotpop.com>	<d6v69t$3sc$1@sea.gmane.org>
	<429442FC.8090700@hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429442FC.8090700@hotpop.com>
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

Georgi Alexandrov wrote:
> [...]
> About the ICMP - it's good (my opinion) to let at least those three icmp
> types so we have proper network functions.
> reference:  http://www.faqs.org/docs/iptables/icmptypes.html
> 
> About the logging - If you want for example to log all the auth requests
> (tcp/113) made to your machine, we will put the following rule above the
> -j REJECT one:
> 
> iptables -A INPUT -p tcp --syn --dport 113 -j LOG --log-prefix "Auth
> Request"
> iptables -A INPUT -p tcp --syn --dport 113 -j REJECT --reject-with
> tcp-reset
> 
Well, that's exactly what I needed.

> 
> This way we will have all auth requests logged and then rejected.
> You can examine the example rc.firewall script at
> iptables-tutorial.frozentux.net for some more logging examples.
> 
> regards,
> Georgi Alexandrov
> 
> 
Thanks for the references. I'm going to them more carefully.
-- 
Volkm@r


