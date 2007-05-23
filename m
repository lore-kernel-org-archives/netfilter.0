From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridge Transparent Proxy
Date: Tue, 22 May 2007 19:25:56 -0500
Message-ID: <46538A14.608@riverviewtech.net>
References: <C2787F66.1C272%robert@leblancnet.us>	<465336C4.5060600@riverviewtech.net>	<46533842.9080404@plouf.fr.eu.org>	<46533B98.9030706@riverviewtech.net>
	<465369AF.2060107@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <465369AF.2060107@plouf.fr.eu.org>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 5/22/2007 5:07 PM, Pascal Hambourg wrote:
> Now I see. But wouldn't it be worth subnetting A.B.C.x ?

If you have the option, yes.  However, that is seldom an option, even 
less so with out the providers support.

Consider a cable modem / DSL install where you get 4 IP addresses, 
having nothing to do with subnets.  I.e. .62, .63, .64, and .65.  You 
can not do any viable subnetting with this.

Even if you can viably do subnetting, you have to have the provider 
configure the remaining IPs available via the IP facing them.

It has been my experience that it is much easier to do BRouting in these 
cases.

> Do you mean that ARP proxy would not be a good way ? Ok, I guess it 
> would disrupt IP broadcasts a bit...

I have never actually used ARP proxy, so I can't say for sure.  However 
when I have read about ARP proxying in the past, it never sat very well 
with me.  It always seemed like it solved part of the problem but caused 
others.

> Anyway NAT is evil. Don't use unless you can't avoid it.

I'll have to disagree with you on that statement.  Now if you amend it a 
bit, I can live with it.  "NATing in the wrong locations is evil."  NAT 
in and of its self is a good tool to use.  However it is not the end 
all, be all tool that some would like it to be.  NATing a private 
network out to a single IP on the internet for outbound internet access 
is very good.  If you want to start having some inbound internet access 
it is not as good for very long.



Grant. . . .

