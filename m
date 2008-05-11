From: Alexei Ustyuzhaninov <alust@alust.homeunix.com>
Subject: Re: fwmark iptables/ip routing interaction question
Date: Sun, 11 May 2008 22:23:39 +0600
Message-ID: <48271D8B.5030608@alust.homeunix.com>
References: <49159.212.190.198.36.1210171014.squirrel@webserver6.intec.ugent.be> <alpine.LNX.1.10.0805071703150.30395@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0805071703150.30395@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: pthyseba@intec.ugent.be, netfilter@vger.kernel.org

Jan Engelhardt wrote:
> On Wednesday 2008-05-07 16:36, pthyseba@intec.ugent.be wrote:
>> This setup works as expected: the targeted packets are routed to the
>> different gateway. However, my question is: why does this work?
> 
> Because we expect it to :)
> 
>> After studying the iptables block diagrams, it seems that the packet
>> travels through the OUTPUT chains AFTER "routing". I assumed that
>> "routing" implied the lookup of the correct routing table and then
>> selection of the correct rule in that table, but putting the iptables and
>> my definition of "routing" together, it would seem that packets only get
>> marked (the MARK target is in the output chain) after "routing" has been
>> done (and I assumed filtering packets using the fwmark filter was done in
>> that step). Obviously, I'm misunderstanding something, as packets that get
>> marked in the OUTPUT chain do get routed correctly (meaning, have their
>> mark set when routing is looking for the correct routing table).
> 
> Correct, there is an extra reroute done in the output path
> (see http://jengelh.medozas.de/images/nf-packet-flow.png )

Jan, could you explain please which code does this extra rerouting: 
iproute2 or netfilter? I have a weird with the same scenario: after 
rerouting a packet goes out through another interface but keeps the 
source address of the original interface.

-- 
Alexei
