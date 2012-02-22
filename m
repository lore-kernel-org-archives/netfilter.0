From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: load-balancing router: trouble with breaking connections
Date: Thu, 23 Feb 2012 07:57:31 +1100
Message-ID: <4F4556BB.7020303@standarduniversal.com.au>
References: <op.v9wbxmahx1lyi3@debiandesk2.net> <op.v918bckux1lyi3@debiandesk2.net> <4F446520.2010002@standarduniversal.com.au> <op.v92bnewzx1lyi3@debiandesk2.net> <4F44979A.4030506@treenet.co.nz> <op.v924y4pvx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v924y4pvx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: Amos Jeffries <squid3@treenet.co.nz>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



On 23/02/2012 1:53 AM, Lloyd Standish wrote:
> On Wed, 22 Feb 2012 01:22:02 -0600, Amos Jeffries 
> <squid3@treenet.co.nz> wrote:
>
>> I think the LB setup was suffering more from NAT than from routing 
>> issues. It is perfectly reasonable to expect that load balancer to 
>> work. Just as it would be perfectly reasonable to expect a router 
>> with an intermittent primary uplink to work with the same output style.
>> Only NAT on the LBs outbound interface or at the ISP level would 
>> cause the broken behaviour you describe.
>> AYJ
>
> I would certainly like to understand WHY I had to use connmarks to 
> keep the packets belonging to a connection on the right interface.  
> However, I don't believe the problem was NAT, because the only changes 
> I had to make to get this load-balancing router to work (that is, to 
> stop breaking connections) were the ones I mentioned in a previous 
> post.  I did not add or change any NAT rules.  The router is doing NAT 
> the way it was before, set up with a command like this for each 
> interface:
>
> iptables -t nat -A POSTROUTING -o ${interface} -j SNAT --to-source 
> ${!wan}
>
> Furthermore, on this router I was already using connmark to mark and 
> route packets for those destinations and origin IP for which we did 
> not want to have load-balancing.  This by the way worked fine 
> (connections were not broken).  The only thing I added to fix the 
> connection-breaking was marking of NEW packets after netfilter had 
> made the routing decision (based on either the routing cache or 
> round-robin distribution).
>
> I would like to know whether or not anyone has succeeded in doing 
> load-balancing with "nexthop via..." over interfaces with *private* IPs.
>
My set up has nat at the adsl modems, not at the linux box. So my router 
is in private ip space on all interfaces.

  I don't see how NAT could be an issue either, but I'm not a guru at 
this - just enough to get it going.
Without thorough conntrack, it was rubbish.

