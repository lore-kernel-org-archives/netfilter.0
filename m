From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: OT: curious about eth0/eth1
Date: Wed, 8 Jan 2003 09:21:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030108092153.4afe140c.arnt@c2i.net>
References: <6620000.1041983993@leverage>
	<200301072247.24369.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200301072247.24369.netfilter@newkirk.us>
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

On Tue, 7 Jan 2003 22:47:24 -0500, 
Joel Newkirk <netfilter@newkirk.us> wrote in message 
<200301072247.24369.netfilter@newkirk.us>:

> On Tuesday 07 January 2003 06:59 pm, Tommy McNeely wrote:
> > I am curious about why people choose to make a certain interface
> > internal or external...
> 
> > I notice several people pick eth0 as their outside interface, and
> > sorta "oh yea" the rest of the inside network is on eth1.  I know
> > the linux kernel could really care less what they are called, its
> > mostly a"neatness" thing I guess... Also it seems like that leaves
> > your box open to attack from the time it installs (if you do a NET
> > based install) till the time you get around to actually putting a
> > firewall on it.
> 
> Why would this in particular leave a box exposed?
> 
> I think that the main reason for 'some one way, some the other' is
> random chance.  However, consider this scenario:
> 
> You have two NICs, eth0 and eth1. The connections on one you trust (-i
> 
> eth0 -j ACCEPT), the other you don't.  One of them fails, or the board
> 
> works loose from it's socket, or something, so that upon booting the 
> machine you only have one interface.  No matter which board fails, the
> 
> remaining board would be eth0.  If eth0 is your 'trusted' internal 
> network in normal conditions, and it fails, then suddenly the
> untrusted network is operating under the trusted network's rules. 
> However, the IP assignment (if static!) would remain that of the
> trusted network, so as long as eth0 is configured with a static IP
> this shouldn't present a risk.  If, however, both are dynamic, (say
> DHCP assigned) then this would qualify as a security hole, possibly a
> huge one.  To be fair, this is probably a very rare intersection of
> situations, but if eth0 is the untrusted network, then any failure
> would be an annoyance, not a risk.

..in a hobbyist environment, agreed.  In business, you want to minimize
the impact of such failures, the easiest way is to use the hardware
addresses to ID your nics, if one fails, only it fails, without leaving
the entire box open for outsiders on the "now trusted" nic.  ;-)


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



