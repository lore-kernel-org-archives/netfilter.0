From: E2IA <e2ia.ci@gmail.com>
Subject: Re: xt_ACCOUNT define many network by table
Date: Thu, 27 Jan 2011 22:13:39 +0000
Message-ID: <AANLkTinYhMmnOJ1Kq9BBFcQfOB5p1kkmGXD=BvNf+2i1@mail.gmail.com>
References: <AANLkTik+=rifOKRpurA3da=OMe-Jp96Y=YMRC1itgmQ4@mail.gmail.com>
	<1296153825.2064.4727.camel@laplaplian>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type:content-transfer-encoding;
        bh=gkXB74xMfKGF05eQM/PeazFm1CgK2yFj3JP8RUUBSig=;
        b=IWIplNsvq5dTMDLAuwvOmKHZ2makkDr/gSkcjSXOQirSF3+jvGECW8tMXDlpD9lBsr
         SmdMZ6FPI8wzCG07Xj9Z9fNTUAzX+22buLlYpWId+9bY9xPLFK0RokokA8Gphbqbuf/P
         +BT4bw7N7rgb6NuBMxfsZjeR+W5nUC1/MrBCU=
In-Reply-To: <1296153825.2064.4727.camel@laplaplian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bob Miller <bob@computerisms.ca>, netfilter@vger.kernel.org

Thank very much but it doesn't work because the 128.0.0.0/8 doesn't
pass through my box.
Is there a subnets witch could mach any IP address that pass through my=
 box?
regards.

2011/1/27 Bob Miller <bob@computerisms.ca>:
> On Thu, 2011-01-27 at 16:55 +0000, E2IA wrote:
>> Hi,
>> all I'm using xt_ACCOUNT for accounting on my linux box.
>> I have two network 192.168.2.0/24 and 172.16.2.0/24. and i want to
>> account these 2 network via table http.
>> So i've made these two rules :
>> rule 1: =C2=A0iptables =C2=A0-t mangle =C2=A0 -A =C2=A0POSTROUTING =C2=
=A0 -m mark --mark =C2=A0123
>> -j ACCOUNT --addr =C2=A0192.168.2.0/24 =C2=A0--tname http
>> rule 2: =C2=A0iptables =C2=A0-t mangle =C2=A0 -A =C2=A0POSTROUTING =C2=
=A0 -m mark --mark =C2=A0123
>> -j ACCOUNT --addr =C2=A0172.16.2.0/24 =C2=A0 =C2=A0--tname http
>>
>> but when I enter the rule2 i got this error message :
>> [282339.158532] ACCOUNT: Table http found, but IP/netmask mismatch.
>> IP/netmask found: 192.168.2.0/255.255.255.0
>> [282339.158670] ACCOUNT: Table insert problem. Aborting
>>
>> I'm wondering and I'd like to know if there is mean to define a tabl=
e
>> for 2 deferent network.
>> regards.
>> --
>
> And for the whole list:
> My experimentation suggests that you would need two different tables =
for
> two different --addr subnets. =C2=A0However, I think you could use so=
mething
> like this:
>
> iptables =C2=A0-t mangle =C2=A0 -A =C2=A0POSTROUTING -s 192.168.2.0/2=
4 -m mark --mark
> 123 -j ACCOUNT --addr =C2=A0128.0.0.0/8 =C2=A0--tname http
> iptables =C2=A0-t mangle =C2=A0 -A =C2=A0POSTROUTING -d 192.168.2.0/2=
4 -m mark --mark
> 123 -j ACCOUNT --addr =C2=A0128.0.0.0/8 =C2=A0--tname http
> iptables -t mangle -A =C2=A0POSTROUTING -s 172.16.2.0/24 =C2=A0-m mar=
k --mark =C2=A0123
> -j ACCOUNT --addr =C2=A0128.0.0.0/8 =C2=A0 --tname http
> iptables -t mangle -A =C2=A0POSTROUTING -d 172.16.2.0/24 =C2=A0-m mar=
k --mark =C2=A0123
> -j ACCOUNT --addr =C2=A0128.0.0.0/8 =C2=A0 --tname http
>
> That is pure speculation based on a very loose understanding of ACCOU=
NT,
> here is hoping it works...
>
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
>
> Bob Miller
> 334-7117/660-5315
> http://computerisms.ca
> bob@computerisms.ca
> Network, Internet, Server,
> and Open Source Solutions
>
>
