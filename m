From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: limiting bandwidth with iptables or squid?
Date: Sun, 31 Oct 2004 11:40:56 +0000
Message-ID: <4184CF48.10605@dsl.pipex.com>
References: <web-493669244@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-493669244@mail01.infosat.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: it clown <suse@mailbox.co.za>
Cc: netfilter@lists.netfilter.org

it clown wrote:
> Hi All,
> 
> I am abit confused with tc.
> 
> I need a string to limit band whidth for ips or mac
> addresses.
> 
> iptables -A PREROUTING -i eth0 -s x.x.x.x -t mangle -j MARK
> --set-mark 1

If you want to shape traffic from the internet to certain IPs there are 
several ways -
you could mark them on the WAN interface eg. -i ppp0. If you do it in 
PREROUTING and are doing NAT it won't work for local addresses, though.

If you do not care about shaping traffic headed for your shaping box and 
you only have one lan interface you can set up HTB/CBQ/HFSC egress on 
eth0. You could then use POSTROUTING to mark IPs which will be denatted 
  at that point.

> 
> will mark the packets for that ip.i think.
> 
> what string for tc do i need to limit x.x.x.x to say 5kb/s
> download speed? eth0 is my internal network card of my
> linux box.
>


I would use HTB - there are examples and links on www.docum.org / LARTC 
how to.

You will need to run at about 80% of your link speed.

Andy.


