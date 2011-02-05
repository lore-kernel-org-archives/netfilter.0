From: Andrew Beverley <andy@andybev.com>
Subject: Re: shaping vlans - revisited
Date: Sat, 05 Feb 2011 02:10:24 +0000
Message-ID: <1296871824.1616.14.camel@andybev>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
	 <1296759048.7587.3.camel@andybev>
	 <20110203180118.62970fb1@pulsar.inexo.com.br>
	 <1296788356.7587.70.camel@andybev>
	 <20110204120533.7f470bab@pulsar.inexo.com.br>
	 <1296829445.1634.1.camel@andybev>
	 <20110204142417.30dbe5fa@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1296871826; bh=vD72QHOoybOpkV8yUjqpE1MXcBn33abKGJ4pK
	mJpnvw=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=KsIP8CMu
	p6OW53cNYPtPSDqRilc4ZWyjhtkU1nnih8OseBI5WVJj7AkrbTN4VqqM/4DkEdV2Ps/
	LofkuQtcFqQu0+r6qw+77ibAvkYw8h9WvpYd3AW+XsuZ7cwMmxPxVQGA6anW+MfZGS4
	ARljFj0NMbkKB7AopR0U7MjwPb3No=
In-Reply-To: <20110204142417.30dbe5fa@pulsar.inexo.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: netfilter@vger.kernel.org

On Fri, 2011-02-04 at 14:24 -0200, Ethy H. Brito wrote:
> On Fri, 04 Feb 2011 14:24:05 +0000
> Andrew Beverley <andy@andybev.com> wrote:
> 
> > On Fri, 2011-02-04 at 12:05 -0200, Ethy H. Brito wrote:
> > > On Fri, 04 Feb 2011 02:59:16 +0000
> > > Andrew Beverley <andy@andybev.com> wrote:
> > > 
> > > 
> > > > Stupid question - can you not just attach your qdisc to the vlan
> > > > interface and mark the traffic on the vlan interface as well, as if
> > > > it was eth1?  
> > > 
> > > You mean "tc qdisc add dev vlanX ..." + "iptables ... -j IPMARK ..." ??
> > > 
> > > No. This must not be done. I have now 6 vlans (3 for IPv4 and 3 for
> > >  IPv6) each pair to one ISP. The only way I know (if you guys know
> > >  another way, please advise) to shape *_global_* aggregated traffic for
> > >  each client is to attach to eth1 an not to individual vlans. 
> > > 
> > 
> > Could you use an IFB device? Or possibly even IMQ?
> 
> IFB?? 
> 
> it may be a good way out.
> Do you know any discussion list or forum for it? 

This list is probably a good place to start. There doesn't seem to be a
huge amount of information around for it, but I got a good response from
the author when I contacted him with a question a while back.

Andy


