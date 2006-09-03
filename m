From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: modem bridge debian
Date: Sun, 3 Sep 2006 19:45:11 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609031944000.12800@yvahk01.tjqt.qr>
References: <20060903_173609_000285.okara-rj@ig.com.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060903_173609_000285.okara-rj@ig.com.br>
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
To: Marco Oliveira <okara-rj@ig.com.br>
Cc: netfilter@lists.netfilter.org

>hi people! 
>
>i have a dsl modem bridge ss4200 in my eth1 and my network on eth0! 
>but i cant do the net share on debian sarge.. 
>
>what i did: 
>
>echo "1" > /proc/sys/net/ipv4/ip_forward 
>echo "1" > /proc/sys/net/ipv4/ip_dynaddr 
>iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE 
>iptables -A FORWARD -i eth1 -j ACCEPT 
>
>(internet)---[---modem---]---{ppp0}---[---eth1---server---eth0---]---(rede 
>interna) 

If you use an ethernet bridge, it is most likely br0.
Did you mean to -i eth0?


Jan Engelhardt
-- 

