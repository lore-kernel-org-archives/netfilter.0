From: Eric <evil.function@proton.me>
Subject: Re: ipset swap to nftables set
Date: Fri, 29 Sep 2023 14:30:50 +0000
Message-ID: <BjREwaQOkZH39wBPsI8ssbjemY70ncttNem9PHtJiq-_5H7NfnmFDCyS7nf6pPMtUR2BCZS_KG2SMuMyXZfL7gUdsM_93_kLkCdQWG-H2lg=@proton.me>
References: <befa0f8e-e76f-8671-81b1-587351b0cf53@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=b2yff7x75jfovexaaixk6pxkjq.protonmail; t=1695997865; x=1696257065;
        bh=eDlU/ZlfgYXslfsU3shHwwMsKUpElH7E0S0DDpNUAzs=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=G4cIm+DcmCMJ1PGbTzdXIhqUzVfEckbLYVg2TbWq0z6UeeASuX9d/vYPWd4IUXIk5
         fZ1YHLMlfekszdgV1N/hF5y/QDTDSzSqicPzKjkXT179kGLNkPi4M7ovMPEl33y1lv
         Z/YQH3fk3Vg9hwC1wZtXyVsz6WMy2UYGpyCZGT5FopDmmGON0913tedsig3ZUj4ghs
         G88E59uO5ZUHJabyVSk0ip+WNV+q5XKIzd6XieyvwO3HqEgT8gYIsplBtaa1ei/nOI
         oIbM0HnCz1qVRH+ohVVLyctgn10dUILCcnicTeDF2nrGE4EEaZCTSQUFQQ0g/2xeC1
         DOPSAI45wATEQ==
In-Reply-To: <befa0f8e-e76f-8671-81b1-587351b0cf53@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: marek <cervajs64@gmail.com>
Cc: netfilter@vger.kernel.org

On Friday, September 29th, 2023 at 06:44, marek <cervajs64@gmail.com> wrote=
:
> - nft flush set ip filter blackhole
>=20
> - nft add element ip filter blackhole { X } (bash for loop)

Hi Marek,

Do that last step atomically and it should be plenty fast.

nft flush set ip filter blackhole
nft add element ip filter blackhole {\
    1.0.0.1, \
    1.0.0.2, \
    1.0.0.3, \
    1.1.1.1, \
    1.1.1.2, \
    1.1.1.3, \
    1.193.146.35, \
...
    99.99.99.99, \
}

Eric
