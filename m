From: Valentijn Sessink <valentyn+netfilter-users@nospam.openoffice.nl>
Subject: Re: [despammed] port based filtering and IPsec 2.6
Date: Thu, 22 Jan 2004 13:43:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040122124323.GA12974@openoffice.nl>
References: <20040114162623.GR4106@openoffice.nl> <20040117134519.GA4911@kaufbach.delug.de> <20040121153748.GA2715@openoffice.nl> <20040121154420.GH27986@torres.ka0.zugschlus.de> <20040121163130.GC2715@openoffice.nl> <20040121214643.GA1308@torres.ka0.zugschlus.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040121214643.GA1308@torres.ka0.zugschlus.de>
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
To: Marc Haber <mh+netfilter@zugschlus.de>
Cc: netfilter@lists.netfilter.org

Hello Marc,

At Wed, Jan 21, 2004 at 10:46:43PM +0100, Marc Haber wrote:
> > Why is that error prone? If your concern is putting out unencrypted packets
> > to certain networks, you can just use -p esp.
> My concern is that I'd need to maintain the list of networks that
> should be reached only via ipsec twice: Once in the ipsec setup, and
> once in the packet filter. With a dedicated interface, I'd only have
> to maintain it in the ipsec setup with the packet filter automatically
> following with rules on --out-int ipsecfoo.

That wouldn't help you with egress-filtering. You'd still need a rule to
prevent unencrypted packets going out to your eth0 interface.

> > It is no more or less complicated to say "-i ipsec0" or "-m mark --mark 1".
> But the interface comes automatically, while one would need to worry
> about putting the mark on the packet.

Easy enough: put a mark on *all* outgoing packets, then filter ESP packets
with a mark in the POSTROUTING table.

> This works "fine" for incoming packets, but gets ugly for outgoing
> packets.

OK, I think I understand what you mean, and I think I've found a solution
here, too. Your concern is that once a packet is in OUTPUT, it could be gone
if there's no post-encryption stage. Luckily, I found out there is one.
 On output, the output packets go unencrypted in the OUTPUT table,
then go encrypted through POSTROUTING, so you can filter unwanted
un-encrypted packets there.

Suppose you have something like
filter bla bla bla $foo $portnumberfoo -o ethX
filter bla bla bla $bar $portnumberbar -o ipsec0

What you "conceptually" say is that for some port/IPsec combinations you
would do Something, and for some port/unencrypted combinations you would do
SomethingElse

Suppose you want to convert this to 2.6 IPsec. You would setup a tunnel and
make rules to mark the combinations:

mark --set-mark 1 -A OUTPUT bla bla bla $foo $portnumberfoo
mark --set-mark 2 -A OUTPUT bla bla bla $bar $portnumberbar

Then use this mark to filter in the POSTROUTING chain to do Something or
SomethingElse.

> You mean a setup like "send everything to a.b.c.d/e through the ipsec
> tunnel, except for traffic to a.b.c.d/e TCP port 22"? Right, that's
> not possible with FreeS/WAN. Can 2.6 ipsec do that?

FreeS/WAN can do that, too, I think, but you'd need policy routing for that.
Yes, 2.6 IPsec can do that by design.

> Not at all. Looks like two non-native speakers misunderstanding each
> other.

Grin ;-)
Unsere Amerikanische Freunde werden kein Deutsch verstehen. En Nederlands is
misschien ook voor jou wat lastig.

> Well, most systems make a tunnel look like a dedicated connection on a
> "virtual network interface". This makes sense, and is more natural to
> handle, IMO, than having to fiddle with marks in a number space that
> might already be populated for traffic shaping or policy routing.

I now understand. Yes, the concept is different and there is not enough
documentation about the table traversing of the packets. I did some testing
to find this out, but still have no 100% idea of the route packets take. A
nice ASCII drawing could really help here ;-)

Best regards,

Valentijn
-- 
http://www.openoffice.nl/   Open Office - Linux Office Solutions
Valentijn Sessink  valentyn+sessink@nospam.openoffice.nl

