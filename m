From: Edmund <cc@belfordhk.com>
Subject: Re: pktstat and netfilter
Date: Wed, 06 Aug 2003 12:02:54 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F307DEE.70505@belfordhk.com>
References: <3F2F6235.5080100@belfordhk.com> <1060072266.749.8.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1060072266.749.8.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

Cedric Blancher wrote:

> It's quite wierd as one would like to capture the very traffic that is
> sent to the wire or traffic recieved from the wire unaltered, whatever
> active ruleset.
> 

What's even weird is that during a www session, most of the
packets would originate from my NAT firewall's IP, but one
or two (in a sequence) would show a LAN IP.

I'm confused as to why this is happening.

Has anyone encountered something similar?





