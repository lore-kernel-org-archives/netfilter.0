From: "Jesse Gordon" <jesseg@nikola.com>
Subject: Re: Unmatchable packet?
Date: Thu, 24 Nov 2005 03:48:06 -0800
Message-ID: <002201c5f0ec$ef3f2c50$5e00800a@printserver>
References: <071e01c5efa7$786db600$5e00800a@printserver>	<073501c5efab$b10ad390$5e00800a@printserver>	<4383BBE0.2020504@gmail.com>	<078401c5efcf$bd9eb210$5e00800a@printserver>	<4384069F.3010201@snapgear.com>
	<WorldClient-F200511222303.AA03060138@nikola.com>
	<438417F8.3060907@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Philip Craig <philipc@snapgear.com>, Nikolai Georgiev <voyager123bg@gmail.com>, netfilter@lists.netfilter.org

I should probably make note here that while I have a nearly working 
understanding of the ip packets, source/dest ports/ips, and the like,
I do not have a firm grasp on how iptables deals with them -- other then 
that packets can sometimes be matched by addresses, ports, and other 
criteria.

I also understand the concept of a stateless firewall -- blocking or 
readdressing packets in a mindless mechanical way with no memory of history.

But it seems that much of iptables is far more stateful then I realize, and 
exactly how the internal workings do their thing seems to confuse me in a 
case like my attempts to do
asymmetrical nat routing.

Note that for normal stuff like forwarding ports, blocking ports, and so on, 
iptables does make sense to me and generally seems to do what I'd expect.

The reason I explain all of this is so that you have a better idea of what 
existing understanding I have, and where I'm clueless, in case you
are so generous as to mention a couple of things to me.

I've been reading in Oskar Andreasson's Iptables Tutorial, but it has a lot 
of information on the general topic of networking, which makes it slow to 
find what I need to know.

Anyone know of a short concise website that tells me what I can and can't do 
in each table, what they are for, and what order they are tested in?
That might help me immensely.

I ran across a new word (new only to me) 'Fast-nat' -- seems some kernels --  
at least 2.2 kernels -- had some fast simple dumb stateless natting 
capabilities in them.
I wonder if that's what I should be looking into.

My comments about my actual problem are below.


----- Original Message ----- 
From: "Philip Craig" <philipc@snapgear.com>
To: "Jesse Gordon" <jesseg@nikola.com>
Cc: "Nikolai Georgiev" <voyager123bg@gmail.com>; 
<netfilter@lists.netfilter.org>
Sent: Tuesday, November 22, 2005 11:19 PM
Subject: Re: Unmatchable packet?


> On 11/23/2005 05:03 PM, Jesse Gordon wrote:
>> I agree -- to do as my little example showed would be useless -- but my
>> real goal is to route the reply traffic via a different route than the
>> request traffic -- I already got it to send the replies out a different
>> network interface then the requests came in, but I haven't yet figured 
>> out
>> how to rewrite the source address of the replies.
>
> Why do you need to rewrite the address?
> Just routing the packet should be enough, unless there is an
> intermediate firewall that is dropping the packets based on the
> source address.

I need to rewrite the address so the calling party gets replies with the 
correct source address.
I've very carefully created a .PNG diagram on this webpage including IPs and 
text descriptions here:
http://jesseg.nikola.com:8080/asym-nat-route/
This will explain Exactly what I'm trying to do, and why I need to snat on 
the connection replies.

As shown in the diagram, I did set up an experiment that did what I wanted, 
except I had to use an extra nat iptables box.
That's the first shown diagram on the webpage mentioned above.
It seems iptables has no problem matching and SNATting reply packets as long 
as they aren't the reply packets generated
by a local server.


>
> I think you are confusing the nat and filter tables.
>

I don't know the difference between nat and filter, except that nat is the 
only one that can do nat, I think.

>
> The nat table only sees the first packet of a connection, because it
> is designed to set up the nat mapping based on the first packet only.
>

I've been reading a little in the iptables tutorial by Oskar Andreasson --  
and he says the same thing as you.

But it seems to me that nat can match on all packets that are forwarded, but 
I may be confused on this.

I did this experiment (unrelated to the diagrams above):
Workstation: 10.0.0.6 with a default gw of 10.0.0.5
iptables firewall box: WAN=64.146.180.164, LAN=10.0.0.5, default gw 
64.146.180.225
Then I did:

#Prevent packets from being sent out with a src address of 10.0.0.6:
iptables -t nat -A POSTROUTING -o eth1 -s 10.0.0.6 -j SNAT --to-source 
64.146.180.164
#Forward incoming packets to 10.0.0.6..
iptables -t nat -A PREROUTING -i eth1 -d 64.146.180.164 -j DNAT --to 
10.0.0.6

And this is without any masquerading rules, and with rules to allow 
forwarding to and from 10.0.0.6.

(I realize this could have been done with a masq rule instead of the first 
postrouting -- but I wanted to see if the two nat rules worked, and I also 
need to specify which source IP was used.)

This created a two way path -- in other words, the Workstation could connect 
out to the outside world, and the outside
world could connect in to the workstation.

I don't think it would work if either of the nat rules were absent -- which 
must mean that they both are working..
Maybe both rules always thought that they were always just getting the first 
packet?

In other words, when a connection is initiated by the Workstation, not only 
is the first nat rule natting the first request packet,
the second nat rule is also matching and natting the reply packet. Same 
thing with the incoming connection.

But shouldn't the reply packet be ignored by all nat rules, since nat only 
sees first packet of connection?

Anyhow, I'm trying hard to learn this cool world of iptables, and am 
struggling in my efforst to have it cohere.

I really do appreciate all of your effort in trying to help me!

>
> The filter table does see every packet, which is why you need the rule
> to allow established/related packets.

But I can't nat in any table other then nat, right?

>
> The mangle table also sees every packet.  It would be possible to write
> a custom target for use in the mangle table that changes the source
> address as you desire.  However, noone has written such a target as
> far as I know.
>

'Custom target' = a module or some addition to the source code, right?

Also, is my current understanding that "There are some packets which simply 
cannot be source natted," correct?

It may be that if I knew how to use the 'ip' program, I could do everything 
I need with 'ip route' and so on. I'm certainly open to suggestions.

Thanks very much,

Jesse 



