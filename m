From: Martin Zaharinov <micron10@gmail.com>
Subject: Re: bug report and future request
Date: Tue, 5 Apr 2022 17:12:44 +0300
Message-ID: <144C98D5-5AB0-4671-A7CC-8B3DACCC1299@gmail.com>
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
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=sGpuw8JqpUFELXXqahafGc9bWb54PbVZRX+27M+j+VI=;
        b=M+tbOpOFOnC5sh6lCPb9ThZEDV/JfMh6mdwXHyEafmw8uaQKHaXdoQieKBePCpZ74a
         TElfZ6gYZX7gfqyrdk06UnGwkRk+jalgIcokFzs93qtk9aeE/mOeXINjMzMBEGxeTcbk
         eQyX8hGiipseCOYK0TsLnd0REVoRtG1GdaEMtdyns0n8GquUsuuGibpG9J2cki2CloKa
         LvC1iixzx8Dh6Dza8aqWLE1T3d5C8QMBV4aTGm5L8DRgolWbgV3Qeoc9aeg/nlmhvNkQ
         UQSwuRXOjg4mYSKevwiK2KQwp2iYEV3ZX+uNO+s+sYTMTn29kSHTOWu+s5N6vFSUk/1d
         wezg==
In-Reply-To: <9ED435A1-F1B8-4220-9466-FA3E9D100B1D@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1254"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

Hello Pablo and Florian=20

i try to make this work on egress or ingress but limiter not work=20


setup is :=20

eth0 uplink - WAN

ppp0 ,ppp1,pppX users

table netdev nft-qos-ingress {
	set limit_ul {
		typeof ip saddr
		flags dynamic
		elements =3D { 10.0.0.11 limit rate over 12800 =
kbytes/second burst 600 kbytes }
	}

	chain upload {
		type filter hook ingress device "ppp0" priority -450; =
policy accept;
		ip saddr @limit_ul drop
	}
}


Here problem is when ppp user disconnect rule for ppp0 remove from =
nftable (is there options to set here ppp* to list all ppp interface )


for egress i try this setup but not work on egress:=20

table netdev nft-qos-egress {
	set limit_dl {
		typeof ip daddr
		flags dynamic
		elements =3D { 10.0.0.11 limit rate over 12800 =
kbytes/second burst 600 kbytes }
	}

	chain download {
		type filter hook egress device =E2=80=9Ceth0" priority =
-450; policy accept;
		ip daddr @limit_dl drop
	}
}


Idea is to move limiter in egress and ingress.

which should reduce the CPU load perhaps


Best regards,
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

