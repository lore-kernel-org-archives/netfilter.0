From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: load-balancing router: trouble with breaking connections
Date: Sun, 19 Feb 2012 16:17:52 +1100
Message-ID: <4F408600.7000103@standarduniversal.com.au>
References: <op.v9wbxmahx1lyi3@debiandesk2.net> <4F405764.5040103@standarduniversal.com.au> <op.v9woumuyx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v9woumuyx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

Hi Lloyd,

after months of bashing at this and I'm onto revision 3 of the rig, 
conntrack is the answer.

also conntrack allows you to connect to both wan IP eg ssh to one and 
smtp to the other.
without conntrack, the route cache will only allow connection to one wan 
port, so if your
ssh into one side, any connection to the other side will mysteriously 
fail, then vica versa.

cheers

On 19/02/2012 2:19 PM, Lloyd Standish wrote:
> On Sat, 18 Feb 2012 19:59:00 -0600, Brian Austin - Standard Universal 
> <brian@standarduniversal.com.au> wrote:
>
>> you need to restore connmarks coming in from the wan so the system 
>> can send them back out that way
>>
>
> Hello Brian,
>
> Thanks for the reply.  The router I described does not use connmark.  
> It uses a command like this to set up round-robin balancing:
> ip route add default scope global  nexthop via 192.168.1.1 dev eth1 
> weight 1 nexthop via 192.168.2.1 dev eth2 weight 1 nexthop via 
> 200.91.104.144 dev ppp0 weight 1
>
> This is described here:
> http://lartc.org/howto/lartc.rpdb.multiple-links.html
>
> The article teaches that this balancing depend on the following rule 
> (one for each interface) to route traffic out the same interface as it 
> was received on:
> ip rule add from ${!wan} table $table priority $((${#ifaces[@]}*100))
>
> (Of course, the priority value can be ignored.)
>
> Since this system results in breaking connections, I am forced for the 
> time being to use a connmarks for balancing, and restoration of marks, 
> as you mentioned.
>

