From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables bridge filter question
Date: Thu, 18 Mar 2004 15:33:58 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403181533.58166.Antony@Soft-Solutions.co.uk>
References: <ILECICAFAJIIMPBBLMEAAELECPAA.gerryw@objectivedomain.com> <200403181524.35795.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403181524.35795.Antony@Soft-Solutions.co.uk>
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

On Thursday 18 March 2004 3:24 pm, Antony Stone wrote:

> On Thursday 18 March 2004 8:28 am, Gerry Weaver wrote:
> > Hello All,
> >
> > I have setup a bridging firewall. I want to drop packets on the external
> > interface, which have source addresses on my internal network. However,
> > the firewall/bridge sits between my T1 router and the rest of my LAN. Is
> > there a way to drop the packets mentioned previously, but allow the
> > router? I guess a rule could be created that uses the routers mac address
> > as a match. I've been playing around with this, but I'm not getting the
> > result I want. I could sure use some advice on this.
> >
> > [ LAN xx.xx.xx.0/24 ]<==>[ bridge/firewall ]<==>[ router xx.xx.xx.254/24
> > ]
>
> How about:
>
> iptables -A FORWARD -i $extIF -s xx.xx.xx.254 -j ACCEPT
> iptables -A FORWARD -i $extIF -s xx.xx.xx.0/24 -j DROP

Okay, scrub that - I overlooked the significance of it being a *bridging* 
firewall :(

Antony.

-- 
All matter in the Universe can be placed into one of two categories:

1. Things which need to be fixed.
2. Things which need to be fixed once you've had a few minutes to play with 
them.

                                                     Please reply to the list;
                                                           please don't CC me.


