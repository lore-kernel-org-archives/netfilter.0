From: Clayton Russell <clayton.russell@vector.net.au>
Subject: Re: SNAT & DNAT
Date: Wed, 20 Oct 2004 09:54:22 +1000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4175A92E.1000600@vector.net.au>
References: <20041018152033.C85228A3C0@bne-mail01.vector.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041018152033.C85228A3C0@bne-mail01.vector.net.au>
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
To: netfilter@lists.netfilter.org

Lee Evans wrote:
> Hi,
> 
> Sorry if this has been asked before in some other guise - I looked through
> the archives but couldn't spot anything (or a search feature..)
> 
> I'm going to be implementing a gateway system using IPTables, which will
> need to perform both DNAT & SNAT on incoming connections.
> 
> The reason being that I want to provide external access to systems on a LAN
> which do not have a default gateway (and nor do I want them to have one).
> 
> The connections will come in to the public IP of the gateway and be DNAT'ed
> to the internal IP PREROUTING, and then SNAT'ed to the gateway's private IP
> POSTROUTING so that the internal systems have a route out for reply traffic.
> 
> I've tested this on a small test-network but before I try to roll it out on
> a larger scale, are there any issues with doing this that I should be aware
> of?
> 
> Thanks
> Lee
> 
> 
Hi Lee,

I have had problems with this in the past with strange protocols which 
the connection tracking does not recognise as related.  For example, xdm 
over this arrangment has some initial udp communication to organise the 
X connection, then the client side (LAN in your case) initiates a TCP 
connection to the server.  In this scenario the fw does not recognise 
the tcp connection as related to the udp connection, and does not know 
how to NAT this packet.

This is a fairly strange example though, things like telnet, web etc all 
worked fine.

Hope this helps,
Clayton

-- 
Clayton Russell
Systems Administrator
Vector Networks Pty Ltd
em: clayton.russell@vector.net.au
wb: www.vector.net.au
ph: +61 7 3236 9328



