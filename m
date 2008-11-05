From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Basic Routing
Date: Tue, 04 Nov 2008 16:00:42 -0800
Message-ID: <4910E22A.4070705@amfes.com>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net> <490F5103.8070409@amfes.com> <490F537B.7070506@amfes.com> <490F5E8E.1050505@riverviewtech.net>
Reply-To: dmiller@amfes.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490F5E8E.1050505@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor wrote:
>> No Internet - but still private networks.  So Router C has a route 
>> for the network 'A' 192.168.0.0/24 and route to reach router 'D'.  
>> Router 'D' knows about network 'B' 192.168.1.0 and router 'C'.  D and 
>> C talk to each other, just because, on their own network of 
>> 172.16.0.0/16.
>> Is any NAT required for this conversation?  In particular - do Linux 
>> routers require SNAT lines for this?  Or just routing tables?
>
> No.  NAT is not required.

I guess here's a Linux specific question - as opposed to the more 
general IP/routing discussion we've been having.

Given a Linux box with multiple networks on one or more interfaces 
(192.168.0.1 on eth0, 192.168.5.1 on eth0:0, 172.26.0.1 on eth1, etc.) - 
and just adding a "1" to /proc/sys/net/ip_forward - will this magic box 
be able to forward packets between the networks without further 
configuration?  Or will this require NAT statements from iptables (and 
no, this is NOT an opportunity to tell me about 
ipchains/ebtables/other-Linux-networking-specialty-program-kernel-interface-I-didn't-mention)?

Ok fine - if you can recommend a tool to make this easier - I'd be 
delighted to hear about it.  Right now my configuration tool is firehol.
-- 
Daniel
