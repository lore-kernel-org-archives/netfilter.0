From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: NetFilter rules break when freeswan is enabled
Date: Sat, 23 Aug 2003 11:41:46 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308231134500.2314@xena.cft.ca.us>
References: <Pine.SOL.4.30.0308231003440.27161-100000@ericps.crc.uiuc.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.SOL.4.30.0308231003440.27161-100000@ericps.crc.uiuc.edu>
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
To: Marcelo Medici <gaucho@ericps.crc.uiuc.edu>
Cc: netfilter@lists.netfilter.org

On Sat, 23 Aug 2003, Marcelo Medici wrote:
> I am currently seeing a problem on a machine running iptables 1.2.6.
> The machine acts as a masquerade gateway for a group of rfc1918 addresses.
> When I enable ipsec0 via the freeswan project, all forwarding using nat
> ceases. The gateway server itself still has reachability outward, as well
> as inward to the private network. It is only the masquerading that stops.
>
> Has anyone seen this type of behavior before? My iptables config is quite
> large, but I can post it if a response requires it.

This may not be relevant to your situation, but I have a one-interface
bastion host which is a FreeS/WAN terminus.  Here's how I handle the
masquerading, so returning packets come back to the bastion host.  These
filter rules are shortened for clarity and not filling up mailboxes.

		# Special table for operations restricted to Mathnet.
iptables -t nat -N MATHNET
iptables -t nat -A MATHNET -p tcp --dport ipp	-j ACCEPT
iptables -t nat -A MATHNET -p udp --dport ipp	-j ACCEPT
		(etc.)

		# Traffic to this host from the internet is only allowed for
		# specific ports.
iptables -t nat -A PREROUTING -p tcp --dport ssh	-j ACCEPT
iptables -t nat -A PREROUTING -p udp --dport domain	-j ACCEPT
iptables -t nat -A PREROUTING -p udp --dport ntp	-j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport http	-j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport https	-j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport smtp	-j ACCEPT
iptables -t nat -A PREROUTING -p icmp		-j ACCEPT
		# IPsec support
iptables -t nat -A PREROUTING -p esp			-j ACCEPT
iptables -t nat -A PREROUTING -p ah			-j ACCEPT
iptables -t nat -A PREROUTING -p udp --dport isakmp	-j ACCEPT
iptables -t nat -A PREROUTING -p udp --dport ipsec-msft -j ACCEPT
		# Also accept active connections from Mathnet.
iptables -t nat -A PREROUTING -s 128.97.4.0/24	-j MATHNET
iptables -t nat -A PREROUTING -s 128.97.19.0/24	-j MATHNET
iptables -t nat -A PREROUTING -s 128.97.70.0/24	-j MATHNET
		(snip)
		# Log and toss all the other hacker crap.
iptables -t nat -A PREROUTING -m limit --limit 5/minute -j LOG
iptables -t nat -P PREROUTING DROP			# Shields up!

                # This host masquerades all outgoing forwarded traffic, so the
		# answers will come back to this host.  This is for ipsec.
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -A POSTROUTING -o eth0		-j MASQUERADE
		(snip)

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

