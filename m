From: Gaurav Sharma <gaurav@interacesso.pt>
Subject: Re: Problem with conntrack table filling
Date: Fri, 31 Mar 2006 11:07:43 +0000
Message-ID: <200603311107.43579.gaurav@interacesso.pt>
References: <442C3FED.4040706@advocap.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <442C3FED.4040706@advocap.org>
Content-Disposition: inline
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

Hi John,

Please check the value inside 
"/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established"
The default usually is 5 days, so a connection being tracked will be in the 
table for 5 days (check the 3rd field in the conntrack entries 'tcp      6 
"*418044*" ESTABLISHED........... this is the time left for the connection to 
expire).  You can should change the ip_conntrack_tcp_timeout_established to 
reasonable number as most tcp connections are active and don't have a idle 
period of 5 days and and even if some are idle for long periods (ssh , telnet 
etc.) they dont stay idle for 5 days.

Hope this helps.

~Gaurav.

On Thursday 30 March 2006 20:30, John McMonagle wrote:
> Firewall was dropping a lot of packets this morning.
>
> Had  a lot of messages like:
> Mar 30 06:30:54 fonroute kernel: ip_conntrack: table full, dropping packet.
>
> Rebooted to get it working
>
> /proc/sys/net/ipv4/ip_conntrack_max was 16k
> set to 32k.
>
> After running for a while started monitoring /proc/net/ip_conntrack
>
> at the moment have 3671 and still going up after 7 hours.
>
> Looking at it most (  3343 )of them are for razor connection from the
> mail server like this:
>
>
> tcp      6 418044 ESTABLISHED src=192.168.2.5 dst=66.151.150.22
> sport=52613 dport=2703 packets=6 bytes=364 src=66.151.150.22
> dst=24.196.120.30 sport=2703 dport=52613 packets=6 bytes=501 [ASSURED]
> use=1 tcp      6 424354 ESTABLISHED src=192.168.2.5 dst=66.151.150.22
> sport=43840 dport=2703 packets=6 bytes=364 src=66.151.150.22
> dst=24.196.120.30 sport=2703 dport=43840 packets=5 bytes=449 [ASSURED]
> use=1 tcp      6 418125 ESTABLISHED src=192.168.2.5 dst=66.151.150.12
> sport=52803 dport=2703 packets=6 bytes=349 src=66.151.150.12
> dst=24.196.120.30 sport=2703 dport=52803 packets=5 bytes=386 [ASSURED]
> use=1
>
> At least when I checked there were no tcp connections  to port 2703 from
> the mail server.
>
> What is the cause of this?
>
> More info.
> Both firewall an mail server are debian sarge.
> firewall:
> 2.6.10 kernel
>
> mailserver:
> mailscanner    4.41.3-2
> razor          2.670-1sarge2
>
> Thanks
>
> John

