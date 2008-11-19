From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: isp like shaping with tc
Date: Wed, 19 Nov 2008 14:33:22 +0100
Message-ID: <492415A2.8030901@unipex.it>
References: <4922D159.10608@krediidiinfo.ee> <1227027886.24883.21.camel@enterprise.ims-firmen.de> <49240BD4.8000206@krediidiinfo.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49240BD4.8000206@krediidiinfo.ee>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Aleksander Kamenik <aleksander@krediidiinfo.ee>
Cc: netfilter@vger.kernel.org

Aleksander Kamenik wrote:
> This solves the marking the connections and assigning them to a queue
>  part, but there would still have to about 6000 qdisc leafs created 
> (One for each possible IP). Don't know whether this scales, but will
>  test. Looks promising anyhow.
> 

But where is the problems? Like I can see, there is only a cpu problem
and, as far as I know, this isn't a problem!
I have, in production env, about 1k qdisc that shape traffic (on a 2x2
xeon 2.6) and the cpu are about 1% used!

On it I use the "old" solution with:
$IP -t mangle -A POSTROUTING -o an_eth -d an_ip -j CLASSIFY--set-class 
1:0x10
$TC qclass add dev eth0 parent 1:1 classid 1:0x10 htb ....

> Nevertheless, what would be the correct list/group to discuss tc 
> queue disciplines?
> 

If I remember correctly, this is the right list since the other is dead.

> Regards,
> 

Hope this help,
Michele
