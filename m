From: horape@tinuviel.compendium.com.ar
Subject: Re: DNATing packets sent to the NATing box
Date: Sun, 14 Dec 2003 12:26:13 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031214152613.GA14170@tinuviel.compendium.com.ar>
References: <20031214135211.GA11695@tinuviel.compendium.com.ar> <200312140919.04832.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200312140919.04832.JALaramie@Loudoun-Fairfax.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: netfilter@lists.netfilter.org

> > I'm really replacing the DNAT rule with the LOG one (only rule in the c=
hain
> > is the LOG one)

> If there are no other rules in the nat PREROUTING chain and assuming that=
 you=20
> don't have and mangle PREROUTING rules (you don't, do you?) then that log=
=20
> rule will see every single packet that comes in off the wire. Try this:

> iptables -A PREROUTING -p all -j LOG --log-prefix "PREROUTING: "

I do:

iptables -t nat -A PREROUTING -p udp -j LOG --log-prefix "PREROUTING: "
iptables -t filter -A INPUT -p udp -j LOG --log-prefix "INPUT: "

(I'm logged in that box via ssh, so I prefer not to do -p all)

There are no more rules than these ones.

In the log I see the INPUT ones but not the PREROUTING (only see on
PREROUTING packets to port 137, maybe some worm...)

> You should see tons output in /var/log/messages including the packets you=
're=20
> looking for. If the packets aren't there, then they aren't making it to t=
he=20
> box.

But the packets got to the INPUT rule, that should be after PREROUTING. And
got to my socket.

> Jeff

Saludos,
					HoraPe
---
Horacio J. Pe=F1a
horape@compendium.com.ar
horape@uninet.edu

