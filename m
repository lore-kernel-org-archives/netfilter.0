From: Alexandru Dragoi <alex@zoomnet.ro>
Subject: Re: Cannot route through an if without ip
Date: Sun, 14 May 2006 13:04:51 +0300
Message-ID: <446700C3.8060407@zoomnet.ro>
References: <20060514080905.18403.qmail@mx1.aruba.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060514080905.18403.qmail@mx1.aruba.it>
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
To: "antonio.dibacco" <antonio.dibacco@aruba.it>
Cc: netfilter@lists.netfilter.org

antonio.dibacco wrote:

>
> I have an ethernet (eth1) without any assigned ip, nevertheless I
> would like to route through this IF but issueing the following command
> gives an error:
> route add -net 192.168.1.0 dev eth1
> If the same IF has an address the command will be correctly executed.
> Why?
>
You can't do that. If you know the mac of the other router, do domething
like:

#ip ro add 172.20.20.20/32 dev eth1 scope link
#arp -s 172.20.20.20 <mac>
#ip ro add 192.168.1.0/24 via 172.20.20.20.20

So .. this just show why you can't just route throught an ethernet
device, unless you "want" to do some multicast flood.

