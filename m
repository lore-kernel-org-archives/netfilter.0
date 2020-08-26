From: "" <kfm@plushkava.net>
Subject: Re: How deactivate a rule using nft cli?
Date: Wed, 26 Aug 2020 18:52:21 +0100
Message-ID: <e6034d59-ebbc-870a-40bf-3a4b0e2d2b07@plushkava.net>
References: <CALtjan=Py8Qq95LZCg+kGJrW-MuOFo2+xPdy8-Nhf4a374sd0g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=M
        QaWom41stRlsy2s7980gDRbFxyPrme5j70I2O9mOn8=; b=caJSjI05UIBqW/zB8
        NL3T+KAjjR1nwg1KonN8XL/Ekl23u6fc4jSJkm+eyqALx3KvghWL/GeXuCV5HbLq
        4SHJVGiwQvh01vf6MWXe33dCf9tj9IxkmV9dCEc+bChXnGz2le8SNXZcTCPJKwD7
        op6P7hvelX0GmWIlg2espT1EIONhFe0dZ2+/curTqourrIo/r1vXsZ2oqUkoGpOT
        Uk3pjOd/pQaS1kcgD6jfEVImTB1C5cn+VQ5qf0EwcH8suXolihWmROr0uz/6J/mi
        lrED8fEymEJHDgPjtEAX1TynJvUK4vNfKFLhZ3Ov8ys7fNtpoHQXG0SAWKk9Ko6S
        JuHKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=MQaWom41stRlsy2s7980gDRbFxyPrme5j70I2O9mO
        n8=; b=VchpVFV+3Rppje42qMq4SweJ5DhD8cBhSNmCydcfy3XJsEhnGGMfBKsmi
        e8W6e18hBVxLINUyEaODuYFJr9y5J5d2phGCpVN7xOkgJ8DcZ+9Xt1dK5QhWzfDn
        nYmyr6NEGsQt+NMZk76JNANcbwsEkcxiBIfgsrFTe5XN6C+BNSNgVDalT1SiJ+fI
        PVZyv3Ait5kC4D48iujG/K8mIgGB7FlTnikyWsL+l0Ptr3cP6OYsxjXly7igLxdP
        QPOhC7ZXmJXZ+bWJmRNDZWd5oaid8Vl+CYNRx6CX7VG9oM/5/dHy/RZQyZnDWduK
        utgjvgGFLD02+XzOKiwlXHvJJzEEA==
In-Reply-To: <CALtjan=Py8Qq95LZCg+kGJrW-MuOFo2+xPdy8-Nhf4a374sd0g@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Luis_Mario_Niedas_Hern=c3=a1ndez?= <lmniedas@gmail.com>, netfilter <netfilter@vger.kernel.org>

On 26/08/2020 18:42, Luis Mario Niedas Hernández wrote:
> Hello. I want to deactivate a rule in my nftables.conf. I just want that a
> especific rule it is not considered by netfilter, but I don't want erased.
> It is possible to do it?
> 
> I am a Spanish speaker, so, sorry if I made a mistake with the grammar.

Make the line a comment with the # symbol. Alternatively, you could 
alter the rule so that it effectively does nothing. For example, this:

   tcp dport 22 accept

… could be changed to:

   tcp dport 22 comment "disabled"

-- 
Kerin Millar
