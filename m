From: Daniel <daniel@dgd.no-ip.com>
Subject: ipt_recent entries appearing without matching rules
Date: Fri, 08 Jul 2005 22:36:18 -0500
Message-ID: <42CF4632.10009@dgd.no-ip.com>
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

I'm having a strange problem with -m recent: my iptables setup uses 4
ipt_recent entries, and I have noticed that sometimes when an address
is added to one of the chains, it appears on the /proc/net/ipt_recent/*
list for the other entries.
I am using Debian unstable, kernel 2.6.11-686-smp and iptables v1.3.1

The relevant rules are:

-A INPUT -m recent --update --hitcount 2 --name BANME --rsource 
--seconds 3600 -j DROP
-A INPUT -m recent -p tcp --dport 22 --rcheck --name SSHGO --rsource 
--seconds 300 -j loga
-A INPUT -m recent -p tcp --dport 22 --rcheck --name SSHOPEN --rsource 
-j loga
-A INPUT -m recent -p tcp --dport 12349 --set --name SSHGO --rsource -j 
logd
-A INPUT -m recent -p tcp --dport 12342 --set --name SSHOPEN --rsource 
-j logd
-A INPUT -m recent -p tcp --dport 22 --set --name SSHTRY --rsource -j logd
#more rules to allow access to services etc.
-A INPUT -m recent --set --name BANME --rsource -j DROP
-A loga -j ULOG --ulog-qthreshold 1 --ulog-prefix A
-A loga -j ACCEPT
-A logd -j ULOG --ulog-qthreshold 1 --ulog-prefix D
-A logd -j DROP

$ cat /proc/net/ipt_recent/BANME
src=192.228.79.200 ttl: 51 last_seen: 754299 oldest_pkt: 4 last_pkts: 
4294710297, 4294722481, 4294722488, 754299
src=192.228.79.203 ttl: 51 last_seen: 4294722473 oldest_pkt: 2 
last_pkts: 4294710304, 4294722473
src=200.37.124.195 ttl: 110 last_seen: 870857 oldest_pkt: 3 last_pkts: 
861797, 864823, 870857
$ cat /proc/net/ipt_recent/SSHGO
src=200.37.124.195 ttl: 110 last_seen: 861797 oldest_pkt: 1 last_pkts: 
861797
src=60.213.3.18 ttl: 110 last_seen: 3510943 oldest_pkt: 1 last_pkts: 
3510943
$ sudo iptables -vL
pkts bytes target     prot opt in     out     source               
destination
...
   6  1668 DROP       all  --  any    any     anywhere             
anywhere            recent: UPDATE seconds: 3600 hit_count: 2 name: 
BANME side:source
   0     0 loga       tcp  --  any    any     anywhere             
anywhere            recent: CHECK seconds: 300 name: SSHGO side: source 
tcp dpt:ssh
   0     0 loga       tcp  --  any    any     anywhere             
anywhere            recent: CHECK name: SSHOPEN side: source tcp dpt:ssh
   0     0 logd       tcp  --  any    any     anywhere             
anywhere            recent: SET name: SSHGO side: source tcp dpt:12349
   0     0 logd       tcp  --  any    any     anywhere             
anywhere            recent: SET name: SSHOPEN side: source tcp dpt:12342
   1    48 logd       tcp  --  any    any     anywhere             
anywhere            recent: SET name: SSHTRY side: source tcp dpt:ssh
...
   3   706 DROP       all  --  any    any     anywhere             
anywhere            recent: SET name: BANME side: source


- Daniel


