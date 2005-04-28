From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: NAT to a client
Date: Thu, 28 Apr 2005 12:21:22 -0500
Message-ID: <42711B92.105@riverviewtech.net>
References: <652c9e655b89.655b89652c9e@vsnl.net>
	<20050428143538.GA29900@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050428143538.GA29900@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

> the source port of traffic destined to a squid proxy is not 80, it's
> 1024:65535...why do i *constantly* see this in rules sets?

Does Squid send out requests on behalf of it's clients from port 3128 to port 80 and thus have returning traffic from 80 to 3128?  I know this is not the situation where clients connect to Squid, but rather when Squid connects to the web servers.  Seeing as how this rule is running on eth1, the internal LAN interface, this is irrelevant.



Grant. . . .

