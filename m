From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Basic Routing
Date: Mon, 03 Nov 2008 11:39:39 -0800
Message-ID: <490F537B.7070506@amfes.com>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net> <490F5103.8070409@amfes.com>
Reply-To: dmiller@amfes.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490F5103.8070409@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Daniel L. Miller wrote:
> Grant Taylor wrote:
>> Is this close to what you are wanting to happen?  (Let me know before 
>> I explain how to make this happen.)
> Um...no.  Too complicated.
>
Now that we're discussing that - let's change gears and talk about it 
differently.
> A==>C<==>D<===B
No Internet - but still private networks.  So Router C has a route for 
the network 'A' 192.168.0.0/24 and route to reach router 'D'.  Router 
'D' knows about network 'B' 192.168.1.0 and router 'C'.  D and C talk to 
each other, just because, on their own network of 172.16.0.0/16.

Is any NAT required for this conversation?  In particular - do Linux 
routers require SNAT lines for this?  Or just routing tables?
-- 
Daniel
