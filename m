From: Andreas Meyer <anmeyer@gmx.net>
Subject: iptables and redirects
Date: Tue, 11 Feb 2003 20:44:31 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030211194431.1B87617C6E@delta.meyer.home>
Reply-To: anmeyer@anup.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: IPtables <netfilter@lists.netfilter.org>

Hello all!


I have problems getting PREROUTING to work.
I defined two simple rules:

iptables -t nat -A PREROUTING -i eth0 -p tcp -d 192.168.1.210 --dport 80  -j DNAT --to 192.168.1.3:3128
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 192.168.1.210 --dport 110 -j DNAT --to 192.168.1.75:110

where 192.168.1.210 is the iptables-host with squid and 192.168.1.3 als http-accelerator
      192.168.1.3   is the workstation
      192.168.1.75  is the mailserver


         |~~~~~~~~~~~~~~|----|192.168.1.75 |
---isdn--|192.168.1.210 |
         |______________|----|192.168.1.3  |

I try to telnet to the iptables-host from workstation:

telnet 192.168.1.210 80
and the connection times out.

telnet 192.168.1.210 110
and the connection times out.

Same with the Browser to the iptables-host.

I have no clue what is going on. No entries in the logs, nothing.

## Logging
iptables -N nirwana
iptables -A nirwana -p ICMP -j LOG --log-prefix "verw. ICMP Paket "  --log-level info
iptables -A nirwana -p UDP  -j LOG --log-prefix "verw. UDP Paket "   --log-level info
iptables -A nirwana -p TCP  -j LOG --log-prefix "verw. TCP Paket "   --log-level info
iptables -A nirwana -j DROP
 
iptables -A INPUT   -j nirwana
iptables -A FORWARD -j nirwana
iptables -A OUTPUT  -j nirwana

Everthing works fine if I flush the tables.

I defined two other rules:
iptables -t nat -A OUTPUT -p TCP --dport 80  -j DNAT --to 192.168.1.3:3128
iptables -t nat -A OUTPUT -p TCP --dport 110 -j DNAT --to 192.168.1.75:110

and a telnet from within the iptables-host redirects me to the wanted
host.
What am I missing? Modules are all loaded.
Is this a kernel thing? As long as I don't redirect to another host
iptables are working.

Who can help?
-- 

  Andreas Meyer

Object Class   Common Name   userPassword
posixAccount   andreas       {SSHA}hpyqObx1/BXbKFgXoqCayoGsvIgPYiVc

