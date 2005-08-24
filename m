From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: RE: ROUTE  woes ?
Date: Wed, 24 Aug 2005 07:55:14 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508240753570.16890@yvahk01.tjqt.qr>
References: <200508231925.j7NJPMB6017123@linux01.gwdg.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508231925.j7NJPMB6017123@linux01.gwdg.de>
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
To: Ruben Cardenal <ruben@ruben.cn>
Cc: 'Brent Clark' <bclark@eccotours.dyndns.org>, 'iptables' <netfilter@lists.netfilter.org>


>> gate:/usr/src# iptables -t mangle -A FORWARD -p tcp --dport 80 -j ROUTE --
>> oif eth2
>
>  It must be used on the POSTROUTING chain of the mangle table.

Hm this sounds somewhat illogical: to route when "routing has already been 
done" (latin: postrouting). It also requires to have something like:

	ipt -t mangle -A FORWARD -i eth1 -j MARK --set-mark 7
	ipt -t mangle -A POSTROUTING -m mark --mark 7 -j ROUTE

instead of just

	ipt -t mangle -A FORWARD -i eth1 -j ROUTE


Jan Engelhardt
-- 

