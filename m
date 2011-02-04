From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: shaping vlans - revisited
Date: Fri, 4 Feb 2011 14:24:17 -0200
Message-ID: <20110204142417.30dbe5fa@pulsar.inexo.com.br>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
	<1296759048.7587.3.camel@andybev>
	<20110203180118.62970fb1@pulsar.inexo.com.br>
	<1296788356.7587.70.camel@andybev>
	<20110204120533.7f470bab@pulsar.inexo.com.br>
	<1296829445.1634.1.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296829445.1634.1.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Fri, 04 Feb 2011 14:24:05 +0000
Andrew Beverley <andy@andybev.com> wrote:

> On Fri, 2011-02-04 at 12:05 -0200, Ethy H. Brito wrote:
> > On Fri, 04 Feb 2011 02:59:16 +0000
> > Andrew Beverley <andy@andybev.com> wrote:
> > 
> > 
> > > Stupid question - can you not just attach your qdisc to the vlan
> > > interface and mark the traffic on the vlan interface as well, as if
> > > it was eth1?  
> > 
> > You mean "tc qdisc add dev vlanX ..." + "iptables ... -j IPMARK ..." ??
> > 
> > No. This must not be done. I have now 6 vlans (3 for IPv4 and 3 for
> >  IPv6) each pair to one ISP. The only way I know (if you guys know
> >  another way, please advise) to shape *_global_* aggregated traffic for
> >  each client is to attach to eth1 an not to individual vlans. 
> > 
> 
> Could you use an IFB device? Or possibly even IMQ?

IFB?? 

it may be a good way out.
Do you know any discussion list or forum for it? 
I just read a few sites and have some questions.

Ethy
