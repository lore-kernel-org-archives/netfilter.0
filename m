From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: MASQUERADE and ACCEPT targets
Date: Wed, 24 Feb 2010 15:57:45 +0100
Message-ID: <4B853E69.9040402@chello.at>
References: <cfeab66d1002240645i632227ccpbe8f3e55cebaf947@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1002240645i632227ccpbe8f3e55cebaf947@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 24.02.2010 15:45, netfilter-owner@vger.kernel.org wrote:
> All ,
> 
>      R1)   iptables -t nat -I POSTROUTING -o eth0 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
>      R2)   iptables -t nat -A POSTROUTING   -o eth0 -j MASQERADE
> 
> 
>                                         machine "B"
>                                      ------------------------------------------
>                                      |                                        |
>                                      |                                        |
> machine "A"   ------> eth0 |
> |eth1----------------------------------------> internet
>                                      |                                        |
>                                      |                                        |
>                                      ------------------------------------------
> 
>  I applied rules R2 and i am able to browse internet from machine A .
> 
>  1. Is there any problem if i apply R1 ?
>  2. if packet state become ESTABLISHED ( not a new packet ) , do we
> need MASQERADE target for remaing packets ???
> 
> Thanks,
> Ratheesh

The nat table only sees state NEW packets.
A rule with state "ESTABLISHED,RELATED" will never match there.
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE is good (without
the typo).

Do filtering (ACCEPT/DROP/REJECT) in the filter table.
iptables -A FORWARD -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

same for OUTPUT maybe.

Best regards

Mart
