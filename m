From: horape@tinuviel.compendium.com.ar
Subject: Re: DNATing packets sent to the NATing box
Date: Sun, 14 Dec 2003 12:39:10 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031214153910.GB14170@tinuviel.compendium.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

> > > > Yes, and I've added a rule like this:
> > > > /sbin/iptables -t nat -A PREROUTING -j LOG and don't see the packet=
s.
> > > 	Ummmm
> > >     if you ADD the rule above after the rule that is re-routing the
> > > packet, no ... you wont see the packets.  Try
> > > 	iptables -t nat -I PREROUTING (line number)
> > > 	where (line number) is less than the line on which your DNAT line
> > > occurrs. (see iptables -t nat --line-numbers -v )
> > I'm really replacing the DNAT rule with the LOG one (only rule in the c=
hain
> > is the LOG one)
> 	This sounds *very* strange.  Perhaps more detail would give those on the=
 list=20
> a chance to determine what your problem is.=20

Thanks for your help.

> 	More detail of what the proxy is and more detail about your system setup=
=20
> would likely help us determine what course of action you need to take.

I'm running 2.4.23, I have an udp socket listening on port 5000, and a rule
that says:

iptables -t nat -A PREROUTING -p udp -j LOG --log-prefix "PREROUTING: "

(that's not the rule that I want, but it seems clearer with that one)

And when the box receives packets for udp 5000, the socket gets it, but
the rule doesn't see it.

Saludos,
					HoraPe
---
Horacio J. Pe=F1a
horape@compendium.com.ar
horape@uninet.edu

