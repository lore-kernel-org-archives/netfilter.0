From: Martin Petruzzi <m.petruzzi@bluewin.ch>
Subject: Re: Changes in kernel >= 2.4.20 ? -> YES
Date: Wed, 19 Nov 2003 11:50:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031119115041.38aee642.m.petruzzi@bluewin.ch>
References: <20031117110642.73ee78fc.m.petruzzi@bluewin.ch>
	<200311180419.hAI4JvD1013995@server5.bandwidthco.com>
	<20031118182238.7b493120.m.petruzzi@bluewin.ch>
	<200311182043.18773.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311182043.18773.Alistair@nerdnet.ca>
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
To: Alistair@nerdnet.ca
Cc: netfilter@lists.netfilter.org

On Tue, 18 Nov 2003 20:43:18 -0500
Alistair Tonner <Alistair@nerdnet.ca> wrote:

> > For other Alcatel users reading this, put:
> > mtu 1430
> > mru 1430
> > ...into /etc/ppp/options
> 
> 	Doing this works, but you are forcing yourself to a certain size which 
> 	1) might be smaller than optimal, 
> 	2) could change one night unexpectedly.
> 
> 	Personally I trust the clamp mss to mtu ... it works.
> 	(for what its worth .. my MTU is somewhat larger than that...
> 	on a GVC DSL modem to ALCATEL DsLAM)

Is there a way to find out what DSLAM device my provider has or even better what mtu it uses?

I guess/claim that the support people of my provider don't know that and it would cost me a fortune to confirm this suspect. But if I'm right, you say with the clamp rule the problem is solved (seems to by dynamic then) and I don't need to know at all? Any idea why this was no problem with kernels < 2.4.20 (only wondering, not a need to know)?

By the way, I found the number 1430 a couple of times in different other maillists to be the size always working with the Alcatel Speedtouch USB, I have no idea about a technical background of exactly that size.

Martin

