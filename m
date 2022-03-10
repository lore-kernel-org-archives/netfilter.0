From: Marcin Kabiesz <marcin.kabiesz@smarthost.pl>
Subject: Re: NAT translation problem - leakage of packets with original source
 address
Date: Thu, 10 Mar 2022 13:33:09 +0100
Message-ID: <613d3843bf5e37cdf890b64b416471f3@smarthost.pl>
References: <0e142c6e43516aa01a9bcf6f6df9b31d@smarthost.pl>
 <20220310120809.GD26501@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=smarthost.pl; s=default; h=Content-Transfer-Encoding:Content-Type:
        Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=EVjVefNbhwWHocGxgmTI0Q/abOyRpLNZYvOo7DHFetk=; b=I6q8ZAsQr3+VHKx/ZKD5fPY7Qi
        qUcwaQUVUw4g1ByOu4G5ZgMpPKAFcBUr7MR//O/q9obaRbT2DGSy0rHHTLHTKyN9LbPd3BX2IZZNF
        Pnfvh6eJsE0Dp1AxCd78JJiA4lZON52j2ecn1AjKxBpMEkmQpTpgXNFbhR7+Isb2HnmaZOK/oo6kI
        HILAy7gjhCrDSIDLFQf+mZpOC9AZslKkyc3r49ICYDVcSFs16qlLlLQOfT7YYbhIiLscZttExZa0H
        Gq9DSFA9unqSydLNxmoOpH1yurDhRVoFIWVQV9O+l1ZTsFF5/p85IMMhaEFSO5rNkvAekbbS+B5Gs
        j4trF6 
In-Reply-To: <20220310120809.GD26501@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

W dniu 2022-03-10 13:08, Florian Westphal napisa=C5=82(a):
> Marcin Kabiesz <marcin.kabiesz@smarthost.pl> wrote:
>> is it possible that with the OpenVPN interface tun0 every now and then=20
>> some
>> packets with a private source address are visible and forwarded to the
>> router?
>=20
> Yes, NAT is only applied to packets that conntrack considers=20
> sane/valid.
>=20
> You can e.g. add a drop rule for INVALID packets.

Welcome,
Thank you for your answer.
My question is where do I create a rule for invalid packets? in NAT=20
POSTROUTING? or MANGLE POSTROUTING or other place leaving the server? I=20
am waiting for your opinion.

--=20
Marcin Kabiesz
Administrator Sieci IT
