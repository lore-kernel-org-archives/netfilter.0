From: Martin Petruzzi <m.petruzzi@bluewin.ch>
Subject: Re: Changes in kernel >= 2.4.20 ? -> YES
Date: Tue, 18 Nov 2003 18:22:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031118182238.7b493120.m.petruzzi@bluewin.ch>
References: <20031117110642.73ee78fc.m.petruzzi@bluewin.ch>
	<200311180419.hAI4JvD1013995@server5.bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311180419.hAI4JvD1013995@server5.bandwidthco.com>
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
To: markee@bandwidthco.com, Alistair Tonner <Alistair@nerdnet.ca>
Cc: netfilter@lists.netfilter.org

Alistair, Mark

On Mon, 17 Nov 2003 08:31:21 -0500
Alistair Tonner <Alistair@nerdnet.ca> wrote:

> 	Running slackware and 2.4.x kernels, I have NOT had to change my iptables 
> rules from 2.4.9 through 2.4.22. on iptables 1.2.7a
> 	I have yet to upgrade to latest iptables ... but note that this is likely a 
> kernel config issue.   ... perhaps tcp_ecn got turned on somewhere?
> 	ipmtu issue maybe? are you on DSL?


On Mon, 17 Nov 2003 20:19:58 -0800
"Mark E. Donaldson" <markee@bandwidthco.com> wrote:

> Are you sure you're not having a PMTU problem?  It's unlikely that iptables
> will work sometimes but not others.  Try adding this rule: 
> 
> $IPT -t filter -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
> --clamp-mss-to-pmtu 

You are both right with MTU! And, yes Alistair I am on DSL with an Alcatel Speedtouch USB.

I didn't have to add the mentioned roule to iptables, it was enough to add the mtu/mru options in the pppd-options.

For other Alcatel users reading this, put:
mtu 1430
mru 1430
...into /etc/ppp/options

You still see the messages (which confused me):
... pppd[...]: Couldn't increase MTU to 1500
... pppd[...]: Couldn't increase MRU to 1500

But then NAT/masquerading works!

This is only since kernel 2.4.20, no problem before and no matter what version of iptables.

I think the same issue concerns Fritz!DSL, a PCI card for ADSL on ISDN lines (To be checked!)

Thank you very much indeed.

Martin

