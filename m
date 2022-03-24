From: Martin Zaharinov <micron10@gmail.com>
Subject: Re: bug report and future request
Date: Thu, 24 Mar 2022 14:23:44 +0200
Message-ID: <9ED435A1-F1B8-4220-9466-FA3E9D100B1D@gmail.com>
References: <AE6DAC96-EC3E-43C9-A95A-B230842DD7B1@gmail.com>
 <20220321212750.GB24574@breakpoint.cc>
 <4B0C8933-C7D8-49BA-B7F2-29625B0865C1@gmail.com>
 <20220322103203.GD24574@breakpoint.cc>
 <04C4931B-553E-4FEA-85D4-B3E186520EE5@gmail.com>
 <FE0EEED5-48C9-412F-81BA-0028818C2EE8@gmail.com>
 <DB57EE0F-F4CE-4198-89E0-F25ED3C321A5@gmail.com> <YjxiB6Jk4plpx48G@salvia>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=l6C93k9VVPLR/0Jfqmka7vcT6jFa06WK7gH559/5qJo=;
        b=aUNTCcuhIJOfJ1DktkETBxJz8cLKJLmUghuq+aJCWbcPYtE54stSLzdnwR0Bye7q+/
         UyX7CXJqgOzwrSjm/3FhjsxFevRC1mnuPkVP+ftQE99jPsWXD/OG9ow5Vwg9QQKAcDO3
         QNjwKzgiuF4nzrg34MR2D3elpCmcWqh7EDJOClPuazT9lJ/UloV6it/b/27a/PdNqdVN
         VV4Ck3H4oYRDfrGdWYmvaA/Mhu7Kh1roEOZJF3ncVim+9bZqtWOJux+3/uLGAVK28Jlk
         sOSxO+dVCi2gVjrQEfWFjw5AihTZJmk3BX/R/8T2cC6691nnZSbEkLe2HBwYDLeCgPSC
         tTVQ==
In-Reply-To: <YjxiB6Jk4plpx48G@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

Hi Pablo

base on this rule :=20

table inet nft-qos-static {
        set limit_ul {
                typeof ip saddr
                flags dynamic
        }
        set limit_dl {
                typeof ip daddr
                flags dynamic
        }

        chain download {
                type filter hook postrouting priority filter; policy =
accept;
                ip daddr @limit_dl drop

        }
        chain upload {
                type filter hook prerouting priority filter ; policy =
accept;
                ip saddr @limit_ul drop;
        }
        flowtable fastnat {
                hook ingress priority filter; devices =3D { eth0, eth1 =
};
        }
        chain forward {
                type filter hook forward priority filter; policy accept;
                ip protocol { tcp , udp } flow offload @fastnat;
        }
}


where to set this , please help.


> On 24 Mar 2022, at 14:20, Pablo Neira Ayuso <pablo@netfilter.org> =
wrote:
>=20
> On Thu, Mar 24, 2022 at 02:09:25PM +0200, Martin Zaharinov wrote:
>> One more update=20
>>=20
>> I try to make rule for limiter in offload mode :
>>=20
>> table inet nft-qos-static {
>>        set limit_ul {
>>                typeof ip saddr
>>                flags dynamic
>>        }
>>        set limit_dl {
>>                typeof ip daddr
>>                flags dynamic
>>        }
>>=20
>>        chain upload {
>>                type filter hook prerouting priority filter ; policy =
accept;
>>                ip saddr @limit_ul drop;
>>        }
>>=20
>>        chain download {
>>                type filter hook postrouting priority filter; policy =
accept;
>>                ip daddr @limit_dl drop;
>>=20
>>        }
>>        flowtable fastnat {
>>                hook ingress priority filter; devices =3D { eth0, eth1 =
};
>>        }
>>        chain forward {
>>                type filter hook forward priority filter; policy =
accept;
>>                ip protocol { tcp , udp } flow offload @fastnat;
>>        }
>> }
>>=20
>> its not work perfect only upload limit work , download get full =
channel=20
>>=20
>> in test i set 100mbit up/down  upload is stay on ~100mbit , but =
download up to 250-300mbit (i have this limit be my isp).
>>=20
>> the problem is limiter work only for Upload , is it posible to make =
work on download rule ?
>=20
> If you want to combine ratelimit/policing with flowtable, then you
> have to use the ingress and egress hooks, not prerouting and
> postrouting.
>=20
> Make sure you place the flowtable in a priority that comes after the
> priority of your ingress hook.

