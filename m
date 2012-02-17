From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: How to restrict torrent download  ?
Date: Fri, 17 Feb 2012 12:53:28 +0100
Message-ID: <1329479608.3296.24.camel@ns014530.dcyb.net>
References: <20120216160904.2ea59e26@shiva.selfip.org>
	 <1329389715.3296.12.camel@ns014530.dcyb.net>
	 <4F3CE276.4010500@cloudways.com> <20120216171502.78212a3e@shiva.selfip.org>
	 <20120216171909.3a3cd4c1@shiva.selfip.org>
	 <1329393715.3296.18.camel@ns014530.dcyb.net>
	 <20120217171338.037087c5@shiva.selfip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120217171338.037087c5@shiva.selfip.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

On Fri, 2012-02-17 at 17:13 +0530, J. Bakshi wrote:
> I have installed xtables-addons-common in debian squeeze box.
> Then tried ti execute
> 
> #iptables -A FORWARD -m ipp2p --bit -j DROP
> 
> and it throws error
> 
> ``````````````
> iptables: No chain/target/match by that name.
> ```````````
> 
> Could anyone suggest what is wrong where ?

Does xt_ipp2p.ko exist?

# locate xt_ipp2p|grep modules
/lib/modules/2.6.39.1/extra/xt_ipp2p.ko


If it does: what does lsmod say?

# lsmod|grep "^xt_ipp2p"
xt_ipp2p                5611  0 


--
Rob


