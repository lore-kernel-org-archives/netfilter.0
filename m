From: Jason Opperisano <opie@817west.com>
Subject: Re: DNS and NAT
Date: Mon, 11 Jul 2005 16:44:21 -0400
Message-ID: <20050711204421.GA17661@bender.817west.com>
References: <20050711194113.GA17435@bender.817west.com>
	<BAY17-F385E7ADF96986B0821571980DC0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY17-F385E7ADF96986B0821571980DC0@phx.gbl>
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

On Mon, Jul 11, 2005 at 01:33:34PM -0700, Suzana Lojic-Skoric wrote:
> OK, thanks I was not sure what is the proper behavior regarding iptables 
> and DNS.
> 
> If answer is not translated then how do I get DNS to work with two way NAT?
> My internal network does not understand any of the ip addresses that belong 
> to outside. So if the request for a page that is sent from internal network 
> comes back from outside with an answer (ip address) that is not getting 
> translated then I can't resolve the page since my internal network doesn't 
> understand it and can't route to it.
> Is there a way around this problem? How do I get DNS to work in the type of 
> environment I described?

with what is called "split DNS."  essentially:  requests from the
internal network get internal IP's as responses, requests from the
outside networks get external IP's as responses.  like i said in my
first reply; with BIND, this is accomplished through the use of "views."
i am not familiar with how other DNS servers handle this.

a more complete explanation of BIND views and an example of using views
for split DNS can be found at:

  http://www.zytrax.com/books/dns/ch7/view.html

-j

--
"Chris: Dad, what's the blowhole for?
 Peter: I'll tell you what it's not for. And when I do, you'll
 understand why I can never go back to Sea World."
        --Family Guy

