From: "dravya" <dravya@magma.ca>
Subject: RE: Masqureading issues... packets go over wrong link
Date: Mon, 16 Aug 2004 17:05:36 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408162105.i7GL5aYn014153@webmail2.magma.ca>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Daniel Chemko <dchemko@smgtec.com>, Netfilter mailing list <netfilter@lists.netfilter.org>




Thanx again Daniel,
 
Sorry, but I am a little confused as to which rules to use. You had provided two sets of
rules.

1st:
-----------------------------------------------------------------------------------
        MY_POLICY_ETH0=1
	MY_POLICY_ETH1=2
	MY_POLICY_DEFAULT=2
	
	iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
	iptables -t mangle -A PREROUTING -i ${INET1} -m mark ! --mark 0
-j ACCEPT
	iptables -t mangle -A PREROUTING -i ${INET1} -m mark --mark 0 -j
MARK ${MY_POLICY_ETH0}
	iptables -t mangle -A PREROUTING -i ${INET2} -m mark --mark 0 -j
MARK ${MY_POLICY_ETH1}
	iptables -t mangle -A PREROUTING -i ${INET3} -m nth --every 2
--packet 0 -m mark --mark 0 -j MARK ${MY_POLICY_ETH0}
	iptables -t mangle -A PREROUTING -i ${INET3} -m nth --every 2
--packet 1 -m mark --mark 0 -j MARK ${MY_POLICY_ETH1}
	iptables -t mangle -A PREROUTING -j CONNMARK --save-mark
	
	iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
	iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
-----------------------------------------------------------------------------------


and 2nd:
-----------------------------------------------------------------------------------
IP1=1.1.1.1
IP2=2.2.2.2

	iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark
	iptables -t mangle -A OUTPUT -m mark ! --mark 0 -j ACCEPT
	iptables -t mangle -A OUTPUT --source ${IP1} -m mark --mark 0 -j
MARK ${MY_POLICY_ETH0}
	iptables -t mangle -A OUTPUT --source ${IP2} -m mark --mark 0 -j
MARK ${MY_POLICY_ETH1}
	iptables -t mangle -A OUTPUT -m mark --mark 0 -j MARK
${MY_POLICY_DEFAULT}
	iptables -t mangle -A OUTPUT -j CONNMARK --save-mark

-----------------------------------------------------------------------------------

If I am using the 1st: 

> MY_POLICY_ETH0=1
> MY_POLICY_ETH1=2
> MY_POLICY_DEFAULT=2

Where exactly do I define the above policies?

and 

> ...
> iptables -t mangle -A PREROUTING -j CONNMARK --save-mark

> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

and even though we are marking the packets, we need to MASQUERADE it? Wasn't the original
problem with Masquerading? How does this solve the problem of packets going on the wrong
link? I thought marking the packets was a substitute for Masquerading. Is my thinking all
wrong???



Lastly, What is the difference between having two routing tables, each with a default via
an eth0/ppp

> # ip route list table 1
> ..
> default via <ext_gw_eth0> dev eth0  src <ext_ip_eth0>
>
> # ip route list table 2
> ..
> default via <ext_gw_eth1> dev eth1  src <ext_ip_eth1>

and only one routing table with two default routes??

>  206.47.201.1 dev ppp1  proto kernel  scope link  src 204.101.96.143
>  204.101.237.225 dev ppp0  proto kernel  scope link  src 69.158.211.67
>  169.254.0.0/16 dev eth0  scope link
>  192.168.0.0/16 dev eth0  scope link
>  127.0.0.0/8 dev lo  scope link
>  default equalize
>       nexthop via 204.101.237.225  dev ppp0 weight 1
>       nexthop via 206.47.201.1  dev ppp1 weight 1

???

Thanks a million. I really appreciate your response.

cheers
Dravya




