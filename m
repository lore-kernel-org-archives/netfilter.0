From: Jason Opperisano <opie@817west.com>
Subject: Re: server in DMZ
Date: Thu, 02 Sep 2004 15:17:50 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094152669.1994.20.camel@wolfpack.ljm.dom>
References: <20040902025038.GA10835@tranquility.scriptkitchen.com>
	<1094094296.1824.96.camel@wolfpack.ljm.dom>
	<20040902031755.GA11485@tranquility.scriptkitchen.com>
	<1094095481.1824.102.camel@wolfpack.ljm.dom>
	<20040902035116.GA12345@tranquility.scriptkitchen.com>
	<1094097295.2037.161.camel@localhost>
	<20040902040821.GA12641@tranquility.scriptkitchen.com>
	<1094130804.2573.9.camel@wolfpack.ljm.dom>
	<20040902190405.GA4531@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040902190405.GA4531@tranquility.scriptkitchen.com>
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
To: netfilter@lists.netfilter.org

On Thu, 2004-09-02 at 15:04, Payal Rathod wrote:
> On Thu, Sep 02, 2004 at 09:13:25AM -0400, Jason Opperisano wrote:
> > i think there's some confusion here...there are three rules involved in
> > this scenario:
> 
> Yes, I already have the 3 rules. The only thing I am worrying about 
> is how do I let my internal LAN users access the DMZ machine using
> its public IP if I use the 3 rules given by you below. The below rules
> will effectively block all traffic except from 1.2.3.4 

no.  please review the differences between INPUT, FORWARD, and OUTPUT.

http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSINGOFTABLES

the request from your LAN users only traverses the INPUT chain for the
request to the squid proxy.

the request from the squid proxy then traverses the OUTPUT chain to
fetch content from the web server.

LAN -> SQUID -> Web Server *never* enters to FORWARD chain.

the rule you are worrying about is in the FORWARD chain.

-j

-- 
Jason Opperisano <opie@817west.com>


