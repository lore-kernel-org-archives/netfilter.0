From: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Subject: Re: ssh configuration issue / doubt
Date: Mon, 27 Aug 2012 12:55:22 -0700
Message-ID: <CAJygYd3GoRsBcnsaFF5zetwap+fRyU=O+bUwuPr=6mcj7KNsqw@mail.gmail.com>
References: <CAP7y58OmPxEPRR=73BFwChc2t=08VFuqNffTJzmqnON4yRoajQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=cIW1HCEbrM6QbVnwCauUokBtFUM+TeoZNsvAIA/suEs=;
        b=kjntaxG4Jm1G7030G2gZFPnhEG2dv5zGIaS2XkRO+DMh96YteEgoKlW/pxtFFWOiTZ
         c/3r7FZ9Z8iMeIcnzgLR2+prSQ8civ8HSpvqZT00eqXs5x1OuZ5LtcVHx5hgDsVcLVu2
         OfRgLbYdrP0hE5/mQrGp/Dl6Hr+r0iXQi3XMlQzASGAm+dRK3A9L3+tqSb28oApsuIPM
         +7V8LcDQuS5Ou1bg4zQiXOijuoaor2p6YZXk1WDH5tOzonVYsocNNjzwIpJ6gE5PAWGY
         eGNDNkk5YG6Rhr+WafidiBboLYmBWbnj5197vD5Wl5popiJZcO7qJlXB6UHad7Nfb0xP
         c5Vw==
In-Reply-To: <CAP7y58OmPxEPRR=73BFwChc2t=08VFuqNffTJzmqnON4yRoajQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Net Warrior <netwarrior863@gmail.com>
Cc: netfilter@vger.kernel.org

the second rule is not needed, it's being shown that it has matched 0
packet anyway.

Do you have anything else in other table? like raw/nat ?

On Mon, Aug 27, 2012 at 12:51 PM, Net Warrior <netwarrior863@gmail.com> wrote:
> Hi there.
> I've got a simple question regarding ssh configuration.
> Reading the documentation and googling, It seems that to enable ssh is
> the simple thing in the world, I've got this.
>
>  $IPTABLES -A INPUT -i $ETH_PRIMARY -p tcp -s $ANY_MACHINE\
>         --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
>
> With this rule I can connec to the machine, so far so good, now if I
> want to do scp or to scp to another machine I get blocked,
> I permit ALL the output chain.
>
> The only way I'm able to do ssh to another host or do scp is by adding this
>
>  $IPTABLES -A INPUT -i $ETH_PRIMARY -p tcp -s $ANY_MACHINE\
>         --sport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
>
> So I've got this
>  8   560 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
> 0.0.0.0/0           tcp dpt:22 state NEW,ESTABLISHED
>     0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
> 0.0.0.0/0           tcp spt:22 state NEW,ESTABLISHED
> With this two rules I can ssh to another host and do scp, I'm confused
> cuz all the examples I've been reading do not
> talk to enable both, only destination port.
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>
>
> Is this the  right way or I'm missing reading something?
>
> Thanks in advance
> Best Regards
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
