From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SNAT and DNAT
Date: Wed, 27 Apr 2005 22:30:55 -0500
Message-ID: <427058EF.8030102@riverviewtech.net>
References: <426E4DAC.30900@newtech.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426E4DAC.30900@newtech.fr>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: julien WICQUART <j.wicquart@newtech.fr>
Cc: netfilter@lists.netfilter.org

> Hi,
> 
> i have a special situation.
> 
> (INTERNET) ===== 210.210.210.210/eth0|firewall|10.0.0.1/eth1 ===== 10.0.0.2|server|
> 
> I want to DNAT a port of my firewall on a server inside:
> $IPTABLES -t nat -A PREROUTING -i eth0 -d 210.210.210.210 -p tcp --dport 200 -j DNAT
> - --to-destination 10.0.0.2:200
> 
> but the server inside only accept packets from the IP of the inside interface of the firewall :
> 10.0.0.1 so i need that the source IP address of the packet sent by someone(x.x.x.x) on the internet
> change in 10.0.0.1.
> 
> I try the SNAT, the MASQUERADE:
> $IPTABLES -t nat -A POSTROUTING -o eth1 -s x.x.x.x -p tcp --dport 20000 -j SNAT --to 10.0.0.1
> or
> $IPTABLES -t nat -A POSTROUTING -o eth1 -s x.x.x.x -j MASQUERADE
> it don't work.

You are DNATing to the destination port of 200 where as you are later looking for traffic headed to 20000 and thus will never match the traffic that you DNATed.

Another point (IMHO) that you might want to consider is that if you have any client systems on the inside of the firewall that will be trying to connect to the x.x.x.x server they will never get return traffic as it will be SNATed to the firewalls internal IP.  I would recommend that you add an additional "-d 10.0.0.2" match to your rule to make sure that you don't erroneously SNAT traffic that should be going else where.



Grant. . . .

