From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT Forwarding Problem
Date: Mon, 16 Sep 2002 20:27:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020916192726.EKDW287.mta02-svc.ntlworld.com@there>
References: <001201c25dae$0d31dee0$6501a8c0@JCC>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001201c25dae$0d31dee0$6501a8c0@JCC>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Monday 16 September 2002 7:22 pm, Chen Ding wrote:

> Hi All,
>
> I have four machines in the setting:
>     Machine A:             192.168.1.81                 RedHat 7.3
>     Machine B:             192.168.1.17                 RedHat 7.3
>     Machine C:             192.168.1.101               Microsoft XP
>     Machine D:             An public IP address      RedHat 7.3
>
> On Machine A, I have just one Rule:
>
>     iptables -t nat -A PREROUTING -d 192.168.1.81 -j DNAT --to-destination
> 192.168.1.17
>
>---- pings:
>     1. Machine C to ping 192.168.1.81:         OK (should actually ping
> 192.168.1.17)
>     2. Machine C to ping 192.168.1.17:         OK
>     3. Machine A to pring 192.168.1.17:        OK

You should be aware that ping does not care whether it gets replies from the 
same address as it sent requests to.   What is actually happening here is 
that you are sending an echo-request from machines A and C to addresses 81 
and 17, but in both cases you are getting replies from 17.

ICMP is happy doing this.   So is UDP.   TCP is not.

>     telnet:

Telnet is a TCP protocol.

>     1. Machine C to telnet 192.168.1.17:       OK
>     2. Machine A to telnet 192.168.1.17:       OK
>     3. Machine C to telnet 192.168.1.81:       No response

This is what I would expect to happen.

> According to the rule, when Machine C telneting Machine A, Machine A should
> forward packets to Machine B, resulting in telneting Machine B. If use
> netstat, it did tell us that Machine A forwarded several packets.

Yes, but what happens to the replies from B ???

> However, if I change the rule on Machine A to forward all packets to
> Machine D, everything works just fine. Machine C can telnet Machine A,
> which ends up telneting Machine D.

Correct, because A is a *router* between C and D.   A is not a router between 
C and B - they are both on the same subnet.

> My questions are:
>     1. Is there anything wrong in my understanding of iptables?

No, but you haven't fully thought through the routing inthis situation.

Here's a clue:

C sends TCP packet to port 23 (telnet) on machine A.   A DNATs this packet 
and sends it on to B.   B receives it and replies to the source address, 
which is C.

Therefore C has sent a packet to A, and got a reply from B.   TCP doesn't 
work like this, therefore C is confused and unhappy.

If you want this situation to work (is there really any good reason why C has 
to telnet A instead of B directly ?) you must make sure that the *reply* 
packets from B go back through A in order to get to C, so that they get 
reverse NATted on their way back through A.

The two easiest ways to do this are:

1. Set up a route on B telling it to route packets via A.

2. Source NAT the packets at A as well as destination NATting them, so thet 
when they reach B, they have a source of A, B replies to A, A reverse SNATs 
and reverse DNATs the packets, and they return to C.

You may want to consult the documentation on this:

http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-10.html

Antony.

-- 

Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

