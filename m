From: horape@tinuviel.compendium.com.ar
Subject: DNATing packets sent to the NATing box
Date: Sat, 13 Dec 2003 21:52:12 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031214005212.GA8217@tinuviel.compendium.com.ar>
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

I've a system that at its core has an UDP proxy that's the performance
bottleneck. I wanted to use the DNAT kernel facilities to replace my
code with the very tuned one on netfilter.

I'm adding a rule that says something like this:

/sbin/iptables -t nat -A PREROUTING -d myip -p udp -m udp --dport 5000 -j D=
NAT
		--to-destination otherip:18918

but the rule never see the packets (they never got to the chain)

I assume that it's because I've a socket listening on udp:5000, and it seems
reasonable what's happening... I'd like to add a PREPREROUTING chain that
is processed before deciding if the packet is for a local socket, can someb=
ody
give me a hint on where to look for it?

Saludos,
					HoraPe
---
Horacio J. Pe=F1a
horape@compendium.com.ar
horape@uninet.edu

