From: Carsten Maass <cm@blinkenlichten.de>
Subject: Re: [solved] Re: Iptables / KAME IPSec problem: source port information
 lost
Date: Sun, 14 Mar 2004 01:55:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4053AD8A.8070607@blinkenlichten.de>
References: <404DB826.3000709@blinkenlichten.de> <40538843.9050303@blinkenlichten.de> <200403132235.54603.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403132235.54603.Antony@Soft-Solutions.co.uk>
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
> On Saturday 13 March 2004 10:16 pm, Carsten Maass wrote:
> 
> 
>>Even if it's not completely clear to me why: the offending rule was
>>
>>$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP
>>
>>It seems to do some kind of NATing to all traffic leaving the gateway.
> 
> 
> Er, why shouldn't it do this?   The rule says "for any packet leaving 
> $INET_IFACE, change the Source Address so that it is $INET_IP".
> 
> Therefore all traffic leaving the gateway is going to be SNATted.... no 
> surprise there?

Not all traffic should be SNATed, only traffic leaving via $INET_IFACE. 
Traffic leaving via $LAN_IFACE should not be altered, which the above 
rule nevertheless did.

>>When i narrowed it down to only match traffic which comes out of the LAN
>>it works like a charm:
>>
>>$IPTABLES -t nat -A POSTROUTING -s 192.168.3.0/24 -o $INET_IFACE -j SNAT
>>--to-source $INET_IP
> 
> 
> So the new rule will not SNAT anything which already has a source address 
> other than 192.168.3.0/24 (such as, for example, $INET_IP).   It seems to me 
> that this is probably necessary because of the way your IPsec packets are now 
> going twice through the same interface (in the old 2.4 FreeS/WAN 
> implementation, they would go once through eth0, and once through ipsec0, but 
> I believe this is no longer the case?)

Yes, they are going twice through $INET_IFACE, but the alteration occurs 
when leaving through $LAN_IFACE, which should not be matched as 
SNAT-target by the original rule. And in fact occurs no full SNAT but a 
change of the source port.

>>Is this a bug?
> 
> 
> No, I'd say it's a literal interpretation of what the rule says :)

Maybe at least we both agree that the above behavior is not *intended* 
by the applied rule? :)

Greetings,
Carsten.


