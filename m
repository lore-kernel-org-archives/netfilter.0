From: Mohammad Farooq <mohammadfarooq@tango-networks.com>
Subject: Re: Redirecting incoming packets to other port
Date: Wed, 11 Oct 2006 08:41:54 -0500
Message-ID: <1160574114.4059.54.camel@mfarooq-1.tango-networks.com>
References: <c936c6b70610110109v73453362h65b8e34d6771dadd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c936c6b70610110109v73453362h65b8e34d6771dadd@mail.gmail.com>
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
To: Holger Kinkelin <holger.kinkelin@gmail.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2006-10-11 at 10:09 +0200, Holger Kinkelin wrote:
> Hello everybody
> 
> how can I redirect packets sent to my computer to another port?
> 
> I tried: iptables -A PREROUTING -t nat -p udp --dport 5060 --sport
> 5060 -j DNAT --to-destination 192.168.0.21:5063
> 
> This rule is accepted but doesn't do anything. There are no other
> rules that could cause side effects.
> 
> Regards,
> Holger
> 
> 
Make sure forwarding is turn on on your box. Execute the following
command:
echo 1 > /proc/sys/net/ipv4/ip_forward

MF


