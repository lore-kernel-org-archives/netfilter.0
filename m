From: Daniel Wittenberg <daniel-wittenberg@starken.com>
Subject: Re: Unassigned Networks List
Date: 08 Mar 2003 00:48:47 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047106127.2050.56.camel@runabout.noc.starken.com>
References: <NGBBIFPIJNDPMFBPKBPGOEJIDKAA.NetFilter-Users@Compucenter.org> 
	<000701c2e53d$72cc42b0$026410ac@honor>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000701c2e53d$72cc42b0$026410ac@honor>
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
To: Netfilter <netfilter@lists.netfilter.org>

Just something of interest I ran into the other day with a client.  We
moved them to a new building, and setup their new wireless connection,
and for the life of me couldn't ping their provider, but everyone else. 
It seems their provider is using 172 and 10.x addresses for their
wireless towers, and gateways to the internet.  So if I traceroute to
the client I get public -> public -> private -> private -> private ->
public.  It didn't work going out from the client at first because we
drop all reserved addresses on the public NIC of the firewall, so we
couldn't ping the provider.  I subsequently got in an "discussion" with
their CTO about RFC 1918 on how it's probably not good to be using
private IP's to route public traffic, at least IMHO.

Dan

On Sat, 2003-03-08 at 00:39, Sascha Reissner wrote:
> From: "George J. Jahchan, Eng." <NetFilter-Users@Compucenter.org>
> 
> [...]
> 
> > As mentioned before, classes A & D networks are fairly well documented on
> > IANA's site <http://www.iana.org/assignments/ipv4-address-space>, but B
> and
> > C are listed as "various registries" and in bulk, which is of no help.
> > I need a list of 128~191 and 192~223 netblocks which are either reserved
> or
> > not assigned.
> 
> [...]
> 
> so you plan on checking currently unassigned ip blocks on a daily base just
> in case some ISP suddenly gets such a block assigned?
> 
> well, there are for sure some efford/reward relations that are not worth
> doing.. this is one of them ;)
> 
> if you want security, unplug the network cable ;-)
> 



