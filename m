From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FAQ 3.13, but on the same box
Date: Mon, 19 Jul 2004 10:56:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407191056.54823.Antony@Soft-Solutions.co.uk>
References: <20040718173200.GC718@always.joy.eth.net> <200407190951.37947.Antony@Soft-Solutions.co.uk> <20040719094454.GB1735@always.joy.eth.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040719094454.GB1735@always.joy.eth.net>
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

On Monday 19 July 2004 10:44 am, Joshua N Pritikin wrote:

> On Mon, Jul 19, 2004 at 09:51:37AM +0100, Antony Stone wrote:
> > On Monday 19 July 2004 3:00 am, Joshua N Pritikin wrote:
> > > On Sun, Jul 18, 2004 at 06:44:22PM +0100, Antony Stone wrote:
> > > > http://www.squid-cache.org/Doc/FAQ/FAQ-17.html#ss17.4
> > >
> > > This FAQ doesn't address my question.  I also looked at "Transparent
> > > Proxy with Linux and Squid mini-HOWTO" by Daniel Kiracofe.
> > >
> > > So far, all docs assume that the squid-box and the browser box are
> > > different machines.
> >
> > No, the link I posted is specifically for Squid + Netfilter on the same
> > machine - you can tell this by the fact it uses REDIRECT, not DNAT.
>
> I tried that rule already.  It only works for other machines on my
> network which are using the proxy as a gateway.
>
> I am trying to do Squid + Netfilter + BROWSER on the same machine.

Oh, right - I hadn't appreciated that part before.   I thought you just meant 
transparent proxying to a proxy on the gateway instead of to a proxy 
somewhere else.

In that case you either need to DNAT your OUTPUT packets, as per your previous 
posting, or else just tell the local browser to use the local proxy (which I 
suspect is much the simplest solution in terms of understanding when 
something odd happens in the future).

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


