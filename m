From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: redirect doesn't seem to work?
Date: Sat, 9 Nov 2002 08:16:20 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211090814410.15803-100000@dell>
References: <1036471268.2912.7.camel@localhost.localdomain>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>

On 4 Nov 2002, Ben Russo wrote:

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

don't you want that to be a PREROUTING rule, not POSTROUTING?




rday (who now knows just enough to possibly give really bad advice :-)


