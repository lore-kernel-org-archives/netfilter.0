From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: [despammed] port based filtering and IPsec 2.6
Date: Tue, 17 Feb 2004 16:02:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040217150214.GB32337@torres.ka0.zugschlus.de>
References: <20040114162623.GR4106@openoffice.nl> <20040117134519.GA4911@kaufbach.delug.de> <20040121153748.GA2715@openoffice.nl> <20040121154420.GH27986@torres.ka0.zugschlus.de> <20040121163130.GC2715@openoffice.nl> <20040121214643.GA1308@torres.ka0.zugschlus.de> <20040122124323.GA12974@openoffice.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040122124323.GA12974@openoffice.nl>
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
To: Valentijn Sessink <valentyn+netfilter-users@nospam.openoffice.nl>
Cc: netfilter@lists.netfilter.org

Hi Valentijn,

sorry for not getting back to you for a long time, but there have been
significant changes in my life recently :-(

On Thu, Jan 22, 2004 at 01:43:23PM +0100, Valentijn Sessink wrote:
> At Wed, Jan 21, 2004 at 10:46:43PM +0100, Marc Haber wrote:
> > > Why is that error prone? If your concern is putting out unencrypted packets
> > > to certain networks, you can just use -p esp.
> > My concern is that I'd need to maintain the list of networks that
> > should be reached only via ipsec twice: Once in the ipsec setup, and
> > once in the packet filter. With a dedicated interface, I'd only have
> > to maintain it in the ipsec setup with the packet filter automatically
> > following with rules on --out-int ipsecfoo.
> 
> That wouldn't help you with egress-filtering. You'd still need a rule to
> prevent unencrypted packets going out to your eth0 interface.

yes, but that rule would only contain interface names, and no IP
addresses.

[Other stuff snipped, but kept for later reference. I won't need it at
the moment, but maybe in a few months].

> > Well, most systems make a tunnel look like a dedicated connection on a
> > "virtual network interface". This makes sense, and is more natural to
> > handle, IMO, than having to fiddle with marks in a number space that
> > might already be populated for traffic shaping or policy routing.
> 
> I now understand. Yes, the concept is different and there is not enough
> documentation about the table traversing of the packets. I did some testing
> to find this out, but still have no 100% idea of the route packets take. A
> nice ASCII drawing could really help here ;-)

Yes, documentation is an issue. However, not having a virtual
interface for the unencrypted packages will also break a lot of
pcap-based applications, for example ippl and tcpdump. With 2.6 ipsec,
it is not possible any more to debug on application level with
tcpdump, since tcpdump only sees the encrypted packets - useless.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Karlsruhe, Germany |  lose things."    Winona Ryder | Fon: *49 721 966 32 15
Nordisch by Nature |  How to make an American Quilt | Fax: *49 721 966 31 29

