From: Francesco Ciocchetti <primero@fastwebnet.it>
Subject: Re: -m physdev
Date: Mon, 27 Jun 2005 11:46:12 +0200
Message-ID: <42BFCAE4.9030001@fastwebnet.it>
References: <20050627091107.1F80F300E2@smtp.263.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050627091107.1F80F300E2@smtp.263.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: bend chen <boy2eye@263.net>
Cc: netfilter <netfilter@lists.netfilter.org>

bend chen wrote:

> hi,Francesco Ciocchetti
>
> thanks your help.
>
> i used -m physdev in my BRIDGE.
> but,did I must used -m physdev in FORWARD tables ?
>
> Can I use like these :
>
> iptables -A INPUT -m physdev --physdev-in eth0 -p tcp --dport 22 -j ACCEPT
> iptables -A OUTPUT -m physdev --physdev-out eth1 -p icmp -j DROP
>
>
>
> Thans


Sure that you can do it ... if you enabled Support for Netfilter on
Bridge devices in your kernel.

You can use physdev-in, physdev-out as you wuold use '-i' and '-o' .

Bye
P.

