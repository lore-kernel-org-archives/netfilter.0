From: "Rikunj" <rikunj@raha.com>
Subject: Re: How to stop the flood?
Date: Thu, 28 Apr 2005 17:47:42 +0300
Message-ID: <00c701c54c01$3ba1b9a0$3b3429c4@rp>
References: <007501c54bf7$1c0f0980$3b3429c4@rp>
	<20050428141623.GA29844@bender.817west.com>
Reply-To: Rikunj <rikunj@raha.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Thankyou for the reply.

This was the log from one of my client who was attacked from a client on
other subnet.

My network consist of clients from different subnets of /24.

The attacks from one subnet travels through my linux router and hits the
client on other subnet.

I tried few rules as below but seems not to be working.

-----------Cut From fwscript.sh-------------------------

echo 1 > /proc/sys/net/ipv4/tcp_syncookies
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 0 > /proc/sys/net/ipv4/conf/all/log_martians
echo 0 > /proc/sys/net/ipv4/tcp_timestamps
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type echo-request -m length --length
92 -j DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A FORWARD -p tcp --syn -m limit --limit 10/s -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p ip -f  -j DROP
iptables -A FORWARD -p tcp --tcp-flags ALL ACK,RST,SYN,FIN -j DROP
iptables -A FORWARD -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP
-----------------------------------------------

Regards,
Rikunj Patel


----- Original Message -----
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, April 28, 2005 5:16 PM
Subject: Re: How to stop the flood?


> On Thu, Apr 28, 2005 at 04:35:14PM +0300, Rikunj wrote:
> >
> > Hello All,
> >
> > I am seeing lots of this kind of scanning flood attack from different IP
> > within my
> >
> > network and even from outside.
> >
> > How can I stop and protect from this kind of attack?
>
> the word "blocked" means, well...blocked.  so you already are
> "protecting"...
>
> as for "stopping," go to the person sitting at 192.168.25.208 and kick
> their teeth down their throat.
>
> -j
>
> --
> "Peter: Wow, it's like I died and went to heaven, then God realized it
>  wasn't my time yet, so He sent me back to a brewery."
>         --Family Guy
>


