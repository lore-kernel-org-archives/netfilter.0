From: "Fabrizio Regalli" <fabreg@gmail.com>
Subject: Re: DNAT and SNAT
Date: Wed, 3 Sep 2008 16:43:05 +0200
Message-ID: <43d295de0809030743m30964ac8o66194e2b4aed1f6@mail.gmail.com>
References: <43d295de0809030702i1d42b404w36483608498a6fcc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=oGJQIxctAl527olzXxJ02cxE1w/RGju0YYBDjV+1sWo=;
        b=sfCdPyGjPhYP8Qg9tY5XCDITRdi0+gYCQSd5Ndt6oGdoK43RmuhIGBG38+WhsmBgdX
         XCJZXJpVR/zC/pqUs8luIzExlD4/ajJWU5rVhdsf61ig4VLplgNKISa2qNeNFfig0la9
         jJjkIw0+14RYDgS9F2p8o89UNDG7GrAYL4zro=
In-Reply-To: <43d295de0809030702i1d42b404w36483608498a6fcc@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've found the right rules:

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 50002 -j DNAT
--to-destination 192.168.1.3:22

iptables -t nat -A POSTROUTING -p tcp -m tcp -d 192.168.1.3 --dport 22
-j SNAT --to-source 192.168.1.2:50002

iptables -P FORWARD ACCEPT

Now works.

Thanks.
Fabrizio

2008/9/3 Fabrizio Regalli <fabreg@gmail.com>:
> Hi list.
>
> I have a router "closed" and I can't using PAT but I need to forward
> the ssh port to another external port (50002)
> My router is 192.168.1.1
> My server is 192.168.1.2
> My client is 192.168.1.3
> In other words I need to forward the ssh port of 192.168.1.3 to server ip:50002
>
> For PREROUTING rule I suppose this is right:
>
> iptables -t nat -A PREROUTING -p tcp -m tcp --dport 50002 -j DNAT
> --to-destination 192.168.1.3:22
>
> For POSTROUTING rule, I need an help. I'm trying in this way:
>
> iptables -t nat -A POSTROUTING -p tcp -m tcp -d 192.168.1.2 --dport 22
> -j SNAT --to-source 192.168.1.2:50002
>
> But unfortunately it doesn't work.
>
> Could please someone give me a suggest for POSTROUTING rule?
>
> Thanks in advance.
>
