From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: conntrack, NAT and icmp echo reply
Date: Thu, 11 Oct 2012 11:57:10 +0200
Message-ID: <1349949430.21172.8435.camel@edumazet-glaptop>
References: <e457eb3b6f3e357c3681c7af5f504161@visp.net.lb>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:from:to:cc:in-reply-to:references:content-type:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=fKBg0LRGo8xkb/qsK1KwhjdMR8bKJA1AqbjdpT5z9sc=;
        b=MWEufB1Po0/LsyCmmJvK+7DToa796hMVus7aDLgiLMWJ1GTGcJEYxsIjco2tO3YSNR
         AiHRyAHF2dAJxRr5RIVUFrfUAumnVRuYVbk9TkiKv6/755i0dgSg5NCCNZc2YECVjYwa
         IRKR+Q3zoMVtVC1wsVOKt1d4lavAjS08X851gTr0WMoeoW8T41VypwOo+rdhNBdEZ5Ma
         ujHPgtYm0gIHRhEDahRLxMAVpD8CQLjTBstL+5E6ObkMPK9Z91cEGZZu5jGDOT2I4r4f
         f2SPRc0mb0qrGyRhEj/A/VGVPu0ObgfSmeblpOy+iYjeB+gUf1nw8EcY5sDJmvuUGMIW
         fzaA==
In-Reply-To: <e457eb3b6f3e357c3681c7af5f504161@visp.net.lb>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Denys Fedoryshchenko <denys@visp.net.lb>
Cc: netdev@vger.kernel.org, netfilter@vger.kernel.org

On Thu, 2012-10-11 at 12:41 +0300, Denys Fedoryshchenko wrote:
> Hi all
> 
> I have NAT box, with very simple rule
> iptables -t nat -I POSTROUTING -s 10.0.0.0/8 -j MASQUERADE
> It can be SNAT also, and it works fine, as NAT.
> 
> When i generate icmp _reply_ packet, to some host
> hping -I ppp0 -1 --icmptype 0 8.8.8.8
> 
> It will pass the box, and will exit it without NAT, e.g. with original 
> IP 10.x.x.x
> on outgoing interface, which is not expected behavior IMHO.
> Is it a bug or feature?
> 

It depends, -s 10.0.0.0/8 wont match the rule if the source address
should be 198.23.44.55 I guess ?

I would try the more obvious

iptables -t nat -I POSTROUTING -o device -j MASQUERADE



