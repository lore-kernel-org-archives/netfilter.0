From: Carsten Maass <cm@blinkenlichten.de>
Subject: Re: INET_IFACE: Secure to allow traffic from 192.168.x.0/24?
Date: Fri, 05 Mar 2004 12:28:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40486470.2030700@blinkenlichten.de>
References: <40472125.4000608@blinkenlichten.de> <200403050129.54915.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403050129.54915.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Antony Stone wrote:
>>
>>recently i connected together two internal networks over an IPSec-tunnel:
>>
>>(Localnet A)---(Gateway A)==IPSec==(Gateway B)---(Localnet B)
> 
> 
> How did you set up IPsec?   Using FreeS/WAN and Linux kernel 2.4.x?   Using 
> the new built-in IPsec in kernel 2.6.x?   Some other method?   It makes a big 
> difference to what you can filter, and how netfilter sees the packets.
> 
> Also, do you have one machine at each end of the link which is both running 
> netfilter and acting as the IPsec gateway, or do you have two different 
> machines, one doing netfilter, and one doing IPsec?

Sorry, i should have bin more specific. Both gateways are Linux boxen 
with kernel 2.4.24, using the KAME IPSec-backport from kernel 2.6 in 
tunnel-mode. Both running netfilter on Debian stable with the 
ipsec-tools and racoon coming from testing:

kernel-source-2.4.24          2.4.24-3
iptables                      1.2.6a-5
ipsec-tools                   0.2.2-8
racoon                        0.2.2-8

>>Now i am unsure which iptables-rules i should apply to the external
>>interfaces of the gateways to match the traffic between the Localnets
>>without opening up a security hole. Is it sufficient to simply apply
>>some general rules like:
>>
>>$IPTABLES -A FORWARD -i $INET_IFACE -s 192.168.a.0/24 -j ACCEPT
>>$IPTABLES -A FORWARD -i $INET_IFACE -s 192.168.b.0/24 -j ACCEPT
>>
>>or would this approach be vulnerable to some kind of IP-spoofing attack?
> 
> 
> If you are using FreeS/WAN and Linux 2.4.x you can filter real packets going 
> to & from the "ipsecN" interfaces, and you can filter ESP packets going in 
> and out of the "ethN" interfaces.   Tell us the details and I'll suggest 
> something more specific if I can.

Yes, from a filtering point of view the ipsecN devices of FreeS/WAN were 
neat, but no avail. Tcpdump on Gateway B shows the packets as follows

ping from 192.168.4.1 (Localnet B) to 192.168.1.1 (Localnet A):

12:08:11.404522 82.82.82.82 > 83.83.83.83: ESP(spi=0x00d7fe71,seq=0x14) (DF)
12:08:11.456654 83.83.83.83 > 82.82.82.82: ESP(spi=0x07e27fbb,seq=0x14)
12:08:11.456654 192.168.1.1 > 192.168.4.1: icmp: echo reply


Thanks for sharing your experience,
Carsten.

