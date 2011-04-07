From: Stephen Johnson <stephen.johnson@arkansas.gov>
Subject: Re: Problems with trying to use the TEE target
Date: Thu, 07 Apr 2011 14:41:09 -0500
Message-ID: <1302205269.16650.27.camel@sjohnson.state.ar.us>
References: <1302199190.16650.23.camel@sjohnson.state.ar.us>
	 <20110407205721.39e28be8@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110407205721.39e28be8@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, 2011-04-07 at 13:57 -0500, Marek Kierdelewicz wrote:
> >Greeting,
> 
> Hi,
> 
> >I trying to use the TEE target but I keep getting the errors even using
> >the example commandi on the ipxt_TEE man page.
> >I'm current using iptables-1.4.10 that I've compiled and installed on
> >the server. The linux kernel is 2.6.32.
> 
> Try installing xtables-addons:
> http://xtables-addons.sourceforge.net/
> 
> It contains TEE module.
> 
> best regards,
> Marek Kierdelewicz

What does the xtables-addons have to do with it? Iptables 1.4.10 has the
TEE target already.

        iptables -t mangle -A PREROUTING -i eth0 -j TEE --help
        iptables v1.4.10
        
        Usage: iptables -[AD] chain rule-specification [options]
        ...
        TEE target options:
          --gateway IPADDR    Route packet via the gateway given by
        address
          --oif NAME          Include oif in route calculation

When I try to use the TEE target I get the error.

        iptables: No chain/target/match by that name.
-- 
Stephen L Johnson  <stephen.johnson@arkansas.gov>
Unix Systems Administrator / DNS Hostmaster
Department of Information Systems
State of Arkansas
501-682-4339


