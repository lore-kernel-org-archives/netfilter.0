From: Alejandro Flores <alejandro.flores@triforsec.com.br>
Subject: Re: Very basic question.
Date: Fri, 24 Sep 2004 10:08:46 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096031326.12880.6.camel@aflores>
References: <1096028483.12880.0.camel@aflores>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096028483.12880.0.camel@aflores>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: tom@digital-data.co.uk
Cc: netfilter@lists.netfilter.org

	Hello,

> I have tried the following, but it just seems to redirect all traffic to the
> local firewall:
> iptables -t nat -A POSTROUTING -o eth1 -s 192.168.10.2 -j SNAT --to
> 213.249.230.206

	1. -o = output interface. Your local network is connected to eth1,
wright? And you want to NAT all connections from 192.168.10.2 to
internet as 213.249.230.206, wright?
iptables -t nat -A POSTROUTING -o eth2 -s 192.168.10.2/32 -j SNAT
--to-source 213.249.230.206

> iptables -t nat -A PREROUTING -i eth2 -s 213.249.230.206 -j DNAT --to
> 192.168.10.2

	2. -s = source. You want redirect the traffic that comes from the
internet which destination is 213.249.230.206 to your internal pc
192.168.10.2, wright? 
iptables -t nat -A PREROUTING -i eth2 -d 213.249.230.206 -j DNAT
--to-destination 192.168.10.2


Regards,
-- 
--
Alejandro Flores
http://www.triforsec.com.br/
http://www.defenselayer.com/

