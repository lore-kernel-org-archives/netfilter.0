From: Florian Boelstler <euphoria@arcor.de>
Subject: Re: how to log dropped packet
Date: Tue, 28 Sep 2004 17:37:06 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41598522.2060207@arcor.de>
References: <web-6413785@infinito.it> <41595002.70706@arcor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41595002.70706@arcor.de>
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

I forgot to paste a very important statement:

Florian Boelstler wrote:
> # DROP & LOG chain
> 
> $IPTABLES -N DROPnLOG
> $IPTABLES -A DROPnLOG -p ICMP -j ULOG --ulog-nlgroup 1 --ulog-prefix
> "DROP-ICMP "
> $IPTABLES -A DROPnLOG -p TCP -j ULOG --ulog-nlgroup 1 --ulog-prefix
> "DROP-TCP "
> $IPTABLES -A DROPnLOG -p UDP -j ULOG --ulog-nlgroup 1 --ulog-prefix
> "DROP-UDP "

$IPTABLES -A DROPnLOG -j DROP

[ ... ]



