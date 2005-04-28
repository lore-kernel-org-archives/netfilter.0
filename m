From: Jason Opperisano <opie@817west.com>
Subject: Re: NAT to a client
Date: Thu, 28 Apr 2005 13:38:38 -0400
Message-ID: <20050428173838.GA30382@bender.817west.com>
References: <652c9e655b89.655b89652c9e@vsnl.net>
	<20050428143538.GA29900@bender.817west.com>
	<42711B92.105@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42711B92.105@riverviewtech.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Apr 28, 2005 at 12:21:22PM -0500, Taylor, Grant wrote:
> >the source port of traffic destined to a squid proxy is not 80, it's
> >1024:65535...why do i *constantly* see this in rules sets?
> 
> Does Squid send out requests on behalf of it's clients from port 3128 to 
> port 80 and thus have returning traffic from 80 to 3128? 

heeeeeeeeeeeeeeell no.  squid proxy 101:

1)   client:$UNPRIV -> proxy:3128

2)                     proxy:$UNPRIV -> origin-server:80

where UNPRIV = 1024 - 65535

client connects to squid, squid connects to web server; two separate
unrelated connections (besides the fact that 1 inspires 2).  i
understand that the number 3128 falls within the range 1024 - 65535; and
if squid is configured to bind only to the internal interface, you'd
have a 1/64511 chance of seeing a squid server use sport = 3128 and
dport = 80 to fetch content from an origin web server, but it's not
likely enough to deserve a dedicated filter rule, IMHO.

-j

--
"Peter: Wh-Who are you?
 Death: I'm Callista Flockhart. Who do you think I am? I'm Death."
        --Family Guy

