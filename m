From: Stephen Johnson <stephen.johnson@arkansas.gov>
Subject: Re: Problems with trying to use the TEE target
Date: Thu, 07 Apr 2011 15:23:00 -0500
Message-ID: <1302207780.16650.32.camel@sjohnson.state.ar.us>
References: <1302199190.16650.23.camel@sjohnson.state.ar.us>
	 <20110407205721.39e28be8@catus>
	 <1302205269.16650.27.camel@sjohnson.state.ar.us>
	 <20110407220344.4e6b7be2@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110407220344.4e6b7be2@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, 2011-04-07 at 15:03 -0500, Marek Kierdelewicz wrote:
> Hi,
> 
> >What does the xtables-addons have to do with it? Iptables 1.4.10 has
> >the TEE target already.
> 
> It has userland iptables plugin. You're still missing kernel
> module. Try doing:
> 
> modprobe xt_DNETMAP
> and
> lsmod|grep _TEE

Ah. That was it. I thought the iptables TEE modules was the kernel
module. My mistake. Sorry for the confusion. Everything is now compile
and install. And my rules are working.

Thanks
-- 
Stephen L Johnson  <stephen.johnson@arkansas.gov>
Unix Systems Administrator / DNS Hostmaster
Department of Information Systems
State of Arkansas
501-682-4339


