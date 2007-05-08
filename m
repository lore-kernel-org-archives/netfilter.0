From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: DNAT and local hosts
Date: Tue, 8 May 2007 10:43:00 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705081039450.17280@yvahk01.tjqt.qr>
References: <C3FA62B1A90D7440B9B6C7C31895994F03663A32@zadbn02100.vodacom.corp>
	<Pine.LNX.4.61.0705071801150.17280@yvahk01.tjqt.qr>
	<C3FA62B1A90D7440B9B6C7C31895994F08041C@zadbn02100.vodacom.corp>
	<46401311.2000507@rchq.co.za>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46401311.2000507@rchq.co.za>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ray Leach <spoons@rchq.co.za>
Cc: netfilter@lists.netfilter.org, Pieter De Wit <Pieter.DeWit@vodacom.co.za>


On May 8 2007 08:05, Ray Leach wrote:
>> On May 7 2007 17:54, Pieter De Wit wrote:
>> > Now, all connections are routed out via FW:ppp0 and at NAT'ed. There
>> > is
>> > a rule that allows connections to ppp0 on port 1234 and DNAT's them to
>> > C1. When C2 makes a connection to 1.2.3.4:1234 it fails with
>> > "Connection
>> > refused" since there is no "server" listening on the firewall's
>> > ppp0,port 1234.
>> 
>> *BEEP* *BUZZ* *ERROR*. You have a direct connection between C1 and C2.
>
> There is no routing between C1 and C2, so your firewall never sees the traffic
> between the 2.
>
> Put C1 and C2 on two seperate physical networks and connect them through
> firewall to get routing to happen, then you can use iptables to do NATing
> between them.
>
> Else put two interfaces into your firewall, give each interface an ip address
> in the same subnet, configure bridging between the two, put C1 on the end of
> one interface and C2 on the other if, then look into ebtables.

Else always route to the gateway. As in...

@client:
* uncofigure the main interface
* redo it with `ip a a 192.168.2.100/32 peer 192.168.2.1`
(the server keeps using 192.168.2.1/24)

(assuming 192.168.1.100 <-> 192.168.1.1/192.168.2.1 <-> 192.168.2.100)


Jan
-- 

