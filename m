From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: INET_IFACE: Secure to allow traffic from 192.168.x.0/24?
Date: Fri, 5 Mar 2004 01:29:54 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403050129.54915.Antony@Soft-Solutions.co.uk>
References: <40472125.4000608@blinkenlichten.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40472125.4000608@blinkenlichten.de>
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

On Thursday 04 March 2004 12:29 pm, Carsten Maass wrote:

> Dear List,
>
> recently i connected together two internal networks over an IPSec-tunnel:
>
> (Localnet A)---(Gateway A)==IPSec==(Gateway B)---(Localnet B)

How did you set up IPsec?   Using FreeS/WAN and Linux kernel 2.4.x?   Using 
the new built-in IPsec in kernel 2.6.x?   Some other method?   It makes a big 
difference to what you can filter, and how netfilter sees the packets.

Also, do you have one machine at each end of the link which is both running 
netfilter and acting as the IPsec gateway, or do you have two different 
machines, one doing netfilter, and one doing IPsec?

> Now i am unsure which iptables-rules i should apply to the external
> interfaces of the gateways to match the traffic between the Localnets
> without opening up a security hole. Is it sufficient to simply apply
> some general rules like:
>
> $IPTABLES -A FORWARD -i $INET_IFACE -s 192.168.a.0/24 -j ACCEPT
> $IPTABLES -A FORWARD -i $INET_IFACE -s 192.168.b.0/24 -j ACCEPT
>
> or would this approach be vulnerable to some kind of IP-spoofing attack?

If you are using FreeS/WAN and Linux 2.4.x you can filter real packets going 
to & from the "ipsecN" interfaces, and you can filter ESP packets going in 
and out of the "ethN" interfaces.   Tell us the details and I'll suggest 
something more specific if I can.

Regards,

Antony.

-- 
Having been asked for a reference for this man,
I can confirm that you will be very lucky indeed if you can get him to work 
for you.

                                                     Please reply to the list;
                                                           please don't CC me.


