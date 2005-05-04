From: Askar <askarali@gmail.com>
Subject: multiple SNAT
Date: Wed, 4 May 2005 12:23:42 +0500
Message-ID: <a0f69e5050504002326a08e85@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter <netfilter@lists.netfilter.org>

hi,
we have a netfilter iptables base gateway (NATing), doing SNAT.

interfaces

eth0: public ip + single alias for RFC 1918 (192.168.1.x)
eth1: 192.168.50.3 (pvt)=20

Our web,mail server also have  192.168.50.x subnet ips

Now I want to SNAT the traffic to companies web server and mail via
eth1 and the rest (Internet) via eth0.
we are also MARKing port 80 traffic to send for our cache /proxy server.

Portion from the iptables ruleset.

#echo 200 cache.out >> /etc/iproute2/rt_tables
#ip rule add fwmark 1 table cache.out
#ip route add default via xxx.xxx.xxx.xx dev eth0 table cache.out
#ip route flush cache
############Ip Tables Mangle For Above Rule####################
# Mark all port 80
iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 80 -j MARK --set-ma=
rk 1

# re mark port 80 towards company web server that by passing cache/server
iptables -A PREROUTING -i eth0 -t mangle -p tcp -d xxx.xxx.xxx.xx -j
MARK --set-mark 2

# marking mail traffic to company mail server
iptables -A PREROUTING -i eth0 -t mangle -p tcp -d xxx.xxx.xxx.xx -j
MARK --set-mark 2
#


Regards

Askar Ali

--=20
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

