From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: dhcrelay
Date: Fri, 28 Nov 2003 20:39:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311282039.44527.JALaramie@Loudoun-Fairfax.com>
References: <1070067379.3fc7eeb32a181@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1070067379.3fc7eeb32a181@paris-hme1>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday 28 November 2003 19:56, zynkx wrote:
> hi jeff and tanx for answering :)
>
> i'm sure i have ip forward enabled, since gateway 2 is
> working fine and routing packets ok through the lan
> and to gateway 1. if it happened not to have ip
> forward enabled in gateway 2 i could never do
> masquerading from gateway 2 to gateway 1 :)
>
> isn't that so? :)
>

Yes. If you're not sure then: "echo 1 >/proc/sys/net/ipv4/ip_forward" will 
turn it on.

> i think this might be a matter of finding out some
> bind tricks to get this over with... i just wanted to
> be sure input and output to drop would not have
> anything to do with dhcrelay :))
>
> i'm gonna test it with no firewalling at all to see
> what happens ;))
>

I'm afraid I don't have any experience with a configuration like your's but I 
don't think iptables will have any effect on dhcp requests. Good luck.

Jeff

