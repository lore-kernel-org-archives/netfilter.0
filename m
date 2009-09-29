From: Bill Hendrickson <wjhendrickson@gmail.com>
Subject: Re: SSH Port Forwarding with iptables
Date: Tue, 29 Sep 2009 12:41:31 -0400
Message-ID: <a0017e7e0909290941h38aeafd3hda04418654bee004@mail.gmail.com>
References: <a0017e7e0909290816i35c5e55dw77ec8517232ef276@mail.gmail.com>
	 <4AC232F2.6050401@freemail.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=ODL3AdDdArmlGsQCaZh5b2gd/y86+Vqg6Z0H024950c=;
        b=UEFIos7ULl6bZ2KbiX97DmFWBc58Wd9O516o3yKJ1NIJZFKSbhBz3vc8fB4LkDEV9o
         ngFqgwRZ37uOOoW477dNggUFxgs+VuDYsp2cDyWbqvvZLHnmfiGyUm2a9NrYzLz2N/pg
         NCJs11HZFrxX7TNM1A5KoghAWYeQHr2eAtBZ8=
In-Reply-To: <4AC232F2.6050401@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-1?B?R+FzcOFyIExham9z?= <swifty@freemail.hu>
Cc: netfilter@vger.kernel.org

> You did not told but I assume that the Internal server's default gw is the
> firewall.
> I think you need the following rule to get it work:
>
> $IPT -t nat -A POSTROUTING -j SNAT -o $EXT_IFACE --to-source $EXT_IP

Swifty,
You nailed it - thanks!  I needed to do both things (set the default
gw on internal server and use the rule).  Re: my other post, which is
the better way to go, in your opinion - FORWARDing or MASQUERADing?
-bill
