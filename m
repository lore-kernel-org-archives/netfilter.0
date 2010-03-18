From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Rules PREROUTING doesn't work
Date: Thu, 18 Mar 2010 12:15:13 +0100
Message-ID: <4BA20B41.6050903@chello.at>
References: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>	 <hnqkk4$62v$1@dough.gmane.org>	 <alpine.LSU.2.01.1003171419450.6297@obet.zrqbmnf.qr>	 <1c1b5a0f1003170820q4cadb03ah4e3f4580f509c5e0@mail.gmail.com>	 <56378e321003171325n18f4ca91x358acadc0568643c@mail.gmail.com>	 <hnrrke$d0$1@dough.gmane.org>	 <alpine.LSU.2.01.1003180214250.12950@obet.zrqbmnf.qr>	 <hnsba3$50s$1@dough.gmane.org> <1c1b5a0f1003172253s415bb886j15c5339ba1657876@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1c1b5a0f1003172253s415bb886j15c5339ba1657876@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 18.03.2010 06:59, angelmotta@gmail.com wrote:

> One question, I donde have that file
> /proc/sys/net/netfilter/nf_conntrack_udp_timeout*
> I don't have netfilter directory, where is that ??
> 

on older systems it used to be in:
/proc/sys/net/ipv4/

and maybe also was named with the ip_* prefix, not with nf_*.

to look for it yourself, you could have done something like:
find /proc/sys/ -name netfilter -type d
or
find /proc/sys/ -name '*conntrack*'
...

Best regards

Mart
