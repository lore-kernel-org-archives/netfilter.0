From: Valentijn Sessink <valentyn+netfilter-users@nospam.openoffice.nl>
Subject: Re: [despammed] port based filtering and IPsec 2.6
Date: Wed, 21 Jan 2004 17:31:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040121163130.GC2715@openoffice.nl>
References: <20040114162623.GR4106@openoffice.nl> <20040117134519.GA4911@kaufbach.delug.de> <20040121153748.GA2715@openoffice.nl> <20040121154420.GH27986@torres.ka0.zugschlus.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040121154420.GH27986@torres.ka0.zugschlus.de>
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

At Wed, Jan 21, 2004 at 04:44:20PM +0100, Marc Haber wrote:
> On Wed, Jan 21, 2004 at 04:37:48PM +0100, Valentijn Sessink wrote:
> > Yes you can. Re-read my post, and be creative.
> That will work for incoming packets. And how do I protect myself
> against configuration errors sending out unencrypted packets? I'd need
> to put the mark on the packets for destination networks, which is
> error prone.

Why is that error prone? If your concern is putting out unencrypted packets
to certain networks, you can just use -p esp. And yes: a firewall setup with
IPsec *is* error prone. That's no different in FreeS/WAN, I think.

It is no more or less complicated to say "-i ipsec0" or "-m mark --mark 1".

Apart from that, I do not exactly understand your point. AFAIK, FreeS/WAN
will only let you setup a tunnel or no tunnel, nothing in between. If you
would want to send some traffic through the tunnel, you would need a whole
lot of non-trivial policy routing rules. (But maybe I'm mistaken here).

> The idea is nice, but it looks like an ugly hack. And it _is_ an ugly
> hack.

IPsec tunnel mode is an ugly hack? You might want to explain that to Bruce
Scheier: http://www.schneier.com/paper-ipsec.html

I wouldn't know what is ugly about marking packets to post-process them
later.

V.
-- 
http://www.openoffice.nl/   Open Office - Linux Office Solutions
Valentijn Sessink  valentyn+sessink@nospam.openoffice.nl

