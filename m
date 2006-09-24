From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables limit mach not work correctly
Date: Sun, 24 Sep 2006 09:48:17 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609240946420.28459@yvahk01.tjqt.qr>
References: <20060923184845.53578.qmail@web56215.mail.re3.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060923184845.53578.qmail@web56215.mail.re3.yahoo.com>
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
To: Elvir Kuric <omasnjak@yahoo.com>
Cc: netfilter@lists.netfilter.org

>
>iptables -A INPUT  -p icmp --icmp-type echo-reply   -j
>ACCEPT
>iptables -A INPUT -p icmp --icmp-type echo-request \
>         -m limit --limit 1/s -i eth0 -j ACCEPT

Try
  -m limit --limit 1/s --limit-burst 1

>iptables -A INPUT -p tcp --syn -m limit --limit 1/s -i
>eth0 -j ACCEPT
>
>This should limit echo-requestes on one per second on
>comp_B.
>Then I opened 4 consoles on comp_A and issued ping
>192.168.1.20 on all of them, and I got response for
>every icmp packet.
>
>Should above rules block all icpm requests, and accept
>only one per second?
>
>Did I forgot something? There is no any other iptables
>rules on  comp_B.
>
>Thanks in advance.
>
>Regards
>
>
>__________________________________________________
>Do You Yahoo!?
>Tired of spam?  Yahoo! Mail has the best spam protection around 
>http://mail.yahoo.com 
>

Jan Engelhardt
-- 

