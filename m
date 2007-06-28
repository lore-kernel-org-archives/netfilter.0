From: Martijn Lievaart <m@rtij.nl>
Subject: Re: ICMP packets associated with NAT connections sent
	out	wrong	interface?
Date: Thu, 28 Jun 2007 08:56:37 +0200
Message-ID: <46835BA5.3080705@rtij.nl>
References: <f513uq$kvi$1@sea.gmane.org> <46819191.10808@rtij.nl>
	<1182944650.6183.17.camel@ray-linux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1182944650.6183.17.camel@ray-linux.internal>
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
To: Ray Leach <spoons@rchq.co.za>
Cc: Jordan Russell <jr-list-2007@quo.to>, netfilter@lists.netfilter.org

Ray Leach wrote:
> On Wed, 2007-06-27 at 00:22 +0200, Martijn Lievaart wrote:
>   
>> Jordan Russell wrote:
>>     
>>> Hi,
>>>
>>> My machine is functioning as a NAT box. It has two NICs:
>>> - eth0, connected to the LAN, IP address 192.168.0.1
>>> - eth1, connected to the Internet, IP address 123.23.23.23
>>>
>>>       

(snip)

>>> [outdrop] IN= OUT=eth1 SRC=123.23.23.23 DST=192.168.0.4 LEN=68 TOS=0x00
>>> PREC=0xC0 TTL=64 ID=61136 PROTO=ICMP TYPE=3 CODE=3 [SRC=192.168.0.4
>>> DST=123.23.23.23 LEN=40 TOS=0x00 PREC=0x20 TTL=53 ID=16088 PROTO=TCP
>>> SPT=1229 DPT=44851 WINDOW=0 RES=0x00 ACK RST FIN URGP=0 ]
>>>   
>>>       
>> That's a port unreachable message, seemingly coming from the outside, in 
>> response to a RST coming from the inside. That in itself is not very 
>> usual, but it can happen.
>>
>> This packet going out the wrong interface seems like a pretty serious 
>> bug. I advice you to repost on the netfilter-devel list, there are many 
>> more people there that are really into this. However, this may be a bug 
>> in the network code, not the netfilter code. Or something else completely.
>>
>>
>> HTH,
>> M4
>>
>>     
> Doesn't seem like a bug ...
>
> The port unreachable ICMP replay is coming from your machine in response
> to a packet coming in eth1 trying to get to 192.168.0.x ...
> You have just denied the echo replies by youe DROP rule.
>   

The source of the packet is 123.23.23.23, it comes from the Internet. 
The destination is local. Why do you think this packet is generated locally?

M4


