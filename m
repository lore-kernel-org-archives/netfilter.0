From: =?Windows-1251?B?0eXw4+Xl4iDR5fDj5ekgzejq7uvg5eLo9w==?= <serg@dinfo.ru>
Subject: iptables -j REDIRECT
Date: Tue, 6 Jul 2004 01:08:41 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1276578354.20040706010841@dinfo.ru>
Reply-To: =?Windows-1251?B?0eXw4+Xl4iDR5fDj5ekgzejq7uvg5eLo9w==?= <serg@dinfo.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello!
I'm using iptables v1.2.11 with kernel 2.4.26 at RH8.
Also there is squid-cache 2.5.STABLE1 listening at port 3128.

They works as transparent proxy gateway for small office:

[]# iptables -A PREROUTING -t nat -i LAN -p tcp --dport 80 -j REDIRECT --to-port 3128

to manage and account data going to 80 port I did something like this:
[]# iptables -A PREROUTING -t mangle -i LAN -p tcp --dport 80 -j LOG

the question is:
how can I manage packets incoming from 80 port to my LAN?
All chains and tables(OUTPUT:mangle,nat,filter and POSTROUTING:mangle,nat) shows that one go from local_ip_of_gateway:3128.
But tcpdump started at LAN interface shows that packets go from real ip addresses and src_port 80....
In what chain and table netfilter replaces SRC_ip & SRC_port back by real?

Thank you!
-- 
Best regards,
 Sergeyev , Moscow RU                          mailto:serg@dinfo.ru


