From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging MAC
Date: Sat, 22 May 2004 13:33:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405221333.35216.Antony@Soft-Solutions.co.uk>
References: <5390820828.20040521103958@alternativa.com.br> <200405221006.14904.Antony@Soft-Solutions.co.uk> <200405220809.47858.Alistair@nerdnet.ca>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405220809.47858.Alistair@nerdnet.ca>
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

On Saturday 22 May 2004 1:09 pm, Alistair Tonner wrote:

> On May 22, 2004 05:06 am, Antony Stone wrote:
> >
> > Surely there will *always* be two MAC addresses involved in a
> > communication - that's how two machines find each other across the local
> > subnet (ie: via a switch / hub / access point etc)?
>
> 	*Thwack*'s self in head.  Of course, so long as "Ethernet" is involved. 

Or some similar broadcast-based medium such as 802.11 (which isn't ethernet, 
but behaves like it for a lot of things, including MAC addresses).

The general rule is: you need MAC addresses for broadcast-connected networks 
(where each device can see every other locally-connected device) - the MAC 
address is needed to tell one device from another.

You don't need MAC addresses for point-to-point (one-to-one) connected 
networks, because you know there's only one device on the other end of each 
of your own interfaces, therefore you don't need to specify where they're 
going.

> 	in ipt_LOG.c MAC address logging is ONLY done in INPUT.  So ..if the
> 	packet is NOT destined for the machine, you wont see MAC.

Aha :)   [ * Light bulb * ]

The answer to the original poster's question.

I guess (without having looked at the source) that it should be a simple 
enough hack to get ipt_LOG.c to log MAC addresses for all chains.

Regards,

Antony.

-- 
"When you talk about Linux versus Windows, you're talking about which 
operating system is the best value for money and fit for purpose. That's a 
very basic decision customers can make if they have the information available 
to them. Quite frankly if we lose to Linux because our customers say it's 
better value for money, tough luck for us."

 - Steve Vamos, MD of Microsoft Australia

                                                     Please reply to the list;
                                                           please don't CC me.


