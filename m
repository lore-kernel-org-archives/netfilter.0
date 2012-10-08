From: Brian G <bgunlogson5@comcast.net>
Subject: Re: TPROXY doesn't properly close connections in Linux 2.6.39
Date: Sun, 07 Oct 2012 20:07:03 -0500
Message-ID: <50722737.3050202@comcast.net>
References: <50721280.4020401@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50721280.4020401@comcast.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I found this changelog on  Wed, 19 Oct 2011 07:21:35:

tproxy: copy transparent flag when creating a time wait

The transparent socket option setting was not copied to the time wait
socket when an inet socket was being replaced by a time wait socket. This
broke the --transparent option of the socket match and may have caused
that FIN packets belonging to sockets in FIN_WAIT2 or TIME_WAIT state
were being dropped by the packet filter.

Does this look like a fix to the problem I was having? What kernel 
version on kernel.org is this patch included in?

On 10/7/2012 6:38 PM, Brian G wrote:
> I've been using TPROXY for a transparent HTTP proxy. I've noticed that 
> it is not closing the connection when the other side does.
>
> The module is marked EXPERIMENTAL in Linux kernel 2.6.39. What is the 
> oldest version of the Kernel that TPROXY is not marked EXPERIMENTAL, 
> so I can upgrade to that Kernel? Or is TPROXY still marked 
> EXPERIMENTAL in the latest kernels?
>
> Why is TPROXY marked as EXPERIMENTAL? Are there any known bugs in 2.6.39?
>
> Here is the firewall script I am using to setup TPROXY:
>
> ip -f inet rule add fwmark 1 lookup 100
> ip -f inet route add local default dev eth0 table 100
> echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter
>
> iptables -t mangle -N DIVERT
> iptables -t mangle -A DIVERT -j MARK --set-mark 1
> iptables -t mangle -A DIVERT -j ACCEPT
>
> iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT
>
> iptables -t mangle -A PREROUTING -p tcp --dport 80 -j TPROXY 
> --tproxy-mark 0x1/0x1 --on-port 12380
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

