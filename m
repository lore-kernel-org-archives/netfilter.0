From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: firewall ignore the rule
Date: Wed, 13 Jul 2005 12:54:19 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507131253380.14635@yvahk01.tjqt.qr>
References: <2452665f0507130352544ab556@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2452665f0507130352544ab556@mail.gmail.com>
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
To: liyas_m m <liyasmm@gmail.com>
Cc: netfilter@lists.netfilter.org


>iptables -A INPUT -s 10.5.33.22 -j DROP

Make sure that traffic is not ACCEPTed before.

>but when i run iptraf , there are still traffic sent from the source address
>Any idea why?

Iptraf bypasses netfilter and so sees _all_ packets.



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

