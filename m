From: Bill Tangren <bjt@aa.usno.navy.mil>
Subject: log entries from primary dns
Date: Tue, 09 May 2006 09:45:41 -0400
Message-ID: <44609D05.4050908@aa.usno.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I'm getting quite a few messages in my logs from itables. There seems to be a 
problem with packets coming from the primary DNS (10.1.1.5). The messages look 
like this (this is output from logwatch):

    From 10.1.1.5 - 334 packets
       To 10.1.5.93 - 334 packets
          Service: 32972 (udp/32972) (INPUT packet died:,eth0,none) - 1 packet
          Service: 32973 (udp/32973) (INPUT packet died:,eth0,none) - 1 packet
          Service: 32974 (udp/32974) (INPUT packet died:,eth0,none) - 1 packet
          Service: 33063 (udp/33063) (INPUT packet died:,eth0,none) - 1 packet
          Service: 33112 (udp/33112) (INPUT packet died:,eth0,none) - 1 packet

he following are some of my udp rules set:

Chain udp_inbound (1 references)
target     prot opt source           destination
ACCEPT     udp  --  10.1.5.0/24      0.0.0.0/0           udp dpt:123
ACCEPT     udp  --  10.1.0.0/16      0.0.0.0/0           udp dpts:137:139
ACCEPT     udp  --  10.1.0.0/16      0.0.0.0/0           udp dpt:445
RETURN     udp  --  0.0.0.0/0        0.0.0.0/0



I *believe* that dns is working properly on this box (10.1.5.93). For example, 
reverse lookups work when I ssh into it. Could someone tell me why I'm getting 
these messages? Is the DNS misconfigured?

Oh, I'm running RHEL ES4 (kernel version 2.6.9-22.0.2.ELsmp) on this box. Don't 
know what the DNS box is running.

Thanks!

Bill Tangren

