From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables 0.9.2] does jump require a kconf to be set to get it
 working?
Date: Wed, 12 Feb 2020 16:41:10 +0000
Message-ID: <a581ac40-f8ad-c009-4c83-40f1833b6ddb@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581525671;
        bh=YfBi1+qDLUCswhGEW68Wzcbur8hHplSGvol6Bp5bKwk=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=AnOvAIV/l2yLDO6BKEHFetVLZuCmvfUQL7zzwP14oF2PNS0guOwHrItSk7VtbJXRh
         Kn0Tq292fUA/hctONdxYhX0651pLWHwJwrMOrBP+PRdqpaZwXOTUfMWrSLGfH4Wqbx
         SRVa6re8l0X2ZxR+D1vLJsf1f89Tf3shcV/Dv44s=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Have tried to some online guidance which NFT features require which=20
kernel config to be set to get them working and whether jump is among=20
such feature set.

Because hitting:

Error: Could not process rule: Not supported

with:

table inet filter=C2=A0 {
 =C2=A0chain input=C2=A0 { type filter hook input priority 0; iifname ppp=
oe-wan=20
jump wan_i }
}

