From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: redirect doesn't seem to work?
Date: Sat, 9 Nov 2002 12:57:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021109125726.HOVZ20191.mta03-svc.ntlworld.com@there>
References: <1036471268.2912.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1036471268.2912.7.camel@localhost.localdomain>
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

On Tuesday 05 November 2002 4:41 am, Ben Russo wrote:

> Have a UNIX server.  User wants to write programs to receive SNMPTraps.
> I *thought* I could redirect incomming traffic to port 162 to a high
> port, (like 4162) where the user could have his programs receive the
> messages with no special privelages?
>
> Anyway, a completely normal box, no special firewalling rules....
> The only rule I create is:
>
> iptables -t nat -A POSTROUTING -p udp -m udp --dport 162 -j REDIRECT
> --to-ports 4162
>
> Now, the user starts his program that binds to udp port 4162 ( I can see
> it with "netstat -nap" ) but he doesn't see any packets coming in.
> I run tcpdump -n | grep snmptrap and I see packets coming from the
> network to the server on udp port 162, and the server sending back icmp
> unreachable packets back to the sources??
>
> Why doesn't the redirect work?

Is this rule on the machine sending the SNMP traps, or the machine receiving 
them ?

If it's on the sender, then the problem is that REDIRECT changes the 
destination address to the machine the rule is on, therefore it will not get 
to the destination.

If it's on the receiver, then the problem is that you've put the rule in the 
POSTROUTING chain, which is not traversed by incoming packets, so they never 
see the rule.

From the description above in your first paragraph it sounds like you want to 
run the netfilter rule on the machine which is receiving the traps, so try 
this instead:

iptables -A PREROUTING -t nat -p udp --dport 162 -j REDIRECT --to 4162

 
Antony.

-- 

There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

