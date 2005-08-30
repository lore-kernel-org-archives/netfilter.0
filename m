From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: iptables rule command help
Date: Tue, 30 Aug 2005 12:37:58 +0200
Message-ID: <43143706.7060204@mnemon.de>
References: <20050830100014.75637.qmail@web30206.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050830100014.75637.qmail@web30206.mail.mud.yahoo.com>
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

CC commmunication schrieb:
> Hi
> wt i want to do is just simple setup. I will be very
> thankful for the help
> 
>               firewall/Gateway   
> lan0---eth0-192.168.1.253/30--eth1-10.0.0.253/30-----Lan1
> 
> I want one to write the iptable rule for forwarding of
> TCP traffic from Lan0 to lan1 on the server
> 10.0.0.254/30 port www, telnet, ssh, ftp 21,22 during
> the office timeings 9 am to 5pm with syn bit set or
> stateful option New, Established, Related 

Just basic, may need some tuning. Ofcourse there are other ways to
achieve your goal.

echo 1 > /proc/sys/net/ipv4/ip_forward
modprobe ip_conntrack_ftp

iptables -P INPUT DROP
iptables -P FORWARD DROP

iptables -N ALLOWED_TIME

iptables -A INPUT -i lo -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m time --timestart 09:00 --timestop 17:00 \
         --days Mon,Tue,Wed,Thu,Fri -j ALLOWED_TIME

iptables -A ALLOWED_TIME -p tcp --dport 80 -s $LAN0 -d $LAN1 \
         --syn -j ACCEPT
...

And so on.

> and log the packet field informations as well.

Sorry, what exactly do want to log ?

HTH and have a nice time,

Joerg

