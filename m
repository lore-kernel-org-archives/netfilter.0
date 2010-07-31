From: Portedaix <portedaix@gmail.com>
Subject: Re: iptables rule for ovh
Date: Sat, 31 Jul 2010 11:23:59 +0200
Message-ID: <4C53EBAF.8030207@gmail.com>
References: <4C51450F.7070906@gmail.com> <4C514A38.1010702@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=smbTcFHiYxcaEq8BY4pGheuapkrJO2CfVyDbqeFfw8o=;
        b=xicJNzhAaQadlCdnChID0nD1fz5yzlClOhijLq94qR2N0D+GeR2iiTueRGDOsosAZb
         5o4ja17NRd7UiiBdWT1OHVpbqpI0U3KXCjwXXzM6LgA8/O5DQdFDvl2SkvsnCAWL2nI3
         v+W9Y2devhrLbjJ3v7u48PkYCKdyJhntLlZ40=
In-Reply-To: <4C514A38.1010702@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Thanks for the answer. I know now what choice I have : compile=20
patch-o-matic-ng or go for a new kernel. Probably the second option is=20
the wisest.
Regards
Olivier

Le 29/07/2010 11:30, Pascal Hambourg a =E9crit :
> Hello,
>
> Portedaix a =E9crit :
>   =20
>> Hello,
>>
>> QUESTION - SHORT VERSION :
>> Is there a way to have a rule equivalent to the one below which is f=
or
>> kernel 2.6.14 and above,  with a linux kernel 2.6.9 ?
>> '#iptables -A INPUT -p udp -m udp --dport 5060 -m string --string
>> "Cirpack KeepAlive Packet" --algo bm --to 65535 --source sip.ovh.net=
 -j
>> DROP'
>>     =20
> FWIW, the 'string' match was available for older kernels in the
> patch-o-matic-ng up to patch-o-matic-ng-20050918.
>
>
>   =20
