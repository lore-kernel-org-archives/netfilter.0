From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: server in DMZ
Date: Thu, 2 Sep 2004 15:04:05 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040902190405.GA4531@tranquility.scriptkitchen.com>
References: <20040902025038.GA10835@tranquility.scriptkitchen.com>
	<1094094296.1824.96.camel@wolfpack.ljm.dom>
	<20040902031755.GA11485@tranquility.scriptkitchen.com>
	<1094095481.1824.102.camel@wolfpack.ljm.dom>
	<20040902035116.GA12345@tranquility.scriptkitchen.com>
	<1094097295.2037.161.camel@localhost>
	<20040902040821.GA12641@tranquility.scriptkitchen.com>
	<1094130804.2573.9.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1094130804.2573.9.camel@wolfpack.ljm.dom>
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

On Thu, Sep 02, 2004 at 09:13:25AM -0400, Jason Opperisano wrote:
> i think there's some confusion here...there are three rules involved in
> this scenario:

Yes, I already have the 3 rules. The only thing I am worrying about 
is how do I let my internal LAN users access the DMZ machine using
its public IP if I use the 3 rules given by you below. The below rules
will effectively block all traffic except from 1.2.3.4 and my LAN users
are on 192.168.x.x series and using squid as their proxy.
(squid machine is the gateway/firewall machine itself)
-Payal

> 
> (1) NAT rule that maps port 80 on the outside to port 80 on your DMZ
> server:
> 
>   -A PREROUTING -d 5.6.7.8 -p tcp -m tcp --dport 80 \
>     -j DNAT --to-destination 10.10.10.3
> 
> (2) FILTER rule that allows external access to server in DMZ from client
> IP:
> 
>   -A FORWARD -p tcp -s 1.2.3.4 -d 10.10.10.3 --dport 80 -j ACCEPT
> 
> (3) FILTER rule that allows squid proxy running directly on your
> firewall to fetch content from server in DMZ:
> 
>   -A OUTPUT -p tcp -d 10.10.10.3 --dport 80 -j ACCEPT
> 
> remember:  packets passing through the firewall are filtered by FORWARD,
> packets coming from the firewall are filtered by OUTPUT.
> 
> -j
> 
> -- 
> Jason Opperisano <opie@817west.com>
> 
> 

