From: Paulo Ricardo Bruck <pauloric@contato.com.br>
Subject: Re: iptables + ipsec can't  open an application
Date: Mon, 31 Jan 2005 16:26:41 -0200
Message-ID: <1107196002.5002.27.camel@pauloric.intranet>
References: <1107168117.5002.1.camel@pauloric.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1107168117.5002.1.camel@pauloric.intranet>
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

Hi guys

> Message: 9
> Date: Fri, 28 Jan 2005 15:33:14 -0500
> From: Jason Opperisano <opie@817west.com>
> Subject: Re: iptables + ipsec can't  open an application
> To: netfilter@lists.netfilter.org
> Message-ID: <20050128203314.GA15550@bender.817west.com>
> Content-Type: text/plain; charset=us-ascii
> 
> On Fri, Jan 28, 2005 at 06:26:04PM -0200, Paulo Ricardo Bruck wrote:
> > Hi guys
> > 
> > I've been testing debian sarge kernel 2.6.8-1 + iptables 1.2.11-8 +
> > openswan 2.2.0-4 
> > 
> > I can ping from desktop1 to desktop2 , but if I try to see a http page
> > at desktop1 from desktop 2 I see a connection time out.
> > 
> > desktop1-- iptables/openswan1--internet--iptables/openswan2--desktop2
> > 
> > ping 192.168.1.7 ( desktop 2)
> > tcpdump from iptables2 wan
> > IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x22)
> > IP 192.168.0.11 > 192.168.1.7: icmp 64: echo request seq 1
> > IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x1e76f500,seq=0x29)
> > IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x23)
> > ok works
> > 
> > 
> > lynx 192.168.1.7 (desktop2)
> > tcpdump from iptables2 wan
> > IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x2c)
> > IP 192.168.0.11.33654 > 192.168.1.7.80: S 3132491911:3132491911(0) win
> > 5840 <mss 1460,sackOK,timestamp 33947617 0,nop,wscale 0>
> > IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x1e76f500,seq=0x39)
> > IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x1e76f500,seq=0x3a)
> > IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x2d)
> > IP 192.168.0.11.33655 > 192.168.1.7.80: S 3148629414:3148629414(0) win
> > 5840 <mss 1460,sackOK,timestamp 33950275 0,nop,wscale 0>
> > IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x1e76f500,seq=0x3b)
> > IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x2e)
> > IP 192.168.0.11.33655 > 192.168.1.7.80: S 3148629414:3148629414(0) win
> > 5840 <mss 1460,sackOK,timestamp 33953275 0,nop,wscale 0>
> > 
> > important rules iptables/ipsec1
> > iptables -A INPUT   -p 50 -j ACCEPT
> > iptables -A FORWARD -p 50 -j ACCEPT
> > iptables -A INPUT   -p 51 -j ACCEPT
> > iptables -A FORWARD -p 51 -j ACCEPT
> > iptables -A INPUT   -p udp --sport 500 --dport 500 -j ACCEPT
> > iptables -A INPUT   -p udp --sport 4500 --dport 4500 -j ACCEPT
> > #iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss
> > 1440
> > iptables -A FORWARD -s 192.168.0.0/24 -d 192.168.1.0/24 -j ACCEPT
> > iptables -A FORWARD -s 192.168.1.0/24 -d 192.168.0.0/24 -j ACCEPT
> > iptables -t nat -A POSTROUTING  -o $WAN1 -d ! 192.168.1.0/24 -j SNAT
> > --to-source $IPWAN1
> > 
> > I ve already tried using TCPMSS, but not solved.
> 
> try it again, and use a lower value than 1440--i'd recommend starting
> at 1400,

ok done to TCPMSS --set-mss1000 and 500 still not working...8(

>  actually--and work you're way down until it works.  i *would*
> say tcpdump your external interface and filter for ICMP Type 3 Code 4
> packets to verify that it's an MTU/MSS problem, but to quote a statement
> some wizard just made in #iptables:
> 
>   "perhaps there is icmp filtering at the border router for anything not
>    an echo reply.  which makes sense cause you normally dont need icmp
>    messages across the internet"
> 
> depending on the combination of encapsulations in your specific scenario
> (WiFi, PPP, etc), i've had to ratchet it down as low as 1330 to get a
> functional tunnel.
> 
tcpdump for icmp type 3 code 4 shows nothing...

tcpdump ping test ok.
tcpdump from opensawn1
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x016f6987,seq=0x91)
IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x3798beac,seq=0x7f)
IP 192.168.1.2 > 192.168.0.11: icmp 64: echo reply seq 7
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x016f6987,seq=0x92)
IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x3798beac,seq=0x80)
IP 192.168.1.2 > 192.168.0.11: icmp 64: echo reply seq 8

tcpdump from openswan2
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x016f6987,seq=0xc7)
IP 192.168.0.11 > 192.168.1.2: icmp 64: echo request seq 62
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x016f6987,seq=0xc8)
IP 192.168.0.11 > 192.168.1.2: icmp 64: echo request seq 63
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x016f6987,seq=0xc9)
IP 192.168.0.11 > 192.168.1.2: icmp 64: echo request seq 64
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x016f6987,seq=0xca)
IP 192.168.0.11 > 192.168.1.2: icmp 64: echo request seq 65


access to apache using lynx
from openswan2 
IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x62b428f1,seq=0x1e)
IP 192.168.1.2.32817 > 192.168.0.11.80: S 1898716013:1898716013(0) win
5840 <mss 500,sackOK,timestamp 2124479 0,nop,wscale 0>
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x317e57ec,seq=0x23)
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x317e57ec,seq=0x24)


from openswan2 
IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x62b428f1,seq=0x18)
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x317e57ec,seq=0x18)
IP 192.168.0.11.80 > 192.168.1.2.32816: S 1513812598:1513812598(0) ack
1845413453win 5792 <mss 1460,sackOK,timestamp 27547612
2117484,nop,wscale 0>
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x317e57ec,seq=0x19)
IP 192.168.0.11.80 > 192.168.1.2.32816: S 1513812598:1513812598(0) ack
1845413453win 5792 <mss 1460,sackOK,timestamp 27548430
2117484,nop,wscale 0>


I still can't access the other desktop...

Any other ideia ??

Thanks for helping Jason


> -j
> 
> --
> "The only reason I lied was because it was the easiest way to get
>  what I wanted."
>         --The Simpsons
> 
> 
> 
> ------------------------------
> 
> ********************************
-- 
Paulo Ricardo Bruck - consultor
Contato Global Solutions
tel 011 5031-4932  fone/fax 011 5034-1732  cel 011 9235-4327


