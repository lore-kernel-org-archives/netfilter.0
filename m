From: "Raghu Ni" <raghuni@gmail.com>
Subject: How to configure Firewall/router without aliasing
Date: Tue, 13 Jun 2006 15:56:28 +0530
Message-ID: <68869d910606130326m2602f270o8a28c680b81f7335@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

On my Linux machine I have two NICs with the following IPs on eth0 and
eth1 respectively.

  EXTIP=xxx.xxx.xxx.1 (External PUBLIC IP on eth0)
  INTGW=192.168.0.254 (Gateway for Internal Network on eth1)

  INTIP=192.168.0.1 (Internal Server)

  Normally, if any one wants to access my server which is running in
DMZ (With a private IP) then, we will write a DNAT rules in iptables
like

  iptables -p tcp -t nat -A PREROUTING -i eth0-s aaa.bbb.ccc.ddd -j
DNAT --to-destination 192.168.0.1

  or

  iptables -p tcp -t nat -A PREROUTING -i eth1 -s aaa.bbb.ccc.ddd -d
xxx.xxx.xxx.1 -j DNAT --to-destination 192.168.0.1

  Both the above rules are working fine for me.
  For ex: If a client from the ip aaa.bbb.ccc.ddd tries to connect to
port 22 on the IP xxx.xxx.xxx.1 then, it will be DNATed to
192.168.0.1. and as I mentioned above this is working fine for me.

  But, xxx.xxx.xxx.1 is my firewall's (Primary) IP which we don't want
to disclose to anybody as security concern. Instead, we want to give
another IP (Ex: xxx.xxx.xxx.2) to access my internal server
(192.168.0.1) to our client.

  One solution, which I have for this is, assigning xxx.xxx.xxx.2 as
an alias IP to my external NIC and my iptables rule should be either

  iptables -p tcp -t nat -A PREROUTING -i eth1 -s aaa.bbb.ccc.ddd -j
DNAT --to-destination 192.168.0.1
  Or
  iptables -p tcp -t nat -A PREROUTING -i eth1 -s aaa.bbb.ccc.ddd -d
xxx.xxx.xxx.2 -j DNAT --to-destination 192.168.0.1

  With this, without changing any other settings client can able to
access my internal server (192.168.0.1) from his IP (aaa.bbb.ccc.ddd)
i.e. client will do ssh to xxx.xxx.xxx.2 and because of our DNAT rule
he will be DNATed to 192.168.0.1 automatically.

  Here, creating an alias IP is not at all a secure way as both the
IPs (xxx.xxx.xxx.1 and xxx.xxx.xxx.2) are open to internet. So,
without IP aliasing, How to DNAT a packet which is coming for
xxx.xxx.xxx.2 to my internal IP.

  In simple way, with out IP aliasing How to DNAT (one to one only) on
other public IP which is not assigned on my firewall box. I believe,
in iptables, for DNAT rule, we don't require writing a separate SNAT
rule again.
=====================================================================
 While configuring Hardware firewall, we will just allocate only one
IP on WAN port and we will configure all other public to private DNAT
rules separately, in which case except the public IP which is
configured to WAN, no other IP will be exposed to Internet. I am
trying to implement the same scenario.
==================================================================================================

 Waiting for any reply,
 RaghuNi

