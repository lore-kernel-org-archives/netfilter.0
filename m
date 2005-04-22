From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Local Port Forwarding.
Date: Fri, 22 Apr 2005 16:59:58 -0500
Message-ID: <426973DE.401@riverviewtech.net>
References: <1114206098.6690.5.camel@cautin2.dcsc.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1114206098.6690.5.camel@cautin2.dcsc.utfsm.cl>
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
To: Alejandro Villarroel <alejandro.villarroel@usm.cl>
Cc: netfilter@lists.netfilter.org

> Hello:
> 	I'm kind of new to IpTables, and I'm having problems to do this kind of
> port forwarding in my Fedora Core 3:
> 
> Suppose I have some user trying to access Host X:Port X on the Internet
> from my Linux, but Instead of that I want to forward this traffic to the
> localhost:Port Y, what rule I have to apply?
> 
> Thanks in advance,
> 	Alejandro

Alejandro, are you wanting to redirect the traffic of someone (or something / some daemon) running locally on the box that will be doing the redirection?  Or are you wanting to redirect the traffic from an internet connected client to a different system?  From what I read of your question the situation is the former.  As such I'm going to answer that question.

iptables -t nat -A OUTPUT -d $HostX -p tcp --dport $PortX -j REDIRECT --to-ports $PortY



Grant. . . .

