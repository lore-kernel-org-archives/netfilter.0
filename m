From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: redirect squid to other proxy(windows) hearing in port 80
Date: Fri, 21 Nov 2003 16:44:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311211644.hALGir725646@onyx.rockstone.co.uk>
References: <20031121132405.56143.qmail@web40812.mail.yahoo.com> <00b901c3b04b$3d88ff10$6500a8c0@ProxY>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

On Friday 21 November 2003 4:43 pm, Antony Stone wrote:

> On Friday 21 November 2003 4:19 pm, Guillermo wrote:
> > hello!!
> > i need help with iptables and proxy squid...
> > i have a linux-proxy for tests and it is connected in the internal net
> > (LAN), but i need that this squid pass through a win2000 proxy that is
> > hearing in port 80 for all request....(view the picture)
> >
> > computers ----->squid-linux(hear port 3128)---->win2000-proxy(hear port
> > 80)----->internet (https-DNS)

> Indeed - I would actually recommend that you chain the proxies together
> using the squid configuration file, so that they know how they're
> interconnected.

Oh, I forgot to ask - why do you want have two proxies involved anyway 
(especially when one of them is running W2k)?

Antony.

-- 

The idea that Bill Gates appeared like a knight in shining armour
to lead all customers out of a mire of technological chaos
neatly ignores the fact that it was he who, by peddling
second-rate technology, led them into it in the first place.

 - Douglas Adams in The Guardian, August 25, 1995
                                                     Please reply to the list;
                                                           please don't CC me.

