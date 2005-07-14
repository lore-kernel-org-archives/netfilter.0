From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: firewall ignore the rule
Date: Thu, 14 Jul 2005 11:40:35 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507141139440.18072@yvahk01.tjqt.qr>
References: <2452665f0507130352544ab556@mail.gmail.com>
	<1121252895.11584.6.camel@anduril.intranet.cartel-securite.net>
	<2452665f05071318551f788f42@mail.gmail.com>
	<20050714020155.GA26028@bender.817west.com>
	<2452665f0507131910300b00de@mail.gmail.com>
	<20050714021032.GA26090@bender.817west.com>
	<2452665f0507131919823198c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2452665f0507131919823198c@mail.gmail.com>
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


>u mean blocking the MAC address also doesnot do any good. hmm i
>thought iptables is that powerful.

There is a reason it's called _IP_tables.

What iptables can do for you is block *IP* packets with certain MAC addresses.


Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

