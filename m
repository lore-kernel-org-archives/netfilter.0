From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Redirecting internal tcp connections
Date: Fri, 15 Apr 2005 15:17:26 -0500
Message-ID: <42602156.50403@riverviewtech.net>
References: <425FF61B.9090008@lanhelp.com.br>
	<1113587876.10134.5.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113587876.10134.5.camel@nostromo.bgsecm.com>
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
To: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

> You have to do this in the nat table and the prerouting or
> output chain, and you should use DNAT instead of REDIRECT,
> because REDIRECT is for packets with destination your own
> machine. So we have:
> 
> iptables -t nat -A PREROUTING -p tcp --dport 515 -j DNAT --to-
> destination remotehost.com:900

I would suggest that you add a destination match as well so that you don't blindly redirect traffic destend to any system's LPD port.  I.e. make your IPTables like look like this:

iptables -t nat -A PREROUTING -p tcp -d remotehost.com --dport 515 -j DNAT --to-destination remotehost.com:900



Grant. . . .

