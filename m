From: Payal@samba.org
Subject: Re: iptables : masq
Date: Thu, 13 Jun 2002 18:55:44 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <web-82525084@indiainfo.com>
References: <028401c212c3$e4e65c20$870110ac@samsi>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <028401c212c3$e4e65c20$870110ac@samsi>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Hi,
Thanks for the mail.
I could see the rules properly now.
[root]# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

But now the problem is that if I try to ping a site or external ip 
from a computer from internal network I still don't get the site.
The command I used was,
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
Thanks a lot again and waiting for the replies.

rpayal@indiainfo.com
>Use
>#iptables -t nat -L
>
>-Sathayn
>
>----- Original Message -----
>From: Payal <rpayal@indiainfo.com>
>To: <netfilter@lists.samba.org>
>Sent: Thursday, June 13, 2002 3:28 PM
>Subject: iptables : masq
>
>
>Hi,
>As I said earlier I am using Mdk Linux 8.2 with kernel 2.4.18. I am 
>trying
>to
>shift from ipchains to iptables for a simple reson that I cannot 
>connect to
>one particular ftp site where ip_masq_ftp was required in earlier 
>versions
>of
>kernel. Now this module is no longer available. So, I have to shift 
>to
>iptables since connecting to that site is really imp.
>But I am having a problem. I read briefly NAT and iptables HOWTOs and
>decided
>the rule,
>iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
>My loaded modules by lsmod include,
>ipt_MASQUERADE          1504   5  (autoclean)
>iptable_mangle          2336   0  (autoclean) (unused)
>iptable_nat            15988   1  (autoclean) [ipt_MASQUERADE]
>ip_conntrack           15180   1  (autoclean) [ipt_MASQUERADE 
>iptable_nat]
>iptable_filter          1952   0  (autoclean)
>ip_tables              11584   6  [ipt_MASQUERADE iptable_mangle 
>iptable_nat
>iptable_filter]
>
>But my problem is that inspite of giving the above command I have,
>
>#iptables --list
>Chain INPUT (policy ACCEPT)
>target     prot opt source               destination
>
>Chain FORWARD (policy ACCEPT)
>target     prot opt source               destination
>
>Chain OUTPUT (policy ACCEPT)
>target     prot opt source               destination
>
>What is wrong now? Why is'nt my rule listed?
>I even have 1 in /proc/sys/net/ipv4/ip_forward.
>Please do tell as early as possible or atleast tell me how to get it 
>working
>under ipchains.
>
>Thanks a lot in advance and bye.
>-Payal
>p.s i have some problems with my present email address, it would be 
>great if
>you can cc the mail to payal99  @  cyberspace.org
>
>
>
---------------------------------------------
http://mail.indiainfo.com
India's first ISO certified portal
Check world time at http://time.indiainfo.com

