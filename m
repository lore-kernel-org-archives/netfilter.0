From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: again problem with alias / virtual interface
Date: Wed, 21 Jul 2004 12:09:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FEA334.2030108@pbl.ca>
References: <b5f12e7f0973881174d3ec37f189a737@82.186.92.90>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <b5f12e7f0973881174d3ec37f189a737@82.186.92.90>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Batstru wrote:
> [root@maya root]# tcpdump -i eth1 | grep
> host91-92.pool82186.interbusiness.it
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on eth1, link-type EN10MB (Ethernet), capture size 96 bytes
> 11:31:41.895811 IP bella.dei.unipd.it.52242 >
> host91-92.pool82186.interbusiness.it.smtp: S 
> 891791967:891791967(0) win 24820 <nop,nop,sackOK,mss 1460>
> 11:31:45.257887 IP bella.dei.unipd.it.52242 >
> host91-92.pool82186.interbusiness.it.smtp: S 
> 891791967:891791967(0) win 24820 <nop,nop,sackOK,mss 1460>
> 11:31:52.006557 IP bella.dei.unipd.it.52242 >
> host91-92.pool82186.interbusiness.it.smtp: S 
> 891791967:891791967(0) win 24820 <nop,nop,sackOK,mss 1460>

OK, let's to a little test.  Instead of trying to make it work all at 
once, let start building rules from the beginning, and get simple stuff 
working first.  Flush all firewall rules you have, and do something 
simple as this:

# Flush all old stuff
iptables -F
iptables -X
chains=`cat /proc/net/ip_tables_names 2>/dev/null`
for i in $chains; do iptables -t $i -F; done
for i in $chains; do iptables -t $i -X; done

After doing this, do "iptables -L" and make sure that all chains in nat 
and mangle tables have default policy set to ACCEPT (it wouldn't be good 
if for example your POSTROUTING chain in nat table is set to drop 
packets by default).

# Simple config for testing
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth1 -p icmp --icmp-type ping -m state --state NEW 
-j ACCEPT
iptables -A INPUT -i eth1 -p tcp -d 82.186.92.92 --dport 25 -m state 
--state NEW -j ACCEPT

After this, iptables -L should show that all chains in filter table are 
set to DROP packets by default, and all chains in nat and mangle tables 
are set to ACCEPT packets by default.  It should also show only above 5 
rules in filter table (3 in INPUT chain, and 1 rule in OUTPUT and 
FORWARD chains), and no rules in nat and mangle tables.

Make sure that output of iptables -L matches what is described above. 
If it doesn't match, you have remains of old configuration still loaded, 
and you need to get rid of it somehow.  You may also use iptables-save 
and check that its output matches exactly the commands you typed above, 
and that only chains in filter table have default policy set to DROP.

 From another machine, try to ping 82.186.92.92 and to ssh into it.  If 
it works, you had an error somewhere in your rules.

If it doesn't work, try adding this three logging rules *after* the 
above set of rules:

iptables -A INPUT -j LOG --log-prefix="INPUT "
iptables -A OUTPUT -j LOG --log-prefix="OUTPUT "
iptables -A FORWARD -j LOG --log-prefix="FORWARD "

This should log all dropped packets (since you will be adding this rules 
at the end, just before packets are dropped).  The log will contain all 
information about the dropped packets (interface they were dropped from, 
in which chain, and all other interesting data).

Thinking of all this, another thing come to my mind.  Your network 
configuration.  If you have more than one interface connected to the 
same "wire" (say eth0 and eth1 connected to the same hub), Linux kernel 
does not need to send response packets that arrive to address configured 
on eth1 back to eth1.  It might as well just use eth0.  Been burned by 
that once (although in different context).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

