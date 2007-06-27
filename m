From: "Roger Venable" <roger38@mdve.net>
Subject: ipt_recent module and UDP
Date: Wed, 27 Jun 2007 11:58:46 -0400 (EDT)
Message-ID: <39934.208.50.255.30.1182959926.squirrel@www.mdve.net>
References: <56659.68.79.98.92.1182695997.squirrel@www.mdve.net>
Reply-To: roger38@mdve.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <56659.68.79.98.92.1182695997.squirrel@www.mdve.net>
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
To: netfilter@lists.netfilter.org


Is anybody doing any type of filtering using the ipt_recent module and UDP?

>
> Hello, I have a problem with UDP traffic and use of the 'recent' module.
> I've recently modified my firewall script to use the ipt_recent module to
> help block SSH dictionary attacks, as well as attacks on certain trigger
> ports targetted by vulnerability scanning scripts. An excerpt of my
> firewall script appears below.  Notice that I am using two ipt_recent
> lists, one for SSH and one for 'scram' ports used in vulnerability scans.
>
> One of the ports I watch is UDP 1434, a Microsoft SQL Server port
> targetted by the SQL Slammer worm.  When iptables detects a new connection
> to that port, it adds the source IP to the 'scram' list, and a rule near
> the top (just after allowing established/related) eliminates further
> traffic from that source IP until timeout.  However, if I don't specify
> "-p tcp" in that enforcement rule just after established/related, it
> appears that all UDP traffic (even from source IPs not in the list) are
> dropped by those enforcement rules.
>
> I'm expecting that traffic on UDP 1434 to hit the trigger, further traffic
> from that source IP gets blocked by the 'scram' enforcement rule, and all
> other UDP traffic (like NTP) passes through to the rest of the rules.
> What is happening is that all UDP traffic is dropped.
>
> What can I do to make this work?  I think it's more to do with UDP
> connection states rather than a bug, but I'm not sure how or if I can
> structure this to operate like I want.  (Previously I was using a ulogd
> custom plugin to dynamically add mangle table rules, and a forked thread
> to clear them after timeout.  It was goofy, but it worked.)
>
> I don't think the use of more than one list has anything to do with this,
> but I thought I should include it for completeness.  I know I'm using the
> new re-written ipt_recent.c module (kernel is 2.6.18.8).  Is this a bug or
> am I missing something silly?  Thanks very much in advance for your
> assistance, all constructive comments are appreciated.
>
> --Roger Venable
> --Ann Arbor, Michigan
>
> Kernel: Linux 2.6.18.8-0.1-default #1 SMP Fri Mar 2 13:51:59 UTC 2007 i686
> athlon i386 GNU/Linux
> iptables: v1.3.6
>
> # some rules not pertaining to this example were cut
> # (and IP addresses changed to protect the innocent)
>
> # default drop
> iptables -P OUTPUT  DROP
> iptables -P INPUT   DROP
> iptables -P FORWARD DROP
>
> # accept established / related
> iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> # SCRAM rules
> # if '-p tcp' not specified here, all UDP traffic gets dropped
> # even from source addresses that are not in a 'recent' list
> iptables -A INPUT  -i eth0  -p tcp -m recent --update --seconds 60
> --hitcount 4 --name SSH  -j DROP
> iptables -A INPUT  -i eth0  -p tcp -m recent --update --seconds 3600
> --name SCRAM  -j DROP
>
> # <SNIP> more rules...
>
> # SSH
> # dictionary attacks get lost
> #
> iptables -N In_RULE_13
> iptables -A INPUT  -i eth0 -p tcp -m tcp  -d 192.168.1.68  --dport 22  -j
> In_RULE_13
> iptables -A INPUT  -i eth0 -p tcp -m tcp  -d 192.168.1.69  --dport 22  -j
> In_RULE_13
> iptables -A In_RULE_13  -j ULOG  --ulog-nlgroup 1 --ulog-prefix "SSH
> RECENT " --ulog-qthreshold 1
> iptables -A In_RULE_13 -m recent --name SSH --set -j ACCEPT
>
> # <SNIP> more rules...
>
> # scan triggers
> # when trigger ports hit by script kiddies, add to 'scram' recent table #
> iptables -N In_RULE_30
> iptables -A INPUT  -i eth0 -p tcp -m tcp  --dport 1023:1029  -j In_RULE_30
> iptables -A INPUT  -i eth0 -p tcp -m tcp  -m multiport  --dports
> 1433,3128,1761,12345,2967,37,5900  -j In_RULE_30
> iptables -A INPUT  -i eth0 -p udp -m udp  --dport 1025:1029  -j In_RULE_30
> iptables -A INPUT  -i eth0 -p udp -m udp  -m multiport  --dports 1434,500
> -j In_RULE_30
> iptables -A In_RULE_30  -j ULOG  --ulog-nlgroup 1 --ulog-prefix "SCRAM "
> --ulog-qthreshold 1
> iptables -A In_RULE_30 -m recent --name SCRAM --set -j DROP
>
> # <SNIP> more rules...
> # Here accept other UDP traffic, like NTP on UDP 123
>
> # So, Grim, you reap around here, do you?
> iptables -N RULE_36
> iptables -A OUTPUT  -j RULE_36
> iptables -A INPUT  -j RULE_36
> iptables -A RULE_36  -j ULOG  --ulog-nlgroup 1 --ulog-prefix "DEATH "
> --ulog-qthreshold 1
> iptables -A RULE_36  -j DROP
>
> # 601
>



