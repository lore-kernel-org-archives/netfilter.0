From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Single IP firewall help...
Date: Thu, 12 Sep 2002 21:06:35 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209122101100.8897-100000@dns.toxicfilms.tv>
References: <3D80D033.1020703@canada.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D80D033.1020703@canada.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Poupart <cpoupart@canada.com>
Cc: netfilter <netfilter@lists.netfilter.org>

> use.  In this case, IPTables is running on the web server.  Because I
Aaah, sorry.

Well What he proposed seemed fine.
Personally i would anyway use the state module. (that is what stateful
firewalls are for)

iptables -F
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -d <ip> --dport 80 --syn -j ACCEPT
iptables -A INPUT -p tcp -d <ip> --dport 443 --syn -j ACCEPT
iptables -A INPUT -p tcp -d <ip> --dport 22 --syn -j ACCEPT

The UDP rule is not that important, it will only tell port scanners that
the ports are open/filtered (which is not true,anyway,but it will seem
as it is).

As you said, nothing fancy :)

Regards,
Maciej Soltysiak


