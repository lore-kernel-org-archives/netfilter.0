From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: telnet question
Date: Wed, 7 Jul 2004 13:30:09 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7EACCDBB65D37443912D80713CC1245D4728C6@fsnsab20.losangeles.af.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: 'Nick Taylor' <nickt@lightlink.com>, Askar Ali Khan <askarali@gmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

nick,,,bingo...


####################################
# delbert.hudson@losangeles.af.mil #
#        61cs/scbn, 3-0182         #
####################################


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Nick Taylor
Sent: Wednesday, July 07, 2004 1:16 PM
To: Askar Ali Khan
Cc: netfilter
Subject: Re: telnet question


> we got a machine to which we telnet only telnet is allow on that
> machine (C) no ssh thingy, the problem is that we telnet the machine
> from two different linux boxes "servers" here is the traceroute for
> ...
>
> Linux Box :A tracetroute output for the machine C
>
>      traceroute to xxx.xxx.xx.x (xxx.xxx.xx.x), 30 hops max, 38 byte
packets
>      1  abc.foo.net (xxx.xxx.xx.x)  4.440 ms  3.931 ms  4.406 ms
> <---direct to machine C
>
> Linux Box: B tracetroute output for the machine C
> traceroute to xxx.xxx.xx.x (xxx.xxx.xx.x), 30 hops max, 38 byte packets
>  1  xxx.xxx.xx.1 (xxx.xxx.xx.1)  5.056 ms  1.088 ms  1.109 ms
<-----gateway
>  2  xxx.xxx.xx.x (xxx.xxx.xx.x)  5.198 ms  5.887 ms  14.429 ms
<-----machine C
>
> my question is that how to makes Linux Box (B) direct to machine C i-e
> like that Linux Box A.
>

Without knowing more about your network, providing "the" answer is hard,
but if I understand correctly, what you're complaining about is the first
hop in the traceroute, the one you marked as "gateway".  You want the
packets to be delivered directly to machine C without going through the
gateway first, is this correct?

If so, you must understand how routing works, and that there are two
different things that a host on a network might do when trying to talk to
another machine.  First, it will check to see if it can do local delivery,
and if that doesn't work, it will try to find a router to use.

So, if two computers are directly connceted on the same ethernet hub,
you'd like them to be able to talk to eachother directly.  TCP/IP doesn't
know about hubs and switches though, it only knows about IP addresses.

Here's where I make up an example...

           IP Address     Netmask
Machine A: 192.168.23.4   255.255.255.0
Machine B: 192.168.23.7   255.255.255.0
Machine C: 10.30.42.6     255.255.0.0
Gateway:   192.168.23.1   255.255.255.0
Gateway:   10.30.12.1     255.255.0.0

When Machine A wants to talk to Machine B, it first computes the bitwise
AND of it's IP address and it's netmask, so 192.168.23.4 & 255.255.255.0 =
192.168.23.0, this is the so-called network address, then it calculates
Machine B's network address, 192.168.23.7 & 255.255.255.0 = 192.168.23.0,
and it now realizes that both network addresses are the same, thus the two
machines are on the same network.  Now, it uses ARP to get the hardware
address of machine B, and transmits the packet directly.

When Machine C wants to talk to machine B, it trys the same thing, but
10.30.42.6 & 255.255.0.0 is 10.30.0.0, and 192.168.23.4 & 255.255.0.0 is
192.168.0.0, which is NOT the same, so machine C cannot do local delivery,
because as far as TCP/IP is concerned, they're not on the same network.
So, machine C will look in its routing table for an entry that matches,
most likely it will find it's default route, so it will transmit the
packet to it's gateway 10.30.12.1. It will look up the hardware address of
10.30.12.1 using ARP, and send the packet to the router, which DOES know
how to talk to 192.168.23.4, and forwards the packet accordingly.

In order to get the machines talking to eachother without a gateway, they
need not only to be on the same physical wire, but also they need to have
IP addresses in the same IP network.

I hope this is helpful.


