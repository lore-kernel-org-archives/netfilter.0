From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Changes in kernel >= 2.4.20 ? -> YES
Date: Tue, 18 Nov 2003 20:43:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311182043.18773.Alistair@nerdnet.ca>
References: <20031117110642.73ee78fc.m.petruzzi@bluewin.ch> <200311180419.hAI4JvD1013995@server5.bandwidthco.com> <20031118182238.7b493120.m.petruzzi@bluewin.ch>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031118182238.7b493120.m.petruzzi@bluewin.ch>
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
To: Martin Petruzzi <m.petruzzi@bluewin.ch>, markee@bandwidthco.com
Cc: netfilter@lists.netfilter.org

On November 18, 2003 12:22 pm, Martin Petruzzi wrote:
> Alistair, Mark
>
> On Mon, 17 Nov 2003 08:31:21 -0500
>
> Alistair Tonner <Alistair@nerdnet.ca> wrote:
> > 	Running slackware and 2.4.x kernels, I have NOT had to change my
> > iptables rules from 2.4.9 through 2.4.22. on iptables 1.2.7a
> > 	I have yet to upgrade to latest iptables ... but note that this is
> > likely a kernel config issue.   ... perhaps tcp_ecn got turned on
> > somewhere? ipmtu issue maybe? are you on DSL?
>
> On Mon, 17 Nov 2003 20:19:58 -0800
>
> "Mark E. Donaldson" <markee@bandwidthco.com> wrote:
> > Are you sure you're not having a PMTU problem?  It's unlikely that
> > iptables will work sometimes but not others.  Try adding this rule:
> >
> > $IPT -t filter -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
> > --clamp-mss-to-pmtu
>
> You are both right with MTU! And, yes Alistair I am on DSL with an Alcatel
> Speedtouch USB.
>
> I didn't have to add the mentioned roule to iptables, it was enough to add
> the mtu/mru options in the pppd-options.

	The advantage of putting in the clamp rule is that you end up with the max 
MSS possible on each connection.  I've seen three different sizes on my DSL 
connection depending on what DsLAM I bind to on the other end.  It eliminates 
guessing and gets you the largest possible size.   Your system (the firewall) 
will always have this advantage, but you need to put the rule in the FORWARD 
chain so that your clients (inside) get the benefit of the largest transfer 
unit possible.
  (i've been through a few changes lately and I tell ya .. DsLam configuration 
must be a completely lost art amongst the techies... *sigh*)

>
> For other Alcatel users reading this, put:
> mtu 1430
> mru 1430
> ...into /etc/ppp/options

	Doing this works, but you are forcing yourself to a certain size which 
	1) might be smaller than optimal, 
	2) could change one night unexpectedly.

	Personally I trust the clamp mss to mtu ... it works.
	(for what its worth .. my MTU is somewhat larger than that...
	on a GVC DSL modem to ALCATEL DsLAM)
>
> You still see the messages (which confused me):
> ... pppd[...]: Couldn't increase MTU to 1500
> ... pppd[...]: Couldn't increase MRU to 1500

	Normal ... pppd by default tries to make the MTU/MRU as big as possible on 
these connections to increase efficiency .... its just hit a limit.

>
> But then NAT/masquerading works!
>
> This is only since kernel 2.4.20, no problem before and no matter what
> version of iptables.
>
> I think the same issue concerns Fritz!DSL, a PCI card for ADSL on ISDN
> lines (To be checked!)
>
> Thank you very much indeed.
>
> Martin

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

