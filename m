From: "hard__ware" <hard__ware@hotmail.com>
Subject: re:Connection accounting stats
Date: Wed, 2 Oct 2002 20:07:08 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE33EhBZsGcZuRbr5mL000077a3@hotmail.com>
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
To: netfilter@lists.netfilter.org
Cc: wmitchell@glug.org.au

Hello Warwick,

> Just wondering if there is anyway to log how many bytes are transfered in
> a connection? Not of a rule, but of an actual connection. The PIX
> firewalls do something similar to this. Additionly it would be good to
> know the total time of the connection, but that's not necessary.

it depennds on weather you using a Network (ethernet) or dialup connection .

you could have something in /etc/ppp/ip-down.local
to outout the stats to a file and maybee even firewall stats before they may
reset
(especially with dhcp connections)

pppstats
ifconfig
iptables -L -n -v
iptables -L -n -v -t nat
(add mangle if you use it)

you can also specify certain line No, in your firewall tables so only they
are exported, ect
Refer to the iptables man pages for help on line numbering ect ..

Hope This Helps

:D

