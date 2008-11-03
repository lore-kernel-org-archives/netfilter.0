From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Basic Routing
Date: Tue, 04 Nov 2008 12:40:50 +1300
Message-ID: <490F8C02.4060107@treenet.co.nz>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net> <490F5103.8070409@amfes.com> <490F537B.7070506@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490F537B.7070506@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dmiller@amfes.com
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Daniel L. Miller wrote:
> Daniel L. Miller wrote:
>> Grant Taylor wrote:
>>> Is this close to what you are wanting to happen?  (Let me know before 
>>> I explain how to make this happen.)
>> Um...no.  Too complicated.
>>

Daniel,
   lets cut this right back to the basics and answer your original question:

   1) NAT is needed to change private IPs (192.168.0.0/16) to Internet 
IPs. It does not in itself send packets anywhere.

   2) everything else just uses straight routing.

   puddles of NAT around the rest of the internet are invisible and 
completely ignored by your systems.


> Now that we're discussing that - let's change gears and talk about it 
> differently.
>> A==>C<==>D<===B
> No Internet - but still private networks.  So Router C has a route for 
> the network 'A' 192.168.0.0/24 and route to reach router 'D'.  Router 
> 'D' knows about network 'B' 192.168.1.0 and router 'C'.  D and C talk to 
> each other, just because, on their own network of 172.16.0.0/16.
> 
> Is any NAT required for this conversation?  In particular - do Linux 
> routers require SNAT lines for this?  Or just routing tables?


NAT is different to routing. All it does is change the private IPs 
back-n-forth. plain old routing is still needed to get the private 
packets to the NAT place and then the public packets out across the 
Internet.

Lets follow that sequence:

  A creates a packet(A->D) and 'routes' it to C.
  C takes the packet(A->D). NATs it packet(C->D). then routes it to B
  B takes the packet(C->D). NATs it packet(B->D). then routes it to D.
  D takes the packet(B->D).


  D replies with packet(D->B).
  B takes the packet(D->B) and NATs it packet(D->C). then routes it to C.
  C takes the packet(D->C) and NATs it packet(D->A). then routes it to A.
  A gets reply packet(D->A)

Far too complicated than it needs to be yes?
So NAT only happens when one of the IPs needs to be changed (ie from a 
private IP to a 'public' one, or from one private to another private)

If you really have different 192.168.*.0/24 networks at A and B. AND 
also control the network C-D. You should be able to get away without NAT.
By simply setting the route table of C to route B network through D.
And D route table to route network A through C.


AYJ
