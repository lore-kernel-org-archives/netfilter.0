From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Setting up a local firewall
Date: Mon, 01 Aug 2005 14:51:13 +0200
Message-ID: <42EE1AC1.8040802@mnemon.de>
References: <42ED87C7.207@filefront.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42ED87C7.207@filefront.com>
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

Bryan Christ schrieb:
> I locked myself out of  my server until I rebooted it.  My goal was to
> lock down everything and allow only SSH connectivity.  Can anyone show
> me where my logic went wrong?  Here was the fatal script which I wrote:
> 
> /sbin/iptables -F INPUT
> /sbin/iptables -A INPUT -s 0/0 -j DROP
> /sbin/iptables -A INPUT -s 0/0 -m state  --state NEW,ESTABLISHED -p tcp
> --dport 22 -j ACCEPT
> 
> My guess is that I missed accepting syn packets, but I'm not ready to
> "try" again.

No, you didn't miss that. It is in NEW, but this also means, if the
first packet of a connection has only ACK set it will also be in state
NEW. Your problem is the second rule, which droppes all packets in
INPUT, so no SSH packet will ever make it to your ACCEPT rule. Simply
delete the second line and set a policy of DROP|REJECT for INPUT.

BTW, you can omitt "-s 0/0" - it is default. If I were you, I would do
it this way:

iptables -P INPUT DROP
iptables -A INPUT -p tcp --state ESTABLISHD -j ACCEPT
iptables -A INPUT -p tcp --dport 22 --syn -j ACCEPT
[Other useful rules]
iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset

Have a nice time,

Joerg


