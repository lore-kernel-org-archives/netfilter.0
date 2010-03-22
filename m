From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: two default routes
Date: Mon, 22 Mar 2010 20:35:49 +0530
Message-ID: <cfeab66d1003220805t41853241jddfa85b54e745315@mail.gmail.com>
References: <cfeab66d1003220335y1020f343u14097acc1ee50c09@mail.gmail.com>
	 <4BA784B2.9030406@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=NumM4oZ+I3w+MeV3Yf/L3qnTMsChXBU3SMbi47gs3P4=;
        b=hxiHIcWEw1TvTGFDQcj41UHfd09HPF6lM64wjuQZTwwe31XF/0WxY9crdlFgcSZCCn
         eXVJSdi5TMqj+n1mLBErIRNmhibEZJI1SNf0ol6q3dHsB3KECdLRdVzwyqWUg5l9aq7j
         BZFWhWK8oTzRCCkJKaOks+HhC8P+7GBle/PpQ=
In-Reply-To: <4BA784B2.9030406@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Mon, Mar 22, 2010 at 8:24 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> ratheesh k a =E9crit :
>>
>> =A0i have two default routes =A0, I used below two commands to add r=
outes .
>>
>> =A0route add default gw 192.168.1.1 =A0dev eth0 metric 0
>> =A0route add default gw 10.232.18.5 =A0dev eth1 metric 1
>>
>> So =A010.232.18.5 will become the default route since it is added
>> secondly . All packets are routed to this address.
>
> No. Lower metric wins regardless of route order, so the default gatew=
ay
> is 192.168.1.1. You can check with "ip route get <destination>".
>
>> Suppose
>> 10.232.18.5 machine is down =A0, will the packets will use the next
>> default route ?
>
> No, the kernel has no dead gateway detection AFAIK.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>


Thanks a lot . I have a related question .
suppose ip  8.8.8.8  is accessible thru gateway 10.232.18.5 and we
configured the linux machine to accept
icmp redirect messages ( if we set NET_IPV4_CONF_ACCEPT_REDIRECTS )  .
Linux will send packet to 8.8.8.8  thru 192.168.1.1 as per default
route . The gateway machine  ( ip 192.168.1.1 ) will respond back with
icmp redirect . (I think so ) . So our linux machine can use the other
route ?

thanks,
ratheesh
