From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 17:48:50 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506201747250.4249@yvahk01.tjqt.qr>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <49bf7d7050620083448c1dee9@mail.gmail.com>
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
To: "terry l. ridder" <artisticforge@gmail.com>
Cc: netfilter@lists.netfilter.org


>at the 2nd lines of defenses the following is seen:
>
>date and time is utc.
>
>2005-06-18 08:20:38.310864 IP 200.221.11.147.29937 >
>204.238.34.206.25: R 0:0(0) win 0

This looks to me like tcpdump output. As far as I understand, the "listener" 
(used by iptraf, tcpdump, etc.) listens before iptables does it works, so you 
always see packets. - even those which are to be DROPed.

Take a client connected to eth2 and listen on the eth2 bus. There should not 
be anything.

>2005-06-18 08:35:33.035504 IP 200.221.11.147.9618 > 204.238.34.206.25:
>R 3184482893:3184482893(0) win 64240
>2005-06-18 09:12:47.772699 IP 200.221.11.147.37399 >
>204.238.34.206.25: R 0:0(0) win 0


Jan Engelhardt                                                               
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

