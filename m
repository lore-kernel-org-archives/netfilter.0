From: Andrew Beverley <andy@andybev.com>
Subject: Re: shaping vlans - revisited
Date: Fri, 04 Feb 2011 14:24:05 +0000
Message-ID: <1296829445.1634.1.camel@andybev>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
	 <1296759048.7587.3.camel@andybev>
	 <20110203180118.62970fb1@pulsar.inexo.com.br>
	 <1296788356.7587.70.camel@andybev>
	 <20110204120533.7f470bab@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1296829452; bh=IT0CsLrXYmo5TxD/5jFlv1TAw7dQ6w1SUkd9v
	nR/ftY=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=eLFRC2ki
	I70MzCGDVpfs9TKcOvM5fVxHgBQLe2HAqO09GkUVyT6AL02EEwVYX1d14jwkr4KL0kr
	xOPeMAmSYe0My5OY4owzPSKujLsOy9iUhaqFEpfbeZFqpyQOwzNfa49HJ7RNOh1HdbG
	bCFg7XEWRuZX2UrLzQFDz1G8YJH3k=
In-Reply-To: <20110204120533.7f470bab@pulsar.inexo.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: netfilter@vger.kernel.org

On Fri, 2011-02-04 at 12:05 -0200, Ethy H. Brito wrote:
> On Fri, 04 Feb 2011 02:59:16 +0000
> Andrew Beverley <andy@andybev.com> wrote:
> 
> 
> > Stupid question - can you not just attach your qdisc to the vlan
> > interface and mark the traffic on the vlan interface as well, as if it
> > was eth1?  
> 
> You mean "tc qdisc add dev vlanX ..." + "iptables ... -j IPMARK ..." ??
> 
> No. This must not be done. I have now 6 vlans (3 for IPv4 and 3 for
>  IPv6) each pair to one ISP. The only way I know (if you guys know
>  another way, please advise) to shape *_global_* aggregated traffic for
>  each client is to attach to eth1 an not to individual vlans. 
> 

Could you use an IFB device? Or possibly even IMQ?

Andy


