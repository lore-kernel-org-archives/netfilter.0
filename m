From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: block ip fragmented packet
Date: Fri, 11 Dec 2015 09:27:46 +0300
Message-ID: <CAEzD07+oCs_W6P760okms=g38HEM_YuGNFx_-YodYDX328D6qA@mail.gmail.com>
References: <CAPgF-frhssFMAxB0M=qA1Y1jCxjScO7+3JE7=i9FaXu37HCLOw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=8zIhUMObgCPnlHP+sEx2/Bu1yIo9Gp91PbQnNUmCOfI=;
        b=SoU6lAwIfkaugKZucvYW12vmRg2CyZXklmFJ2jTWa0R7Nkas6w8tdWIitEbYyAJaCV
         JSplEc0cYUmBwwXZYVOmspGaE/BkoaXfAv9FNIN5f0zKspMmYKLWiheIZHXHds0GF9gE
         SXtQuLrBo5YoLx2+oCR0XplfEBIn2WST9XQnipr3YVC84GOxd9m+5ToQXcwEFzR7lkNd
         q8R0RpaUY2DyZ3Bdp5SfJlmZsYtX5hIp9InAi1qaQa1O5li1OX1AmOILv4DYzA4nHdxD
         Kn/zSCNlDZZlrcdbwZtN7mjEosbYVZuJkdVX9J7sdboBy23/bgShc0foiWgySPQf5Kjk
         qMDw==
In-Reply-To: <CAPgF-frhssFMAxB0M=qA1Y1jCxjScO7+3JE7=i9FaXu37HCLOw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Satish Patel <satish.txt@gmail.com>
Cc: netfilter@vger.kernel.org

Hello.
Local originated packets aren't passed through raw/PREROUTING chain
(see this flowchart -
https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg
). To test your rule you should use raw/OUTPUT chain.
Also iptables has own match for fragmented packes. In your case this
rule should looks like: iptables -t raw -I OUTPUT --fragment -j DROP.

2015-12-11 1:38 GMT+03:00 Satish Patel <satish.txt@gmail.com>:
> We have iptables v1.4.21 running and i am trying to stop all
> fragmented packet but following rules doesn't working what is wrong
> here?
>
>
>
> iptables -t raw -A PREROUTING -m u32 ! --u32 "0x4&0x3fff=0x0" -m
> comment --comment "Fragmented" -j DROP
>
> To test rules i am doing following:
>
> ping -M want -s 3000 192.168.1.1
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Anton.
