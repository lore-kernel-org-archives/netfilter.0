From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: NAT PREROUTING chain ignored on returning traffic ??
Date: Sat, 30 Aug 2003 22:31:03 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308302220210.5528@xena.cft.ca.us>
References: <3F4FA204.6010605@xs4all.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F4FA204.6010605@xs4all.nl>
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
To: Zoilo <zoilo@xs4all.nl>
Cc: netfilter@lists.netfilter.org

On Fri, 29 Aug 2003, Zoilo wrote:
> I have 2 machines connected via a LAN: 192.168.192.254 and
> 192.168.192.123. I will call the '254' and '123' from now on.
--- snip ---
> Then I did a single 'ping' from one to the other, and vice versa, while
> logging at 123.
--- snip ---
> To my astonishment, in II) the returning ICMP packets do *not* travel
> through the NAT PREROUTING chain! In I) however, the incoming packets
> *do* travel through the NAT PREROUTING chain, as expected.

The NAT PREROUTING chain is for packets from outside the machine that
initiate a connection (whether thru traffic, or destined for the machine
itself).  ICMP echo exchanges are tracked by conntrack and count as a
connection.  So when on 254 you do "ping 123", 123 will log the packet in
the NAT table, whereas on 123 you do "ping 254", but the answer is part of
the established connection.  The only NATting that will happen, happens on
254 when it gets the echo query packet.

Hope this helps!

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

