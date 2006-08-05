From: Mikhail <misha@mhsystems.com>
Subject: RE: Conntrack for related service
Date: Fri, 04 Aug 2006 23:53:48 -0400
Message-ID: <000901c6b842$c19de2a0$4764a8c0@mhsystems.com>
References: <"52488.2001:888:19e1::53.1154621026.squirrel"@dexter>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <"52488.2001:888:19e1::53.1154621026.squirrel"@dexter>
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
Content-Type: text/plain; charset="us-ascii"
To: m@rtij.nl
Cc: netfilter@lists.netfilter.org



-----Original Message-----
From: Martijn Lievaart [mailto:m@rtij.nl] 
Sent: Thursday, August 03, 2006 12:04 PM
To: Mikhail
Cc: netfilter@lists.netfilter.org
Subject: Re: Conntrack for related service
Should be possible using reject. Something along these lines.

-A FORWARD -m state RELATED,ESTABLISHED -j ACCEPT
# Maybe you restrict this more, for now accept RMI from everywhere
-A FORWARD -p tcp -dport $rmiport -j RMI
-A FORWARD -p tcp -dport $mssql -j MSSQL
... other rules ...

-A RMI -p tcp --tcp-flags FIN FIN -j RMIFIN
-A RMI -m recent --name rmi --set
-A RMI -j ACCEPT
-A RMIFIN -m recent --name rmi --remove
-A RMIFIN -j ACCEPT
-A MSSQL -m recent --name rmi -rcheck -j ACCEPT
-A MSSQL -j LOG --prefix "mssql without rmi "
-A MSSQL -j DROP

HTH,
M4


Thanks' a lot for the script - it did the trick! Here is my updated version:

iptables -t mangle -N RMI
iptables -t mangle -N RMIFIN
iptables -t mangle -N MSSQL

iptables -t mangle -A PREROUTING -p tcp -d $external_ip --dport $rmi_port -j
RMI
iptables -t mangle -A PREROUTING -p tcp -d $external_ip --dport @mssql_port
-j MSSQL

iptables -t mangle -A RMI -p tcp --tcp-flags RST RST -j RMIFIN
iptables -t mangle -A RMI -p tcp --tcp-flags FIN FIN -j RMIFIN
iptables -t mangle -A RMI -m recent --name rmi --set
iptables -t mangle -A RMI -j ACCEPT

iptables -t mangle -A RMIFIN -m recent --name rmi --remove
#iptables -t mangle -A RMIFIN -j LOG --log-prefix "rmi fin "
iptables -t mangle -A RMIFIN -j ACCEPT

iptables -t mangle -A MSSQL -m recent --name rmi --rcheck -j ACCEPT
iptables -t mangle -A MSSQL -j LOG --log-prefix "mssql without rmi "
iptables -t mangle -A MSSQL -j DROP

I've placed this filter in mangle table before I do my DNAT. I've also added
the rule to clean up recent list in case of RST type of disconnect.
  It seems to me though that script in this version has a flaw. Let's say
someone creates 2 instances of the same application with the same source
address and then closes one of them. I think this will effectively kill
MSSQL connection for the remaining instance. Is there any way to count RMI
connections originated from the same source IP and then start dropping MSSQL
requests only in case that count reaches 0?

Mikhail.


