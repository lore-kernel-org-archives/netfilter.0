From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: blocking by domain
Date: Sun, 13 Jun 2004 07:26:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087125996.2011.6.camel@grendel>
References: <200406122127.i5CLR0bJ009276@ylpvm15.prodigy.net>
	 <1087115340.1891.2.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1087115340.1891.2.camel@anduril.intranet.cartel-securite.net>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sun, 2004-06-13 at 04:29, Cedric Blancher wrote:
>
> Moreover, I
> think it would generate too much latency if you had to check DNS for
> packets at firewall level.

Not to mention the accuracy is pretty poor. Say I'm fubar.com and you
have a rule blocking traffic from my domain. I can either:

1) Not create a PTR record for my IP
2) Create a PTR calling myself www.microsoft.com or similar

Both methods will defeat a domain based filter. So blocking at an IP
level is faster and more accurate. Best bet is to just do a few whois
queries to identify the IP range for the domain and block accordingly. 

HTH,
Chris



