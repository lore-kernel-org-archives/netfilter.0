From: Jason Opperisano <opie@817west.com>
Subject: Re: Forwarding while on same subnet...confusions
Date: Wed, 24 Nov 2004 11:06:57 -0500
Message-ID: <1101312417.3687.44.camel@hubcap.ljm.dom>
References: <dc56727e041123110948cb3a14@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dc56727e041123110948cb3a14@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2004-11-23 at 14:09, Mike Smith wrote:
> iptable -L

stylistic:  try and use iptables -vnxL, as it shows in/out interfaces
and packet counters...

> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination         
> 
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination         
> ACCEPT     udp  --  anywhere             ap9052pc.domain.com udp dpt:http 
> ACCEPT     tcp  --  anywhere             ap9052pc.domain.com tcp dpt:http 

stylistic:  HTTP doesn't use UDP port 80, just TCP.

stylistic:  your chain policies are set to 'ACCEPT' so your rules are
semi-irrelevant...

> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination         
> 
> And for the nat chains:
> 
> iptables -t nat -n -L
> 
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination         
> DNAT       udp  --  0.0.0.0/0            138.1.88.246        udp
> dpt:80 to:138.1.89.6:80
> DNAT       tcp  --  0.0.0.0/0            138.1.88.246        tcp
> dpt:80 to:138.1.89.6:80
> 
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination         
> SNAT       udp  --  138.1.89.6           0.0.0.0/0           udp
> dpt:80 to:138.1.88.246
> SNAT       tcp  --  138.1.89.6           0.0.0.0/0           tcp
> dpt:80 to:138.1.88.246
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination         
> 
> 
> It's only a theory at the moment, but I suspect my postrouting may be
> wrong because I am not on a true class C subnet???
> 
> Any guidance would be greatly appreciated.

silly question:  did you enable IP Forwarding on ap9005pc?

  sysctl net.ipv4.ip_forward

should report:

  net.ipv4.ip_forward = 1

if it doesn't:

  sysctl net.ipv4.ip_forward=1

rinse, repeat.

-j

--
"Okay, retrace your steps. Woke up, fought with Marge, ate Guatemalan
 insanity peppers, then I... Oh..."
	--The Simpsons


