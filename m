From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Fwd: Re: Can reach some websites, can't reach others
Date: Sat, 22 May 2004 11:59:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405221159.41811.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


	Oooops ... didn't review the "to line" before I sent.
	forwarding to the list for historical record.

----------  Forwarded Message  ----------

Subject: Re: Can reach some websites, can't reach others
Date: May 22, 2004 08:41 am
From: Alistair Tonner <Alistair@nerdnet.ca>
To: sr@gimp.org

On May 22, 2004 07:59 am, Sven Riedel wrote:
> Hi,
> I'm using a Linux 2.6.6 box as a masquerading firewall via dialup for a
> local network. From the internal network I can reach some websites (e.g.
> www.debian.org) but can't reach others (e.g. www.freshmeat.net). The
> unreachable sites _can_ be reached from the firewall-box itself though.
>
> Throwing out all references to DROP in my firewall rules and setting the
> policies of INPUT, OUTPUT and FORWARD to ACCEPT didn't change the
> situation, so I doubt it's the rules used (they're appended down below
> anyway, you never can tell...).
>
> An ethereal dump of a connection to the sites that fail from the internal
> network shows that the 3-way handshake progresses as usual, but then the
> sites server sends a "Previous TCP Segment Lost" message and all traffic
> ceases.

	<Beaucoup Snippage for brevity>

	You don't mention what your connection is -- But I'm betting you are on some
sort of DSL --  likely using something like pppoe to connect.  There is an
issue with DSL pppoe connections from downstream boxen that DON"T do
intelligent PMTU discovery .... like *cough* windows. You need a tweak that I
don't see in your firewall as posted.

	iptables -I POSTROUTING -t mangle -o (output device) -p tcp -m tcp  \
--tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

	replace output device appropriately of course, ... Some folks put this in
FORWARD chain but I figure to get *everything* in mangle POSTROUTING.

	Alistair Tonner...

> Regs,
> Sven

-------------------------------------------------------

