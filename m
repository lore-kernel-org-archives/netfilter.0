From: ip tables <iptables_help@yahoo.com>
Subject: Nat and dmz
Date: Sun, 15 Feb 2004 20:04:34 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040216040434.24148.qmail@web20725.mail.yahoo.com>
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
To: ip tables <netfilter@lists.netfilter.org>

Hello group,

I have done some rules to have a natted DMZ. I have
written the portion for access from the company
network to the dmz and back. 
I could access a domino server (port 1352) which is in
the dmz without any problems. But the Domino server in
the DMZ cannot access the mail hub in the company
network with my ruleset.
If i turn off the script and just invoke :

iptables -t nat -A POSTROUTING -o eth2 -j SNAT
--to-source 10.2.240.19

it works, i could connect to the company networks mail
hub. At the time of this executing no other rules
apply.

eth0 - internet
eth1 - dmz
eth2 - lan

I will be attching the script:

/sbin/depmod -a
#Required modules
/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
#/sbin/modprobe iptable_filter
#/sbin/modprobe iptable_mangle
#/sbin/modprobe iptable_nat
#/sbin/modprobe ipt_LOG
#/sbin/modprobe ipt_limit
#/sbin/modprobe ipt_state

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

iptables -t nat --policy PREROUTING DROP
iptables -t nat --policy OUTPUT DROP
iptables -t nat --policy POSTROUTING DROP

iptables -t nat -A PREROUTING -i eth2 -p tcp --sport
1:65535 \
--dport 80 -d 10.2.240.19 -j DNAT --to-destination
192.168.128.5:80

iptables -t nat -A PREROUTING -i eth2 -p tcp --sport
1:65535 --dport 1352 \
-d 10.2.240.19 -j DNAT --to-destination
192.168.128.5:1352

iptables -A FORWARD -i eth2 -o eth1 -p tcp --sport
1:65535 \
--dport 80 -d 192.168.128.5 -m state --state NEW -j
ACCEPT
iptables -A FORWARD -i eth2 -o eth1 -p tcp --sport
1:65535 \
--dport 1352 -d 192.168.128.5 -m state \
--state NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i eth2 -o eth1 -p tcp -m state \
--state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth2 -o eth1 -p udp -m state \
--state ESTABLISHED,RELATED -j ACCEPT

iptables -t nat -A POSTROUTING -o eth2 -j SNAT
--to-source 10.2.240.19

iptables -A FORWARD -p tcp -o eth2 --dport 1352 -m
state \
--state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p udp -o eth2 --dport 1352 -m
state \
--state NEW,ESTABLISHED,RELATED -j ACCEPT

Thanks for your time!!



__________________________________
Do you Yahoo!?
Yahoo! Finance: Get your refund fast by filing online.
http://taxes.yahoo.com/filing.html

