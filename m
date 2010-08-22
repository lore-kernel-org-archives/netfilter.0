From: Bart De Schuymer <bdschuym@pandora.be>
Subject: Re: Forced lladdr change with bridge - or not?
Date: Sun, 22 Aug 2010 18:55:03 +0200
Message-ID: <4C715667.9070008@pandora.be>
References: <alpine.LSU.2.01.1008221812200.22261@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1008221812200.22261@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Jan Engelhardt schreef:
> Hi,
>
>
>
> # tunctl -p -t tap1
> Set 'tap1' persistent and owned by uid 0
> # tunctl -p -t tap2
> Set 'tap2' persistent and owned by uid 0
> # ip a
> 196: tap1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 500
>     link/ether 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff
> 197: tap2: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 500
>     link/ether ce:61:28:5a:b7:93 brd ff:ff:ff:ff:ff:ff
> # brctl addbr br0
> # brctl addif br0 tap1
> # brctl addif br0 tap2
> # ip a
> 196: tap1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 500
>     link/ether 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff
> 197: tap2: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 500
>     link/ether ce:61:28:5a:b7:93 brd ff:ff:ff:ff:ff:ff
> 198: br0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN 
>     link/ether 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff
>
> Is this behavior normal that the lladdrs of all but the first brport
> remain unchanged? If so, what is the purpose of changing the lladdr on 
> the first brport?
>
>   
I don't understand your question, but the Linux bridge code assigns the 
MAC address of its first-added port to the virtual bridge device.

Best regards,
Bart

-- 
Bart De Schuymer
www.artinalgorithms.be

