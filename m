From: "www.piratehosting.net" <webmazter@gmail.com>
Subject: ipconntrack
Date: Sun, 3 Oct 2004 02:41:42 -0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <e73cec800410030141797418ff@mail.gmail.com>
Reply-To: "www.piratehosting.net" <webmazter@gmail.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

i run 2 irc servers for a small hosting company.
ip contrack gets full all the time no matter what limits i set 
echo 40192 > /proc/sys/net/ipv4/ip_conntrack_max

My question is:
can i safely remove ip conntrack all together?
rmmod ip_conntrack
rmmod ip_conntrack_ftp
rmmod ip_conntrack_irc
rmmod ip_conntrack
rmmod ipt_state

I dont really understand what it does but the table keep filling up im
sure its some kinda attact on my servers.
does it do anything at all i use a simple firewall (apf) and only these rules.
in
/etc/sysctl.conf
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.icmp_echo_ignore_all = 1
net.ipv4.tcp_max_syn_backlog = 1024
net.ipv4.icmp_ignore_bogus_error_responses = 1
net.ipv4.tcp_syncookies = 1

-- 
www.piratehosting.net

