From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: IP sent an invalid ICMP type to a broadcast and
	icmp_ignore_bogus_error_responses
Date: Mon, 09 May 2005 01:09:15 -0500
Message-ID: <427EFE8B.4030009@riverviewtech.net>
References: <20050507212628.6fd43793@mikejones.ghb.fh-furtwangen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050507212628.6fd43793@mikejones.ghb.fh-furtwangen.de>
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
To: netfilter@lists.netfilter.org

Sebastian Siewior wrote:
> Hallo,
> 
> My kernel complaints himself every second with:
> 
> kernel: XX.XX.XX.XX sent an invalid ICMP type 3, code 1 error to a
> broadcast: 0.0.0.0 on lo
> 
> In the meantime I supressed the messages via  
> 
> echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses". 
> 
> Other people solved this problem with 
> 
> iptables -A INPUT -i lo -j ACCEPT
> 
> but it won't work here. Does someone have an idea how I could find out
> where the packets are comming from?

Can we get an iptables-save output as well as an ifconfig -a?  I'm betting that something is preventing traffic from flowing to or from your lo interface.



Grant. . . .

