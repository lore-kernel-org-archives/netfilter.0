From: Kevin Dwyer <Kevin.Dwyer@algx.net>
Subject: Re: inner workings of IP tables
Date: Sun, 29 Sep 2002 21:11:13 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.40.0209292103480.19136-100000@klepto.security.algx.lan>
References: <20020929235243.RXLC6699.mta01-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020929235243.RXLC6699.mta01-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On Mon, 30 Sep 2002, Antony Stone transmitted the following:

> Okay, there *is* a version of the GUI for Solaris, but it's horrible, and is
> missing quite a number of the features of the version they want you to
> use.....

I have used it myself, and they did a half-assed port of it to Solaris
using the WindU stuff.  Plus, I was informed that if you want the latest
GUI you need to drop some *extra* cash, whereas the Windows GUI is
included.

> No, I think CP FW-1 has pretty much had state table synchronisation for as
> long as they've been supporting things like Stonebeat and VRRP to provide the
> failover.   They've certainly had it for the past 5 years.

It's possible that I hadn't seen it _work_, and mistook it as not being
present. ;)

> > ..is made more difficult when you upgrade the GUI and magically things
> > like Manual IPSEC (and who knows what else) disappear.
>
> Hmmm.   I haven't seen that, but then I haven't played with FWng.

It was a bug that popped up while upgrading the GUI to handle clusters or
something. (I was only cursorily involved so I don't know the specifics)

> At least with a CLI you're in full control, even if you need to learn
> a bit more syntax before you start typing.

Precisely.
This is seen as a drawback to some people, because you are given the gun
with which to shoot yourself in the foot.  However, I'd prefer to have a
competent firewall admin over a point-and-click lemming.


/* Kevin Dwyer                                Allegiance Internet */
/* network security engineer                   Commerce Center II */
/* email: Kevin.Dwyer@algx.net                7601 Ora Glen Drive */
/* phone: 240-616-2075                        Greenbelt, MD 20770 */
/*      >++++++++++[<++++++++++>-]<.+++++.----.[-]++++++++++.     */



