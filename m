From: Vinicius Massuchetto <viniciusmassuchetto@gmail.com>
Subject: Re: Can't share ppp internet connection
Date: Sun, 21 Aug 2011 07:14:19 -0300
Message-ID: <CAJ1a920B=sXLdAXZ_Oc9MGT=MdPzV4RaWtQpsvfm1HkeX4oP9g@mail.gmail.com>
References: <CAJ1a921b0HqJmUxTfqmsO+RG56w+DS6tBoWWhPBFQb8t2cHQCQ@mail.gmail.com>
 <CAA2qdGWCeRLwrJBrXujXjf_mk=4DQ6GS+KascfZv9=sDSRw=Rg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=zS21pggMfyKdxl3q7s05u/mkaY3AdZjE3tYb3GG3LRQ=;
        b=m/vzZYkDrzybn5Tz9VKNyrgz30c3BibxeRkMfg7cgj9SqFEH0wZtCCET+RjtgXaXd3
         YZHWQ1VECUB8jrVR8wa6J7l7oVLre31OpuhNdEiUi1YYdblLF9VB5g8t+kJIuf6KUgtQ
         U5QhHSg7VjPRMCA5xDXa2Lv2HpTyftK+m0SiU=
In-Reply-To: <CAA2qdGWCeRLwrJBrXujXjf_mk=4DQ6GS+KascfZv9=sDSRw=Rg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: Netfilter <netfilter@vger.kernel.org>

2011/8/21 Pandu Poluan <pandu@poluan.info>:
> Just a hunch; do this:
>
> iptables -t nat -I POSTROUTING -p udp --dport $DHCP_SRV_PORT -j ACCEPT
>
> (sorry, for some unknown reason, I can't open any web site;
> $DHCP_SRV_PORT should be 67 or 68, I forgot which)

According to the logs, the requests come in port 67.

> In effect, the above rule causes DHCP packets going to the DHCP server
> to bypass the MASQUERADE target.

Running this after the script has no effect in this behavior.
iptables -t nat -I POSTROUTING -p udp --dport 67 -j ACCEPT

Thanks for the tip.
-- 
Vinicius Massuchetto
