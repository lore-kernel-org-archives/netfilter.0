From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Broadcast Traffic Control!!!
Date: Mon, 11 Jul 2005 13:15:43 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507111315130.20556@yvahk01.tjqt.qr>
References: <ab5428f7050625141733f681a@mail.gmail.com>
	<ab5428f705062514221a0e850e@mail.gmail.com>
	<20050711073819.GG15121@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050711073819.GG15121@sunbeam.de.gnumonks.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harald Welte <laforge@netfilter.org>
Cc: netfilter@lists.netfilter.org


>> is it possible to filter BC packets using IPTABLES or in any other methods. 
>
>ARP packets are not IP packets.  Therefore you need to use arptables,
>not iptables.

Or ebtables while you're at fun with bridges. :)


Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/


