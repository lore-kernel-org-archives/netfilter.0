From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Network configuration
Date: Sun, 15 Jan 2006 20:02:45 +0100
Message-ID: <001101c61a06$450e7860$0101000a@sterenborg.info>
References: <000301c61a02$9f6f3500$6402a8c0@sannpjl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000301c61a02$9f6f3500$6402a8c0@sannpjl>
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
To: netfilter@lists.netfilter.org

> I have tried setting up routing using these commands:
> 
> echo "ISP_1" >> /etc/iproute2/rt_tables
> echo "ISP_2" >> /etc/iproute2/rt_tables
> 
> ip route add 192.168.4.0/22 dev eth2 src 192.168.7.253 table ISP_1
> ip route add default via 192.168.100.253 table ISP_1
> ip route add 192.168.0.0/22 dev eth1 src 192.168.3.253 table ISP_2
> ip route add default via 192.168.20.253 table ISP_2
> 
> ip rule add from 192.168.7.253 table ISP_1
> ip rule add from 192.168.3.253 table ISP_2
> 
> However, this yielded no success. I have also tried a simple iptables
> forwarding configuration (without the routing config above):
> 
> iptables -A FORWARD -i eth0 -o eth2 -j ACCEPT
> iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth3 -j ACCEPT
> iptables -A FORWARD -i eth3 -o eth1 -j ACCEPT
> 
> # default policy
> iptables -P FORWARD DROP

Not looking at your routing rules ; did you also do :
echo 1 > /proc/sys/net/ipv4/ip_forward


Gr,
Rob


