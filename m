From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to block p2p
Date: Thu, 11 Mar 2004 09:10:19 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403110910.19979.Antony@Soft-Solutions.co.uk>
References: <001201c40744$1f34a190$2a245cc2@cea05> <1078995674.15566.65.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078995674.15566.65.camel@raylinux.internal>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thursday 11 March 2004 9:01 am, Ray Leach wrote:

> On Thu, 2004-03-11 at 10:37, Tomasz Macioszek wrote:
> > Hello!!
> > I would like to block all known p2p program ( Kazaa, eDonkey, ...). I
> > would like to find patch of iptables (p-o-m) which blocks all this
> > programs??
>
> iptables -P FORWARD DROP

I would perhaps add:
iptables -F FORWARD
just to make sure they don't sneak through on any existing rules :)

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


