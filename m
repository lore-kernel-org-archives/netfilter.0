From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: port forwarding question
Date: Tue, 18 Mar 2008 17:36:11 +0100 (CET)
Message-ID: <alpine.LNX.1.00.0803181735060.8851@fbirervta.pbzchgretzou.qr>
References: <1205771195.2681.14.camel@dev002.ctekproducts.com> <Pine.LNX.4.64.0803171912010.18817@fbirervta.pbzchgretzou.qr> <1205778745.9569.12.camel@wtprit0036.m2sys.com.br> <cvitt396akcq0fug8g5rnqfo7a5pe9m81s@4ax.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cvitt396akcq0fug8g5rnqfo7a5pe9m81s@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Andrew Schulman <andrex@alumni.utexas.net>
Cc: netfilter@vger.kernel.org


On Mar 17 2008 16:01, Andrew Schulman wrote:
> It doesn't seem like a high priority for iptables, since the same thing can
> easily and more flexibly be accomplished with some bash scripting:
>
> for (( i=80 ; i<=85 ; ++i ))
> do
>  iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport $(( 5000+i )) \
>    -j DNAT --to 192.168.1.10:$i
> done
>
> Yes, that is 6 iptables rules, but the performance difference is probably
> negligible, it's simple to code, and it's totally customizable to the user's
> needs.  A specially written iptables target, OTOH, would require a whole
> separate kernel module just to cover this one fairly unusual transformation.


 	iptables -p tcp --dport A:B -j DNAT --to xxx:C-D

And you would _also_ have to deal with cases where amount of(A..B)
and amount of(C..D) are not the same. No, it would be too troublesome.

