From: horape@tinuviel.compendium.com.ar
Subject: Re: DNATing packets sent to the NATing box
Date: Sun, 14 Dec 2003 10:52:11 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031214135211.GA11695@tinuviel.compendium.com.ar>
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

> > Yes, and I've added a rule like this:
> > /sbin/iptables -t nat -A PREROUTING -j LOG and don't see the packets.

> 	Ummmm
>     if you ADD the rule above after the rule that is re-routing the packe=
t,=20
> 	no ... you wont see the packets.  Try=20
> 	iptables -t nat -I PREROUTING (line number)
> 	where (line number) is less than the line on which your DNAT line occurr=
s.
> 	(see iptables -t nat --line-numbers -v )

I'm really replacing the DNAT rule with the LOG one (only rule in the chain=
 is the
LOG one)

Saludos,
					HoraPe
---
Horacio J. Pe=F1a
horape@compendium.com.ar
horape@uninet.edu

