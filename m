From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Re: Https website is not accessible once transparent proxy is set  
     up
Date: Tue, 16 Sep 2008 13:50:23 +0200 (CEST)
Message-ID: <fb6debad85eb3106cd197c989db6027c.squirrel@www.arcoscom.com>
References: <A42989E6EE1BCE4C9C1FF7DE428FF3C6630F@mos-exchange.mosmsg.com.sg>
    <18b30431bfdfb986412e296c4bc9aad1.squirrel@www.arcoscom.com>
    <48CF9644.7010504@oracle.com>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48CF9644.7010504@oracle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

El Mar, 16 de Septiembre de 2008, 13:19, John Haxby escribi=F3:
> ArcosCom Linux User wrote:
>> Read about HTTP transparent proxy.
>>
>> The HTTPS can't be transparently proxied (as I now) for yet.
>>
>
> Well, not by squid, but the connection can be transparently proxied. =
  I
> have a tiny transparent proxy that redirects all connections to any p=
ort
> outside an intranet to a connection through an HTTP CONNECT request.
>

As I now (and have working some HTTP proxyes with squid+iptables), the
problem are the requests.

Well, when you do a REDIRECT from 80 to 3128 (for squid), the squid mus=
t
know that it is working in transparent mode to process correctly the HT=
TP
requests, because they aren't directly for the proxy.

If you use the same theory for any other protocol, the "proxy" must kno=
w
how to process correctly these type of connections.

What "tiny transparent proxy" are you using? Perhaps, anybody could hel=
p
you in any trick with it!!.


> jch
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

Regards

