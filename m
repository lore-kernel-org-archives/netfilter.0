From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: how to log dropped packet
Date: Tue, 28 Sep 2004 11:30:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409281130.51732.Alistair@nerdnet.ca>
References: <web-6413785@infinito.it> <41595002.70706@arcor.de>
	<41598522.2060207@arcor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41598522.2060207@arcor.de>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On September 28, 2004 11:37 am, Florian Boelstler wrote:
> I forgot to paste a very important statement:
>
> Florian Boelstler wrote:
> > # DROP & LOG chain
> >
> > $IPTABLES -N DROPnLOG
> > $IPTABLES -A DROPnLOG -p ICMP -j ULOG --ulog-nlgroup 1 --ulog-prefix
> > "DROP-ICMP "
> > $IPTABLES -A DROPnLOG -p TCP -j ULOG --ulog-nlgroup 1 --ulog-prefix
> > "DROP-TCP "
> > $IPTABLES -A DROPnLOG -p UDP -j ULOG --ulog-nlgroup 1 --ulog-prefix
> > "DROP-UDP "
>
> $IPTABLES -A DROPnLOG -j DROP
>
> [ ... ]


	Indeed an important component -- the point being that user created tables 
cannot have a POLICY set and when a packet reaches the end of a user created 
table, unless otherwise set, the packet RETURNS to the calling table and 
continues to traverse it again at that point.

	(just clarifying for the record)


	Alistair.Tonner

