From: Alexey Toptygin <alexeyt@freeshell.org>
Subject: Re: p2p: ARES
Date: Sat, 17 Sep 2005 02:06:19 +0000 (UTC)
Message-ID: <Pine.NEB.4.62.0509170202440.21716@norge.freeshell.org>
References: <NHBBLNDNFKDMKNNKGOMMEEPMMFAA.gregoriandres@yahoo.com.ar>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NHBBLNDNFKDMKNNKGOMMEEPMMFAA.gregoriandres@yahoo.com.ar>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LinuXKiD <gregoriandres@yahoo.com.ar>
Cc: netfilter <netfilter@lists.netfilter.org>

On Fri, 16 Sep 2005, LinuXKiD wrote:

> iptables -A FORWARD -m ipp2p --ipp2p -j ACCEPT
> iptables -A FORWARD -m ipp2p --ares -j ACCEPT
>
> [...]
>
> Then... emule, kaazaa , edonkey and so on  works very good
> but ARES can't connect.

Out of curiosity, have you tried putting --ares before --ipp2p?

 			Alexey

