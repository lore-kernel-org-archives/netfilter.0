From: a.ledvinka@promon.cz
Subject: Re: FTP Connection State Tracking Issue
Date: Mon, 29 Nov 2004 17:18:59 +0100
Message-ID: <OF3B5BCD0A.DAD425FA-ONC1256F5B.0057521A-C1256F5B.0059A145@promon.cz>
References: <1101752397.12476.3097.camel@ashutosh.teneoris.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101752397.12476.3097.camel@ashutosh.teneoris.com>
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
Content-Transfer-Encoding: 7bit
To: Ashutosh <ashutosh@teneoris.com>
Cc: netfilter@lists.netfilter.org

> Well, I thought the Connection Tracking
> and NAT Modules *for* FTP did

please correct me if i am wrong.

2 functions you have.

first is ftp NAT algorithm = kernel module ip_nat_ftp + iptables -t nat 
... rules)

second is connection tracking firewall which looks also inside of ftp 
control streams = kernel module ip_conntrack and ip_conntrack_ftp + user 
space rules iptables -t filter(implicit table) -m state --state 
NEW/ESTABLISHED/RELATED... 

4 combiantions you get.
none used
NAT no firewall
no NAT and firewall
NAT and firewall

where no firewall translates into setting all built-in chains policy to 
accept traffic (-t nat/filter/mangle 
PREROUTING/POSTROUTING/INPUT/OUTPUT/FORWARD -P ACCEPT) and having no 
additional REJECT/DROP rules

ps: for NAT you can also use dumb nat if it's 1:1 nat. that's probably set 
up somehow with "ip route/rule whatever"



