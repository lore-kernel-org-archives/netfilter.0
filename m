From: netfilter-maillist <vlad@fakt.tazovsky.ru>
Subject: Re:automating iptable scripts
Date: Mon, 24 Mar 2003 09:19:02 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <401511453.20030324091902@fakt.tazovsky.ru>
Reply-To: netfilter-maillist <vlad@fakt.tazovsky.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter <netfilter@lists.netfilter.org>

Hello, netfilter.

>the script is execuable! chmod +x routeup.sh
>#!/bin/bash
>
>
>echo 1 > /Proc/sys/net/ipv4/ip_forwarding
>iptables -t nat -A POSTROUTING -o eth1 -j MASQUERED
>
>I even tried iptables scripts to let me ping my maching at certint times =
>of=20
>the day. but all fails in cron.
--------------------------------------------------------------
#!/bin/bash
echo 1 > /Proc/sys/net/ipv4/ip_forwarding
/sbin/iptables -t nat -A POSTROUTING -o eth1 -j MASQUEREDE


-- 
With best wishes,
 netfilter-maillist                          mailto:vlad@fakt.tazovsky.ru


