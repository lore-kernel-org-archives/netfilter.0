From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables bridging transperant proxy
Date: Mon, 1 Aug 2005 08:54:45 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508010852230.7329@yvahk01.tjqt.qr>
References: <001501c59399$b283f940$dd0310ac@denver.medquist.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001501c59399$b283f940$dd0310ac@denver.medquist.com>
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
To: Dan Cox <dancox@speakeasy.net>
Cc: netfilter@lists.netfilter.org


>I am trying to create a rule that will send http traffic with a specific 
>source address to the proxy port of the same pc. The box I'm using is running 
>as a "bridge" and the bridge interface does not have an ip address assigned.

ebtables -A BROUTING -j BROUTE -s 1.2.3.4 -p ipv4 --ip-proto tcp --ip-dport 80
iptables -t nat -A PREROUTING -s 1.2.3.4 -j REDIRECT --to-port 3128

Though, this requires the individual bridge port(s) to have an IP...


Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

