From: Krystian <optimusprime@o2.pl>
Subject: Re: Bandwidth Monitor
Date: Sat, 08 May 2004 12:23:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409CB521.60703@o2.pl>
References: <006001c434da$7c6400e0$36b4fea9@SABNANIS>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006001c434da$7c6400e0$36b4fea9@SABNANIS>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Harry <hari76@omantel.net.om>
Cc: Netfilter <netfilter@lists.netfilter.org>

Harry wrote:

> Hi All,
> I have a DSL connection which has a bandwidth capacity of 3GB a 
> month...having said that I have 16 machines hooked up on the network 
> with a linux server, is there a away to capture/monitor the total 
> consumption of bandwidth utilised per machine or server basis.This is 
> complicated as I have squid also for caching.....did a lot of reserch 
> there were some scripts for iptables but I cant figure out how to use 
> it ?Has anyone used something like this B4?Help is really appreciated.
>  
> Regards
>  
> Harry
>  
> "In all this world, there is only you
> When all else ceases, there is only you" 
> -- to my MASTER!
>     Harish
> harish@sabnanis.com <mailto:harish@sabnanis.com>
> harish.sabnani@cyberhutoman.com <mailto:harish.sabnani@cyberhutoman.com>

Hi

there r couple things u can do:
1.  every rule in iptables counts bytes of data which went through it. u 
can look at the counters by using command:
iptables -L -v
or maybe more specific for FORWARD chain: iptables -L FORWARD -v

u can place a specific counter for one host:
/sbin/iptables -A FORWARD -j ACCEPT -i eth0 -m state --state ESTABLISHED 
-d 192.168.0.19 --set-counters 0 0

2. use specialized netfilter addons (patch-o-matic) for counting and 
possibly doing what ever u want with leechers. the ones u can use are 
from BASE repository: QUOTA and from EXTRA repository connbytes. the web 
site is of course www.iptabless.org

GL & HF :)

