From: Alireza Yazdani <yazdani1193@yahoo.com>
Subject: configure firewall & NAT & cache with each other
Date: Sat, 29 Jan 2005 20:15:39 -0800 (PST)
Message-ID: <20050130041539.25496.qmail@web51905.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hello all,

I have 2 box for cache, bandwidth manager, firewall, NAT .

one box is cache server(squid) only. and another box is bandwidth manager, firewall, NAT server.

I haven't any rule on my squid box. the default gateway of my users is my firewall box. my firewall box has 2 ethernet(user side and internet side).

ip of firewall box is :

iptables_box_ILAN=172.16.5.5 (user side)(eth0)

iptables_box_WLAN=212.213.38.100 (internet side)(eth1)

ip of cache box is :

squid_box=172.16.5.6

the default gateway of cache box is firewall box

I use of this rule for NAT :

iptables -t nat -A POSTROUTING -s 172.16.5.0/24 -o eth1 -j SNAT --to 212.213.38.100

now I want redirect the request on port 80 to cache box :

local_network=172.16.5.0/24

iptables_box_ILAN=172.16.5.5

iptables_box_WLAN=212.213.38.100

iptables -t nat -A PREROUTING -i eth0 -s ! $squid_box -p tcp --dport 80 -j DNAT --to $squid_box:3128

iptables -t nat -A POSTROUTING -s $local_network -d $squid_box -o eth0 -j SNAT --to $iptables_box_ILAN

iptables -A FORWARD -s $local_network -d $squid_box -i eth0 -o eth0 -p tcp --dport 3128 -j ACCEPT

when I don't use of NAT it is correct. and when I set all on one ethernet it is correct.

but when I have two ethernet and I NAT on firewall box it's not work correct.

Please help me.

Thanks.

 



		
---------------------------------
Do you Yahoo!?
 Yahoo! Search presents - Jib Jab's 'Second Term'
