From: Aymeric Moizard <jack@atosc.org>
Subject: Re: udp connection moved from ASSURED to UNREPLIED
Date: Sun, 27 Apr 2008 01:09:14 +0200 (CEST)
Message-ID: <Pine.LNX.4.63.0804270047390.6453@sip2>
References: <Pine.LNX.4.63.0804261543110.6453@sip2>
 <alpine.LNX.1.10.0804262013110.20150@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804262013110.20150@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org



On Sat, 26 Apr 2008, Jan Engelhardt wrote:

>
> On Saturday 2008-04-26 16:07, Aymeric Moizard wrote:
>>
>>
>> ipv4     2 udp      17 178 src=192.168.2.50 dst=212.27.XX.X sport=6010
>> dport=5060 packets=48 bytes=4074 src=212.27.XX.X dst=88.171.XX.XX sport=5060
>> dport=6010 packets=379 bytes=24499 [ASSURED] mark=0 secmark=0 use=1
>
> Hiding IP addresses is totally meaninless, we all know it is
> 88.171.117.238--212.27.52.5 you are talking to. That probably
> does not even buy us a beer. Anyway...
>
>> Each 30minutes, the box is sengind an ARP request and suddenly, the incoming
>> packets from 212.27.XX.X gets rejected with icmp "port unreachable" as if the
>> conntrack was deleted upon receiving the arp request from the dsl box.
>
> So, throw up the conntrack event listener (`conntrack -E`) next
> to a tcpdump and see what happens on the conntrack table when
> that ARP is seen.

Among the event I get from "conntrack -E":

[DESTROY] udp      17 src=192.168.2.50 dst=212.27.52.5 sport=6010
dport=5060 packets=12 bytes=3102 src=212.27.52.5 dst=88.171.117.238
sport=5060 dport=6010 packets=75 bytes=6667

all other udp connections are getting destroyed as well.

> Or maybe your keepalive packets come in intervals less than the
> UDP timeout.

Sure they don't. It also happen with RTP/UDP stream: (packet in each 
direction each 20ms).

If you wish any other information, capture, log, beers, please ask!

tks,
Aymeric

