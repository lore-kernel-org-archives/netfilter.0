From: Nick <vbox.nick@gmail.com>
Subject: Re: ulog: losing packets
Date: Mon, 02 Mar 2009 19:12:29 +0200
Message-ID: <49AC137D.9000503@gmail.com>
References: <547716004.20090227172654@awanti.com> <49AA5FF8.5010409@netfilter.org> <1687794505.20090302105758@awanti.com> <49ABAB0D.1030304@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=JotNiM+Lm7yuEH0BOhKs7RH3CF7d8QTsXJDjr2Zs5a8=;
        b=dBxLStwlx/KAStjI9IotYvmMEDZaJFT9GwLC297Pl0fUDs358cHBMPg5uZNlvhIPz6
         Sev25svVeUd8xQRH99SEHeDSZIei/QC6QetszKiYzGk5fNRFwVHnp+y0zSnQKApT3Mh4
         AdVZRsZ4HYIfK8f6p/GfW26ztVayepO+AH1kM=
In-Reply-To: <49ABAB0D.1030304@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Alexander Kolesnik <alexander.kolesnik@awanti.com>, netfilter@vger.kernel.org

Pablo Neira Ayuso =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Alexander Kolesnik wrote:
>  =20
>> Hello Pablo,
>>
>> Thanks for the answer!
>>
>>    =20
>>>> /etc/ulogd.conf:
>>>> rmem=3D442368
>>>>        =20
>> PNA>        ^^^^^^
>> PNA> Rising this value will delay hitting ENOBUFS. This is the size =
of the
>> PNA> receiver buffer.
>>
>> 1. "delay" means I will get ENOBUFS in any case (early or later)?
>>    =20
>
> Yes, but as said, you can tune different parameters to make it harder=
 to
> happen, like rising qthreshold, reducing cprange, setting a lower nic=
e
> value for ulogd.
>
>  =20
>> 2. What ENOBUFS does depend on? Packets per second? Bytes per second=
?
>> Amount of iptables/shaping rules? CPU performance?
>>    =20
>
> On the queue size, bytes/s sent to ulogd and on how slow ulogd is
> reading messages.
>
>  =20
>> 3. Is there any way to calculate or predict the high limit of
>> traffic rate/number of rules/etc when the system will still manage t=
o
>> process ULOG without alerting with ENOBUFS?
>>    =20
>
> I don't know any, at least yet.
>
>  =20
>> 4. ipcad buffers (I suppose this is the same as rmem for ulogd) is s=
et
>> to 4M:
>> /etc/ipcad.conf:
>> buffers =3D 4194304;
>> But I'm still losing ULOG messages. Does that mean I have to rise th=
is
>> value more?
>>    =20
>
> Rising the value to the infinite is not either a solution, you'll hit
> ENOBUFS sooner or later.
>
>  =20
I experimented with the configuration, but never succeeded. Packages ar=
e=20
lost after 2MBit/s. For the solution of the problem I used other packag=
e=20
- ulog-acctd. It's works perfect.

--=20
With best regards, Nikolay Ilkevich.

