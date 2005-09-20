From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: snat to multiple source ip
Date: Tue, 20 Sep 2005 15:37:06 +0200
Message-ID: <BAY103-DAV29F33D824B9A1C15BD651B2950@phx.gbl>
References: <BAY103-DAV7432DC634B39274E5495CB2950@phx.gbl>
	<65aa6af905092005445b3940d4@mail.gmail.com>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Edmundo Carmona wrote:

> You are using multiroute path, right?

This is my firewall/proxy schema:


        +---------+
        |         |
        |         |              ---HDSL
        |         |             /
Private |firewall |            /
--------+         +---eth0----+-----adslA
network |   &     |            \
        | Squid   |             \
        |         |              ---adslB
        |         |
        +---------+


> what is the output of

> ip route show default

> (on the router, of course).

Here is:

hdsl_default_gateway_ip dev eth0  scope link
adslB_network dev eth0  proto kernel  scope link  src adslB_ip
adslA_network dev eth0  proto kernel  scope link  src adslA_ip
hdsl_network dev eth1  scope link
my_private_network dev eth2  proto kernel  scope link  src
linux_private_ip
127.0.0.0/8 dev lo  scope link
default via hdsl_default_gateway_ip dev eth0  metric 1

Then I run this script to add ip & gw for adsl connections:

$IP address add $ip_adsl_a/$netmask_adsl_a brd + dev eth0 label
eth0:adslA
$IP address add $ip_adsl_b/$netmask_adsl_b brd + dev eth0 label
eth0:adslB

$IP route add $adsl_network_a dev eth0 src $ip_adsl_a table adslA
$IP route add default via $GW_adsl_a table adslA
$IP route add $adsl_network_b dev eth0 src $ip_adsl_b table adslB
$IP route add default via $GW_adsl_b table adslB

$IP route add $adsl_network_a dev eth0 src $ip_adsl_a table adsl
$IP route add $adsl_network_b dev eth0 src $ip_adsl_b table adsl
$IP route add default equalize table adsl \
             nexthop dev eth0 via $GW_adsl_a weight 1 \
             nexthop dev eth0 via $GW_adsl_b weight 1

$IP rule add fwmark 1 table adsl priority 400
[firewall mark packets so they are going to this routing table]

However routing and SNAT should not be related.
My question is the following.
How does SNAT work when multiple ip are specified?

iptables -t nat -I POSTROUTING -s ipX --protocol tcp
-j SNAT --to first_ip --to second_ip

Why everytime I connect to www.dnsstuff.com I get always the
first_ip? And after refreshing show me the second ip?
I *think* that the round robin cycle works on a per socket/per host
couple.
Example:

1st socket opened to a.a.a.a  -->> SNAT with first_ip
2nd socket opened to b.b.b.b  -->> SNAT with first_ip
3rd socket opened to c.c.c.c  -->> SNAT with first_ip
4th socket opened to b.b.b.b  -->> SNAT with second_ip
5th socket opened to d.d.d.d  -->> SNAT with first_ip
6th socket opened to a.a.a.a  -->> SNAT with second_ip

Can anyone confirm this? Wrong or correct?


