From: "Marcin Michalak" <marcin@telscom.ch>
Subject: Policy routing for IPv4 and IPv6
Date: Wed, 03 Mar 2004 12:00:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4045C8C7.16258.29A8EEBA@localhost>
Reply-To: marcin@telscom.ch
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-description: Mail message body
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
To: netfilter@lists.netfilter.org

Hello,
 I have the following situation: two interfaces, eth0 and eth1 with 
different IPv4 and IPv6 addresses. I want to send some type of 
traffic, let's say web requests over eth1, and everything else over 
eth0.
 I created the table table1 in the /etc/ip_route2/rt_tables by 
putting:
167 table1

Then I issue:
ip[6]tables -t mangle -A PREROUTING --protocol tcp --destination-port 
80 -j MARK --set-mark 1
ip rule add fwmark 1 table table1
ip route add default via 192.168.19.1 dev eth1 table table1

But it doesn't work :-( I also can't issue:
ip -f inet6 rule add fwmark 1 table table1
, because I get: RTNETLINK answers: Invalid argument
 I have kernel 2.6.1 with following modules loaded:

Module                  Size  Used by
ip6t_LOG                5312  -
ip6t_MARK               2272  -
ip6table_filter         2816  -
ipt_mark                1920  -
ipt_MARK                2240  -
ipt_CLASSIFY            2336  -
ipt_LOG                 5696  -
iptable_filter          2976  -
ip6table_mangle         2816  -
ip6_tables             17040  -
iptable_mangle          2976  -
ip_tables              16112  -

Any ideas/hints? Would be very grateful. My aim is to make the 
interface selection work over IPv6, but I wanted to start with IPv4 
first.
 Regards,
  Marcin
----------------------------------------------------------
Marcin Michalak		Research Engineer
Mobile: +41 79 330 83 51	Telscom AG		


