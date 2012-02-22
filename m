From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: load-balancing router: trouble with breaking connections
Date: Wed, 22 Feb 2012 14:46:40 +1100
Message-ID: <4F446520.2010002@standarduniversal.com.au>
References: <op.v9wbxmahx1lyi3@debiandesk2.net> <op.v918bckux1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v918bckux1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

Hi,
you need to restore marks to packets from the local machine too.. or its 
sessions will be messed up.
first line in mangle output should be

iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark;

I believe conntrack replaces the route cache function entirely for 
session persistence.

cheers



On 22/02/2012 2:07 PM, Lloyd Standish wrote:
> On Sat, 18 Feb 2012 16:40:24 -0600, Lloyd Standish 
> <lloyd@crnatural.net> wrote:
>
>> Is there a known problem with this sort of load-balancing when there 
>> is a private IP on the interface?
>> I'm quite sure the problem is not in the NAT done by Provider 1, 
>> since when this same interface is used with my Linux router doing 
>> connmark-based load balancing, connections are not dropped.
>> http://lartc.org/howto/lartc.rpdb.multiple-links.html explains this 
>> simple routing scheme clearly, and I think I have followed it 
>> carefully.  Basically, for each interface I execute commands like 
>> these (IP numbers and interfaces are replaced by variables from my 
>> script, but it should be clear.  CONNMARK<n> are simply chains to put 
>> a fwmark on a packet.  This is used only for special cases on this 
>> router.):
>
> I finally found a solution to this issue, after weeks of frustration 
> and unnecessary effort.  (This problem forced me to code a 
> connmark-based load-balancing router, which produced unacceptable 
> session-breaking.  I will comment on this below.)  I am posting this 
> reply to my own post for the benefit of others who will certainly run 
> into this problem.
>
> I refer to http://lartc.org/howto/lartc.rpdb.multiple-links.html.  
> According to my experience, that scheme, which does not use connmark 
> to mark packets, DOES NOT work properly when at least one of the 
> uplinks carries a private IP number.  Under these circumstances, 
> connmark-and-friends must be used to avoid having RELATED,ESTABLISHED 
> packets sent out the wrong interface.
>
> Specifically, to fix this problem the following must be done in 
> addition to what is described at 
> http://lartc.org/howto/lartc.rpdb.multiple-links.html:
>
> PREROUTING
> 1. For RELATED,ESTABLISHED packets entering from the LAN interface, do 
> "--restore-mark"
> 2. For all packets coming in from an outward-facing interface that has 
> no mark, mark according to the interface
>
> POSTROUTING
> 3. For NEW connections leaving on an outward-facing interface, set the 
> mark on the packet according to the outbound interface.
> 4. For all packets leaving router on any interface, "--save-mark"
>
> In addition, rules must be added to send packets out through 
> interfaces that have the corresponding mark, for example:
>
> ip rule add fwmark 1 table T1
> ip rule add fwmark 2 table T2
> etc.
>
> In sum, the strategy is to allow the route cache and the round-robin 
> interface selection of "nexthop via" to choose the outgoing interface, 
> and connmark is used to keep the packets belonging to a connection on 
> the same connection.
>
> Note that if the route cache is ignored during the process of choosing 
> an outbound connection, *sessions* will be constantly broken, 
> resulting in a completely unacceptable Internet browsing experience 
> for users.
>

