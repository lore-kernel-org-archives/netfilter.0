From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: load-balancing router: trouble with breaking connections
Date: Wed, 22 Feb 2012 20:22:02 +1300
Message-ID: <4F44979A.4030506@treenet.co.nz>
References: <op.v9wbxmahx1lyi3@debiandesk2.net> <op.v918bckux1lyi3@debiandesk2.net> <4F446520.2010002@standarduniversal.com.au> <op.v92bnewzx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v92bnewzx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 22/02/2012 5:19 p.m., Lloyd Standish wrote:
> On Tue, 21 Feb 2012 21:46:40 -0600, Brian Austin - Standard Universal 
> <brian@standarduniversal.com.au> wrote:
>
>> Hi,
>> you need to restore marks to packets from the local machine too.. or its
>> sessions will be messed up.
>> first line in mangle output should be
>>
>> iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark;
>>
>> I believe conntrack replaces the route cache function entirely for
>> session persistence.
>>
>> cheers
>>
>
> Thanks for your comment.  I do --restore-mark for OUTPUT as well, 
> although I didn't mention it in my post.
>
> The main point of my post was to show how load-balancing can be done 
> using the route cache to choose a route based on previous routing, and 
> use conntrack to keep packets on the same interfaces.
>
> It may be that there is confusion about my use of the word "session."  
> I am not referring to keeping all packets belonging to the same 
> *connection* on the same interface, but rather to keeping a series of 
> connections by a user to the same destination on the same interface.
>
> In my experience the only practical way to achieve session persistence 
> is to allow the route cache to choose the route (and therefore the 
> outbound interface).  When I ran a load-balancing router that ignored 
> the route cache, using the statistics module in "probability" mode to 
> choose an outbound interface at random, marking packets with connmark, 
> I got beautiful load-balancing, but sessions (not connections) were 
> broken constantly.  That is, websites that expected a logged-in user 
> to keep the same IP number gave endless trouble.  Interestingly, most 
> banking sites don't have a problem with this (although PayPal does).

I think the LB setup was suffering more from NAT than from routing 
issues. It is perfectly reasonable to expect that load balancer to work. 
Just as it would be perfectly reasonable to expect a router with an 
intermittent primary uplink to work with the same output style.
Only NAT on the LBs outbound interface or at the ISP level would cause 
the broken behaviour you describe.

AYJ
