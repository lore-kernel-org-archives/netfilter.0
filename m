From: Paulo Ricardo Bruck <pauloric@contato.com.br>
Subject: Re: iptables + ipsec can't  open an application - SOLVED
Date: Tue, 08 Feb 2005 09:17:34 -0200
Message-ID: <1107861454.4475.17.camel@pauloric.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

>On Fri, Jan 28, 2005 at 06:26:04PM -0200, Paulo Ricardo Bruck wrote:
>> Hi guys
> >
>>I've been testing debian sarge kernel 2.6.8-1 + iptables 1.2.11-8 +
>>openswan 2.2.0-4 
>> 
>> I can ping from desktop1 to desktop2 , but if I try to see a http
page
>> at desktop1 from desktop 2 I see a connection time out.
>>
>> desktop1-- iptables/openswan1--internet--iptables/openswan2--desktop2
>> 
>> ping 192.168.1.7 ( desktop 2)
>> tcpdump from iptables2 wan
>> IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x22)
>> IP 192.168.0.11 > 192.168.1.7: icmp 64: echo request seq 1
>> IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x1e76f500,seq=0x29)
>> IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x23)
>> ok works
>> 
>> 
>> lynx 192.168.1.7 (desktop2)
>> tcpdump from iptables2 wan
>> IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x2c)
>> IP 192.168.0.11.33654 > 192.168.1.7.80: S 3132491911:3132491911(0)
w>in
>> 5840 <mss 1460,sackOK,timestamp 33947617 0,nop,wscale 0>
>> IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x1e76f500,seq=0x39)
>> IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x1e76f500,seq=0x3a)
>> IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x2d)
>> IP 192.168.0.11.33655 > 192.168.1.7.80: S 3148629414:3148629414(0)
>win
>> 5840 <mss 1460,sackOK,timestamp 33950275 0,nop,wscale 0>
>> IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x1e76f500,seq=0x3b)
>> IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x2e)
>> IP 192.168.0.11.33655 > 192.168.1.7.80: S 3148629414:3148629414(0)
win
>> 5840 <mss 1460,sackOK,timestamp 33953275 0,nop,wscale 0>
>> 
>> important rules iptables/ipsec1
>> iptables -A INPUT   -p 50 -j ACCEPT
>> iptables -A FORWARD -p 50 -j ACCEPT
>> iptables -A INPUT   -p 51 -j ACCEPT
>> iptables -A FORWARD -p 51 -j ACCEPT
>> iptables -A INPUT   -p udp --sport 500 --dport 500 -j ACCEPT
>< iptables -A INPUT   -p udp --sport 4500 --dport 4500 -j ACCEPT
>> #iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
->-set-mss
>> 1440
>> iptables -A FORWARD -s 192.168.0.0/24 -d 192.168.1.0/24 -j ACCEPT
>> iptables -A FORWARD -s 192.168.1.0/24 -d 192.168.0.0/24 -j ACCEPT
>> iptables -t nat -A POSTROUTING  -o $WAN1 -d ! 192.168.1.0/24 -j SNAT
>>--to-source $IPWAN1
>> 
>> I ve already tried using TCPMSS, but not solved.
>
>try it again, and use a lower value than 1440--i'd recommend starting
>at 1400, actually--and work you're way down until it works.  i *would*
>say tcpdump your external interface and filter for ICMP Type 3 Code 4
>packets to verify that it's an MTU/MSS problem, but to quote a
>statement
>some wizard just made in #iptables:
>
>  "perhaps there is icmp filtering at the border router for anything
>not
>   an echo reply.  which makes sense cause you normally dont need icmp
>   messages across the internet"
>
>depending on the combination of encapsulations in your specific
>scenario
>(WiFi, PPP, etc), i've had to ratchet it down as low as 1330 to get a
>functional tunnel.
>
>-j
>

Hi guys finally I discover the "error" at my nat rule..

Instead of :
iptables -t nat -A POSTROUTING  -o $WAN1 -j SNAT --to-source $IPWAN1

I insert my local net at the above rule
iptables -t nat -A POSTROUTING  -s $LOCALNET -o $WAN1 -j SNAT
--to-source $IPWAN1

But thereis something that still bothering me.
Why was everything working fine without this last rule and when I
Install openswan I had to insert $LOCALNET?

Thanks very much for your help Jason and list.


-- 
Paulo Ricardo Bruck - consultor
Contato Global Solutions
tel 011 5031-4932  fone/fax 011 5034-1732  cel 011 9235-4327


