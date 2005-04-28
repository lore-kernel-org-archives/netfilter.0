From: Jason Opperisano <opie@817west.com>
Subject: Re: How to stop the flood?
Date: Thu, 28 Apr 2005 12:35:34 -0400
Message-ID: <20050428163534.GA30227@bender.817west.com>
References: <007501c54bf7$1c0f0980$3b3429c4@rp>
	<20050428141623.GA29844@bender.817west.com>
	<00c701c54c01$3ba1b9a0$3b3429c4@rp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <00c701c54c01$3ba1b9a0$3b3429c4@rp>
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
To: netfilter@lists.netfilter.org

On Thu, Apr 28, 2005 at 05:47:42PM +0300, Rikunj wrote:
> Thankyou for the reply.
> 
> This was the log from one of my client who was attacked from a client on
> other subnet.
> 
> My network consist of clients from different subnets of /24.
> 
> The attacks from one subnet travels through my linux router and hits the
> client on other subnet.
> 
> I tried few rules as below but seems not to be working.
> 
> -----------Cut From fwscript.sh-------------------------
> 
> echo 1 > /proc/sys/net/ipv4/tcp_syncookies
> echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
> echo 0 > /proc/sys/net/ipv4/conf/all/log_martians
> echo 0 > /proc/sys/net/ipv4/tcp_timestamps
> echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
> echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
> echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
> echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
> iptables -F
> iptables -t nat -F
> iptables -t mangle -F
> iptables -P FORWARD DROP
> iptables -P OUTPUT ACCEPT
> iptables -P INPUT DROP
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -p icmp --icmp-type echo-request -m length --length
> 92 -j DROP
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A FORWARD -p tcp --syn -m limit --limit 10/s -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -p ip -f  -j DROP
> iptables -A FORWARD -p tcp --tcp-flags ALL ACK,RST,SYN,FIN -j DROP
> iptables -A FORWARD -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
> iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
> iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
> iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
> iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
> iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP
> -----------------------------------------------

well, you're really not blocking much of anything with that.  if you
wish to block 192.168.25.208:

  iptables -A FORWARD -s 192.168.25.208 -j DROP

when they call to ask why "the Internet is down" invoke plan B--opening
up a can of the genuine whoop-ass.

-j

--
"Peter: You wanna talk about awkward moments? Once, during sex,
 I called Lois "Frank". Your move, Sherlock."
        --Family Guy

