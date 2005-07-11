From: Jason Opperisano <opie@817west.com>
Subject: Re: DNS and NAT
Date: Mon, 11 Jul 2005 15:41:13 -0400
Message-ID: <20050711194113.GA17435@bender.817west.com>
References: <BAY17-F36B44F4732DA14870599CE80DC0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY17-F36B44F4732DA14870599CE80DC0@phx.gbl>
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

On Mon, Jul 11, 2005 at 12:37:31PM -0700, Suzana Lojic-Skoric wrote:
> Does DNS work with iptables NAT or I need some kind of ALG to get DNS 
> answers translated?
> 
> I am using Mandrake Linux 10.0. I have two way NAT going on and I am trying 
> to get DNS requests through the NAT. I got FTP, HTTP and SMTP working 
> through the NAT, but DNS is not working properly, DNS answer is not getting 
> translated.

nor should it be.

> Source and Destination addresses in DNS message are properly 
> translated, but the actual answer (the ip address embedded in the message) 
> is not translated.

which is exactly how it's supposed to work.  how the $%#@ is iptables
supposed to know what to rewrite the answer to?

if you are using BIND, look into the functionality offered by "views."

-j

--
"Peter: You know, I oughta just give you some beer. Goes straight
 through you. 
 Stewie: Wonderful. And while we're at it, we can light up a doobie and
 watch porn. 
 Peter: Eh... yeah?"
        --Family Guy

