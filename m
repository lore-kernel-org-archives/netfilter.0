From: Alejandro Flores <alejandro.flores@triforsec.com.br>
Subject: Re: Port Forwarding with iptables
Date: Thu, 19 Aug 2004 13:39:19 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092933559.3705.7.camel@aflores>
References: <412487B7.9090505@digitalview.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <412487B7.9090505@digitalview.com>
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
To: Wilson Mak <wilson.mak@digitalview.com>
Cc: netfilter@lists.netfilter.org

	Hello Wilson,

> iptables -t nat -A PREROUTING -i eth0 -d <ext ip> -p tcp --dport 80 -j
> DNAT --to 10.1.0.12:80

	That's ok.

> iptables -A INPUT -p tcp -i eth0 -d <ext ip> --dport 80 -m state
> --state NEW -j ACCEPT

	This rule is only necessary if you have a webserver running on you
firewall. 

> iptables -A FORWARD -p tcp -i eth0 -o eth1 -d <ext ip> --dport 80 -m
> state --state NEW -j ACCEPT

	Ops. You made a mistake. You have added a rule which changes the
destination IP address to your internal webserver, remember? Your
forward rule must specify the internal address as destination.
iptables -A FORWARD -p tcp -i eth0 -o eth1 -d 10.1.0.12/32 --dport 80
--syn -j ACCEPT

Regards,
-- 
--
Alejandro Flores
http://www.triforsec.com.br/
http://www.defenselayer.com/
http://www.nabucodonosor.com/

