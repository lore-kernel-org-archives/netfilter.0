From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: [despammed] port based filtering and IPsec 2.6
Date: Wed, 21 Jan 2004 22:46:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040121214643.GA1308@torres.ka0.zugschlus.de>
References: <20040114162623.GR4106@openoffice.nl> <20040117134519.GA4911@kaufbach.delug.de> <20040121153748.GA2715@openoffice.nl> <20040121154420.GH27986@torres.ka0.zugschlus.de> <20040121163130.GC2715@openoffice.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040121163130.GC2715@openoffice.nl>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Jan 21, 2004 at 05:31:30PM +0100, Valentijn Sessink wrote:
> At Wed, Jan 21, 2004 at 04:44:20PM +0100, Marc Haber wrote:
> > On Wed, Jan 21, 2004 at 04:37:48PM +0100, Valentijn Sessink wrote:
> > > Yes you can. Re-read my post, and be creative.
> > That will work for incoming packets. And how do I protect myself
> > against configuration errors sending out unencrypted packets? I'd need
> > to put the mark on the packets for destination networks, which is
> > error prone.
> 
> Why is that error prone? If your concern is putting out unencrypted packets
> to certain networks, you can just use -p esp.

My concern is that I'd need to maintain the list of networks that
should be reached only via ipsec twice: Once in the ipsec setup, and
once in the packet filter. With a dedicated interface, I'd only have
to maintain it in the ipsec setup with the packet filter automatically
following with rules on --out-int ipsecfoo.

> It is no more or less complicated to say "-i ipsec0" or "-m mark --mark 1".

But the interface comes automatically, while one would need to worry
about putting the mark on the packet.

This works "fine" for incoming packets, but gets ugly for outgoing
packets.

> Apart from that, I do not exactly understand your point. AFAIK, FreeS/WAN
> will only let you setup a tunnel or no tunnel, nothing in between. If you
> would want to send some traffic through the tunnel, you would need a whole
> lot of non-trivial policy routing rules. (But maybe I'm mistaken here).

You mean a setup like "send everything to a.b.c.d/e through the ipsec
tunnel, except for traffic to a.b.c.d/e TCP port 22"? Right, that's
not possible with FreeS/WAN. Can 2.6 ipsec do that?

> > The idea is nice, but it looks like an ugly hack. And it _is_ an ugly
> > hack.
> 
> IPsec tunnel mode is an ugly hack?

Not at all. Looks like two non-native speakers misunderstanding each
other.

> I wouldn't know what is ugly about marking packets to post-process them
> later.

Well, most systems make a tunnel look like a dedicated connection on a
"virtual network interface". This makes sense, and is more natural to
handle, IMO, than having to fiddle with marks in a number space that
might already be populated for traffic shaping or policy routing.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Karlsruhe, Germany |  lose things."    Winona Ryder | Fon: *49 721 966 32 15
Nordisch by Nature |  How to make an American Quilt | Fax: *49 721 966 31 29

