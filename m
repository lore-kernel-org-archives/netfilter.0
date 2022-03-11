From: Marcin Kabiesz <marcin.kabiesz@smarthost.pl>
Subject: Re: NAT translation problem - leakage of packets with original source
 address
Date: Fri, 11 Mar 2022 14:45:30 +0100
Message-ID: <d95e4de88480f899812f86d9d71ed25c@smarthost.pl>
References: <0e142c6e43516aa01a9bcf6f6df9b31d@smarthost.pl>
 <20220310120809.GD26501@breakpoint.cc>
 <613d3843bf5e37cdf890b64b416471f3@smarthost.pl>
 <20220310145331.GD13772@breakpoint.cc>
 <039c7dc8fed7947df5a7e72ead9a9627@smarthost.pl>
 <20220311125326.GA10646@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=smarthost.pl; s=default; h=Content-Transfer-Encoding:Content-Type:
        Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=I+KfR0+QS8m+PhbUnQmhIMGnuKp0G5FMzgsAHix2unc=; b=yt/elNs0r4TN0EHlqvTEFFdMOu
        vVsWkmR9Vne0wK0H1rz46lQsUjQFpVQy8Wusa9ghGyGtPDpU6OARvCkbMkuXo5NgkX+Gfzo/oKJ/4
        0jTcJolNfUDpZQDTxPeLD2GrdUyi6O3ntcEAEQc41I942xI6Y063puc4YFbIiWE6FWiMMEDS5Ifdk
        /ejAzI/oOpcDgW4iSfDXgKYx2l9cTK5uil8vLJWfaZYHW/lhF0Ci19fdM73NdmqnbpwdZ3WZVXTKB
        14eeHCzHHs5ACgdsMuNaMQMNZXMwn8s/dM11r7uS2uplTnFR9f1hfjinrr4LNPgE4NyMR1EG8XsMv
        46rUs9 
In-Reply-To: <20220311125326.GA10646@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

W dniu 2022-03-11 13:53, Florian Westphal napisa=C5=82(a):
> Marcin Kabiesz <marcin.kabiesz@smarthost.pl> wrote:
>> Chain POSTROUTING (policy ACCEPT 1170K packets, 1616M bytes)
>>  pkts bytes target     prot opt in     out     source
>> destination
>> 84216 8212K ACCEPT     all  --  *      eth0.2  192.168.10.0/24
>> 0.0.0.0/0
>>  552K   46M ACCEPT     all  --  *      eth0.2  192.168.11.0/24
>> 0.0.0.0/0
>>     0     0 ACCEPT     all  --  *      eth0.2  192.168.12.0/24
>> 0.0.0.0/0
>>     0     0 DROP       all  --  *      eth0.2  192.168.0.0/16
>> 0.0.0.0/0
>>     0     0 DROP       tcp  --  *      eth0.2  0.0.0.0/0
>> 0.0.0.0/0            state INVALID
>=20
> I suspect you need to move the INVALID rule to the beginning,
> else packets might get accepted by earlier rule.

Hello,
this is how i coped with this problem. Thank you for all your help :)

https://bugzilla.netfilter.org/show_bug.cgi?id=3D1115

I checked and filtered INVALID accordingly and it works :)

--=20
Marcin Kabiesz
Administrator Sieci IT
