From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT, SNAT, Portforward
Date: Fri, 1 Nov 2002 15:23:19 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211011523.gA1FNRe14921@vulcan.rissington.net>
References: <34BE59D9.590F1486.03240133@netscape.net> <20021101085825.SDDP292.mta03-svc.ntlworld.com@there> <200211010945.42719.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211010945.42719.netfilter@newkirk.us>
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

On Friday 01 November 2002 2:45 pm, Joel Newkirk wrote:

> On Friday 01 November 2002 03:58 am, Antony Stone wrote:
> > On Friday 01 November 2002 6:08 am, Joel Newkirk wrote:
> > > Question to list:  At what point in its own travels does the returning
> > > packet get automatically un-DNATed?  Prerouting again?
> >
> > No, it happens in POSTROUTING - because it is then a SNAT operation.
> >
> > Useful rule of thumb - in the FORWARD chain, all packets have their
> > "real" IP addresses.
> >
> > That's because DNAT rules have already happened in PREROUTING, so packets
> > now have the destination address of the machine they're really being sent
> > on to, and SNAT rules have not yet happened in POSTROUTING, so packets
> > still have the source address of the machine they really came in from.
>
> Is there any chance then of interference from a masquerade rule in
> postrouting? Or do the automatic reversals take precedence?

Automatic reversals take precedence.

Reply packets are matched by the entry in the connection tracking table (the 
entry which identifies them as ESTABLISHED or RELATED), and are immediately 
diverted away in the background to be processed.

A side effect of this is that there is no way of specifying a manual rule in 
the nat tables which will get applied to reply packets (other than the 
automatic reverse of what got applied to the outgoing packet).

Antony.

-- 

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

