From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: is this NAT setup right?
Date: Thu, 19 Sep 2002 15:52:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209191452.g8JEqYv19925@vulcan.rissington.net>
References: <20020919184840.19c02006.arc_of_descent@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020919184840.19c02006.arc_of_descent@gmx.net>
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

On Thursday 19 September 2002 2:18 pm, Rohan Almeida wrote:

> HI,
> I've just read a few mails on this list,
> and now i'm suddenly wondering if the firewall rules
> i've been using for over 3 months are correct! :-)
>
> Allow me to elaborate:
>
>                              (eth1)            (eth0)
>         {LAN}      <---------> {  L  I  N  U  X  } <---------> {ISP}
>    (172.16.0.0/16)       (172.16.0.1)      (203.1.2.3)      (203.1.2.1)
>
> As in the diagram above, the Linux box has
> eth1 (LAN interface) with ip 172.16.0.1
> 		AND
> eth0 (EXT interface) with ip 203.1.2.3
>
> This is my firewall setup
>
> <code>
> #!/bin/sh
>
> PATH=$PATH:/sbin
> lockfile -2 /var/lock/firewall.lock
>
> iptables -t filter -F
> iptables -t nat -F
> iptables -t mangle -F
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
> # authentication
> iptables -P FORWARD ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> ################# Add authenticated users here ##################
> # eg. iptables -A FORWARD -i eth1 -s 172.16.0.2/32 -j ACCEPT
> # which means 172.16.0.2 is authenticated
> #################################################################
> iptables -A FORWARD -i eth1 -j REJECT
>
> # masquerading
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 172.16.0.0/16
>
> rm -f /var/lock/firewall.lock
> </code>
>
> Now the questions:
> The FORWARD chain has a default ACCEPT policy

Personally I don't like default ACCEPT policies.   I say you should have a 
default DROP policy, and then ACCEPT specific things you want to allow.

That way, if you forget something, someone will complain they can't get a 
protocol to work, and you'll fix it.   If you have a default ACCEPT, and 
forget to block something, the person who discovers what you forgot is 
unlikely to complain to you about it, so you won't fix it :-)

> I am then ACCEPTING only users who have been authenticated
> Then I'm REJECTING others with icmp-port-unreachable

My approach to how to blocki things I don't want depends on where the packets 
are coming from:

1. Packets from the outside are from people you don't want to be helpful to, 
therefore simply DROP those and say nothing.   Sooner or later they'll go 
away and stop bothering you.   If you do a good job with your security they 
won't even be able to tell that your system is there to have a go at.

2. Packets from the inside are from people you (presumably) want to be 
helpful to, and give a quick response to let them know whatever it is isn't 
going to work, therefore you REJECT those packets with a port- (or host-) 
unreachable so that internal users get a quick error message saying "connect 
failed" without having to wait for TCP timeouts etc...

> Further more, is the "-i eth1" correct?
> I've read one of Antony's mail where it is "-i eth0"

-i eth1 is correct in your case, yes.   If you saw "-i eth0" in one of my 
other postings it was either because that user was looking for packets coming 
in the eth0 interface, or I was assuming that was the case...

The bit I definitely don't like about your ruleset is the default ACCEPT on 
FORWARD, with the REJECT from eth1 at the end, but nothing for packets from 
eth0 - in other words if someone on the Internet can manage to route packets 
to you with a 172.16.0.0 destination address (another customer of the same 
ISP, perhaps ?) then your rules are not going to stop them coming in, nor the 
replies going out.....

Also a small tip - it's considered good practice to do a
echo 0 > /proc/sys/net/ipv4/ip_forward
at the start of your rules, and then only after you've got everything set up 
how you want it, to do
echo 1 > /proc/sys/net/ipv4/ip_forward

That way there's no window of time during bootup, during which your kernel is 
forwarding packets, but your security rules are incomplete (which is the case 
on your system at present).


Hope this helps,

Antony.

-- 

Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer

