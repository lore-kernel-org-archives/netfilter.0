From: Mark Tessier <mt@open2web.com>
Subject: trying to get one blessed thing to work
Date: Mon, 8 Jul 2002 12:32:23 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708123223.7107dc16.mt@open2web.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.samba.org>

I have a PC running rh7.1., which I'm trying to turn into a firewall. The firewall stands between a DMZ and a LAN. I have an elaborate script which I've been trying to deploy, but so far no luck. Since I really don't know where to begin in terms of diagnosing my problem, I decided to see if I could just ping one machine on the DMZ from another on the LAN.

The first thing I did was to set the policy to drop for the forward chain as in:

iptables --policy FORWARD DROP

Next, I tried to open one door on the forward chain, allowing icmp packets of the echo request type to ping any other machine as in:

iptables -A FORWARD -o eth0 -p icmp --icmp-type echo-request -s 192.168.0.0/24 -m state --state NEW -j ACCEPT

The result is, it doesn't work.

If I do a lsmod I get what I think are the relevant modules that should allow state tracking to work (I haven't included the others):

ip_conntrack 23088 3 [ipt_state ip_conntrack_ftp iptable_nat]
ip_tables 14016 [ipt_state iptables_mangle iptables_filter iptables_nat]

Any recommendations are appreciated.

-- 
Thanks,

Mark

