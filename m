From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: two default routes
Date: Mon, 22 Mar 2010 21:26:18 +0530
Message-ID: <cfeab66d1003220856m194476e3u1bf391b4e55b3c35@mail.gmail.com>
References: <cfeab66d1003220335y1020f343u14097acc1ee50c09@mail.gmail.com>
	 <4BA784B2.9030406@plouf.fr.eu.org>
	 <cfeab66d1003220805t41853241jddfa85b54e745315@mail.gmail.com>
	 <4BA79126.1040903@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=h0rZ6LuC/CtLywUIS1oX8CVO40FeqWbZUb2NfLm5Zbk=;
        b=ECjch+tfOcwLNSHT9kuFPcTGnnnmp2imp/QTViLMlUBeflm7vtCvJ5ZNPnk84h6xcG
         ZaqVxq6iEsjbNFn7o15WqHhr2EzpNn5Khkdysgg0otY1vB+l8mBV4iaNc7qMvVUGzbL5
         t+V3zqpOWhBczKg0/3KNPyz6z72diqrtZ8KNg=
In-Reply-To: <4BA79126.1040903@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Mon, Mar 22, 2010 at 9:17 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> ratheesh k a =E9crit :
>>
>> suppose ip =A08.8.8.8 =A0is accessible thru gateway 10.232.18.5 and =
we
>> configured the linux machine to accept
>> icmp redirect messages ( if we set NET_IPV4_CONF_ACCEPT_REDIRECTS ) =
=A0.
>
> Do you mean sysctl net.ipv4.conf.<interface>.accept_redirects ?
> Note that this settings is ignored (and so are ICMP redirects) when
> forwarding is enabled, thus when Linux acts as a router.
>
>> Linux will send packet to 8.8.8.8 =A0thru 192.168.1.1 as per default
>> route . The gateway machine =A0( ip 192.168.1.1 ) will respond back =
with
>> icmp redirect . (I think so )
>
> If it is configured to do so. If it runs a Linux kernel, see sysctl
> net.ipv4.conf.<interface>.send_redirects.
>
>> So our linux machine can use the other route ?
>
> Yes, a temporary redirect route to 8.8.8.8 will be created in the
> routing cache. You can see it with "ip route show cache".
>
> Note : This does not seem to be much related to netfilter.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

thanks a ton .

>>>>>>> Note : This does not seem to be much related to netfilter

I agree . I should not ask this kind of questions here ( any thing
other than netfilter )  ?

thanks,
ratheesh
