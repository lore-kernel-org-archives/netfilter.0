From: Martin Zaharinov <micron10@gmail.com>
Subject: Re: bug report and future request
Date: Thu, 24 Mar 2022 23:43:47 +0200
Message-ID: <59BE8A6C-B066-48C9-AD66-7EDBE2C7482E@gmail.com>
References: <AE6DAC96-EC3E-43C9-A95A-B230842DD7B1@gmail.com>
 <20220321212750.GB24574@breakpoint.cc>
 <4B0C8933-C7D8-49BA-B7F2-29625B0865C1@gmail.com>
 <20220322103203.GD24574@breakpoint.cc>
 <04C4931B-553E-4FEA-85D4-B3E186520EE5@gmail.com>
 <FE0EEED5-48C9-412F-81BA-0028818C2EE8@gmail.com>
 <DB57EE0F-F4CE-4198-89E0-F25ED3C321A5@gmail.com> <YjxiB6Jk4plpx48G@salvia>
 <9ED435A1-F1B8-4220-9466-FA3E9D100B1D@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=wSzpNDCQRogZ+azuDpte4EVFEExx+jAjnQvNc+Cqgl0=;
        b=Haqu9seVxRI8zzYBHnCvFaWJwRQtiJxBcmkmxMLielfcFK7CtkAZwARcEVg4crb4LA
         3FOLsoVvjm4bYplURarE89EpB+gAtct6lUu8kPd32X9xfTv+Lrz5iWba4ldXyoHxgK4C
         1P2USA3S/2vOUiUZMFuKO2Np+0+WHAOdtLu+3Yv5vHulfjo6oVd5NRumBVo8Mtn/0h5Y
         /eOTE/IVMeGzpPGvemgVb9wFLthkuW/xGVguNeZGPypYs64On3oT+CU+K7tZTxRsHAgd
         iXpByW7B/zfigV5Sqo80Csazo/WQmcW4ewtau+GOtVJT24b8uCnrKWsiEogjhQNpKy/z
         7hSw==
In-Reply-To: <9ED435A1-F1B8-4220-9466-FA3E9D100B1D@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

Hi Pablo

unfortunately i can't find any documentation on how to do it :(


Martin

> On 24 Mar 2022, at 14:23, Martin Zaharinov <micron10@gmail.com> wrote:
>=20
> Hi Pablo
>=20
> base on this rule :=20
>=20
> table inet nft-qos-static {
>        set limit_ul {
>                typeof ip saddr
>                flags dynamic
>        }
>        set limit_dl {
>                typeof ip daddr
>                flags dynamic
>        }
>=20
>        chain download {
>                type filter hook postrouting priority filter; policy =
accept;
>                ip daddr @limit_dl drop
>=20
>        }
>        chain upload {
>                type filter hook prerouting priority filter ; policy =
accept;
>                ip saddr @limit_ul drop;
>        }
>        flowtable fastnat {
>                hook ingress priority filter; devices =3D { eth0, eth1 =
};
>        }
>        chain forward {
>                type filter hook forward priority filter; policy =
accept;
>                ip protocol { tcp , udp } flow offload @fastnat;
>        }
> }
>=20
>=20
> where to set this , please help.
>=20
>=20
>> On 24 Mar 2022, at 14:20, Pablo Neira Ayuso <pablo@netfilter.org> =
wrote:
>>=20
>> On Thu, Mar 24, 2022 at 02:09:25PM +0200, Martin Zaharinov wrote:
>>> One more update=20
>>>=20
>>> I try to make rule for limiter in offload mode :
>>>=20
>>> table inet nft-qos-static {
>>>       set limit_ul {
>>>               typeof ip saddr
>>>               flags dynamic
>>>       }
>>>       set limit_dl {
>>>               typeof ip daddr
>>>               flags dynamic
>>>       }
>>>=20
>>>       chain upload {
>>>               type filter hook prerouting priority filter ; policy =
accept;
>>>               ip saddr @limit_ul drop;
>>>       }
>>>=20
>>>       chain download {
>>>               type filter hook postrouting priority filter; policy =
accept;
>>>               ip daddr @limit_dl drop;
>>>=20
>>>       }
>>>       flowtable fastnat {
>>>               hook ingress priority filter; devices =3D { eth0, eth1 =
};
>>>       }
>>>       chain forward {
>>>               type filter hook forward priority filter; policy =
accept;
>>>               ip protocol { tcp , udp } flow offload @fastnat;
>>>       }
>>> }
>>>=20
>>> its not work perfect only upload limit work , download get full =
channel=20
>>>=20
>>> in test i set 100mbit up/down  upload is stay on ~100mbit , but =
download up to 250-300mbit (i have this limit be my isp).
>>>=20
>>> the problem is limiter work only for Upload , is it posible to make =
work on download rule ?
>>=20
>> If you want to combine ratelimit/policing with flowtable, then you
>> have to use the ingress and egress hooks, not prerouting and
>> postrouting.
>>=20
>> Make sure you place the flowtable in a priority that comes after the
>> priority of your ingress hook.
>=20

