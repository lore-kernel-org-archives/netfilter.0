From: Scott <gneamob@yahoo.com>
Subject: Re: cant ping fw
Date: Wed, 6 Jul 2005 04:22:00 -0700 (PDT)
Message-ID: <20050706112200.28316.qmail@web54310.mail.yahoo.com>
References: <42CBBE57.5060802@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42CBBE57.5060802@eccotours.dyndns.org>
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
To: iptables <netfilter@lists.netfilter.org>

Brent,

Have you tried specifying an interface or address
range explicitly?

such as....

$IPT -t filter -A INPUT -i lo -p icmp --icmp-type
echo-request -j ACCEPT

or....

$IPT -t filter -A INPUT -d 127.0.0.0/255.0.0.0 -p icmp
--icmp-type echo-request -j ACCEPT

perhaps even combining those.. good luck!

-Scott

--- Brent Clark <bclark@eccotours.dyndns.org> wrote:

> Hi list
> 
> I soo close to pulling my hair out on this
> 
> I have a webserver with the following ruleset
> (default policy of drop)
> 
[snip]
> $IPT -t filter -A INPUT -p icmp --icmp-type
> source-quench -j ACCEPT
> $IPT -t filter -A INPUT -p icmp --icmp-type
> parameter-problem -j ACCEPT
> $IPT -t filter -A INPUT -p icmp --icmp-type
> destination-unreachable -j 
> ACCEPT
> $IPT -t filter -A INPUT -p icmp --icmp-type
> time-exceeded -j ACCEPT
> $IPT -t filter -A INPUT -p icmp --icmp-type
> echo-request -j ACCEPT
> #$IPT -t filter -A INPUT -p icmp --icmp-type !
> echo-request -j LOG
> $IPT -t filter -A INPUT -j LOG --log-prefix "[INPUT 
> DROP]: " 
> --log-tcp-options --log-ip-options
> $IPT -t filter -A INPUT -j DROP
> 
> and for the likes on my I cant work out why I cant
> ping the machine
> even localhost, does not return anything




		
__________________________________ 
Yahoo! Mail 
Stay connected, organized, and protected. Take the tour: 
http://tour.mail.yahoo.com/mailtour.html 


