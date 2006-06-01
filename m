From: Justin Schoeman <justin@expertron.co.za>
Subject: Re: Possible conntrack problem
Date: Thu, 01 Jun 2006 14:15:13 +0200
Message-ID: <447EDA51.3020604@expertron.co.za>
References: <20060601_115618_060771.zottmann@ig.com.br>
	<02BB8A4AC86C564C89C7F14CF98CE0C4012782@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C4012782@knowledge.wizdom.nu>
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
To: Sietse van Zanen <sietse@wizdom.nu>
Cc: netfilter@lists.netfilter.org

Can also try:

echo "1" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal

Seems to help if there is a PIX between your clients and servers...

-justin

Sietse van Zanen wrote:
> This usually happens with clients behaving badly or misconfigured servers. Very unlikely (I would say less 1% chance) to be a netfilter issue.
> If you don't get any reports about you webserver being unreachable or unusable, all is working exactly as it should.
>  
> If people do have problems with your webserver, check the configuration of the server and clients.
>  
> -Sietse
> 
> ________________________________
> 
> From: netfilter-bounces@lists.netfilter.org on behalf of zottmann@ig.com.br
> Sent: Thu 01-Jun-06 13:56
> To: netfilter@lists.netfilter.org
> Subject: Possible conntrack problem
> 
> 
> 
> Hi !!
> 
> I am having a problem that I think may be related to conntrack.
> 
> I am getting dropped packets in the firewall coming from our web server,
> source port 80, and going to external machines on high ports, with both ACK
> and SEQ numbers set.
> 
> It seems to me that these packets are answers from our webserver to
> connections estabilished with it, but, for some reason, the connection
> information is being lost (maybe due to timeout?).
> 
> How can I track this? Has anyone gone through something like it?
> 
> Thanks in advance,
> Carlos.
> 
> 
> 
> 
> 

