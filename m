From: Luigi Corsello <mlreader@lucomp.net>
Subject: Re: broken SNAT with fixed external MTU
Date: Thu, 14 Oct 2004 21:52:05 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <416ED8E5.7000501@lucomp.net>
References: <416EA61A.9030600@lucomp.net>
	<20041014181747.GA3929@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041014181747.GA3929@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org



Jason Opperisano wrote:
> On Thu, Oct 14, 2004 at 06:15:22PM +0200, Luigi Corsello wrote:
> 
>>Hello everybody,
>>
>>My DSL router (very bad firmwares) wants me to force the MTU
>>(buggy MTU auto-setting). The firewall has a public IP and mtu 1500:
>>
>>---snip
>>#route to the router net
>>ip route add 192.168.1.0/24 dev eth1 mtu 1440
>># default to the router (mtu not needed here)
>>ip route add default via 192.168.1.1 mtu 1440
>>--snip
>>
>>the firewall itself NATs one client back-to-back connected
>>
>>---snip
>>#mss clamping 1)
>>iptables -A FORWARD -d $net1 -p tcp --tcp-flags SYN,RST SYN -j TCPMSS 
>>--set-mss 1440
>>iptables -A FORWARD -s $net1 -p tcp --tcp-flags SYN,RST SYN -j TCPMSS 
>>--set-mss 1440
> 
> 
> try not to confuse MTU with MSS, as they are not the same.  if you're
> going for an MTU of 1440--you should be setting MSS to 1400 (MSS = MTU -
> 40).

Ykes! that was it. Too many sleepless nights flashing crappy firmwares.
Thanks a lot!

/lc

> 
> -j
> 

