From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Loose source routed IP packets.
Date: Tue, 23 Sep 2003 14:12:54 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0309231409290.14794@dns.toxicfilms.tv>
References: <200309231347.57709.carles@unlimitedmail.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309231347.57709.carles@unlimitedmail.org>
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
To: Carles Xavier Munyoz =?iso-8859-15?q?Bald=F3?= <carles@unlimitedmail.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

> Hi,
> Is it possible to drop ICMP loose source routed IP packets ?
> How ?
Try Fabrice Marie's ipv4options match from patch-o-matic, you would then
do a:
# iptables -A INPUT -p icmp -m ipv4options --lsrr -j DROP

Regards,
Maciej

