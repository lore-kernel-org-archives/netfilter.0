From: "Shaun T. Erickson" <ste@smxy.org>
Subject: Re: Need to replace a SonicWall firewall with an iptables firewall.
Date: Tue, 31 Aug 2004 09:47:36 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41348178.4080701@smxy.org>
References: <D5C9032B2B09C64EA2409D6214E91AC905130B@asimail2.alphanumeric.com>
Reply-To: ste@smxy.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC905130B@asimail2.alphanumeric.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Opperisano <Jopperisano@alphanumeric.com>
Cc: netfilter@lists.netfilter.org

>>I need internal hosts, and external hosts, to be able to connect to the
>>DMZ servers by their public DNS names. Connecting to
>>http://www.somedomain.com from either the inside or the outside, should
>>get you to the server in the DMZ. For testing purposes, we need to
>>access everything the same way as our customers.
> 
> 
> this statement implies you would want split-dns...
> 
> 
>>Not knowing what split-dns was, I googled it. If I understand it
>>correctly it seems that this is only needed when you use a single,
>>common domain for both internal and external systems. All our external
>>systems (both between the firewall and the router, and in the DMZ) are
>>in "domain.com" and all our internal systems are in "sub.domain.com", so
>>we don't need split-dns, right?
> 
> 
> whereas this statement implies you don't want split-dns.

It's not a matter of what I want or don't want - I inherited this mess 
from someone else, recently, and I'm slowly working my way through all 
my systems, learning how they are working (or not). We don't currently 
have split-dns (see my reply to the off-topic portion of this thread). 
Systems in the DMZ currently use real IP addresses, and can be accessed 
by their name in our external domain, from either the Internet, or from 
our internal domain (a sub-domain of our external domain). I'm trying to 
replicate this with an iptables firewall, without having to eliminate 
our internal domain and completely re-doing our internal and external 
dns in a split-dns fashion, just to get the firewall to work. Should I 
go to split-dns? From what I've read, and been told here, it would seem 
an excellent thing to do, but it's not something I can do overnight.

I mentioned in another email, that I could probably get two subnets from 
my ISP - one for my external network and one for my DMZ. Would this 
solve the problem until I can migrate to a split dns and one-to-one 
NAT'ing of the DMZ systems?

	-ste

