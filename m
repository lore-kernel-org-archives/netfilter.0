From: "Kerin Millar" <kfm@plushkava.net>
Subject: Re: ipset swap to nftables set
Date: Fri, 29 Sep 2023 15:59:35 +0100
Message-ID: <e1fd3920-5ce2-4a73-9985-ea9fdb12358d@app.fastmail.com>
References: <befa0f8e-e76f-8671-81b1-587351b0cf53@gmail.com>
 <BjREwaQOkZH39wBPsI8ssbjemY70ncttNem9PHtJiq-_5H7NfnmFDCyS7nf6pPMtUR2BCZS_KG2SMuMyXZfL7gUdsM_93_kLkCdQWG-H2lg=@proton.me>
 <540ed704-0167-821c-48fb-f6f1d3579b33@thelounge.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-type:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1695999608; x=
        1696086008; bh=0f9PVzDopty3NYSn/CnTpDi6cQ/7PEttOUaCutnZRc0=; b=C
        qwHpoZSnSI09t+RHcBArebSdLXp0h6/h27zM4/dN1+Ruug41k3ocKtnLDPwUVHLt
        l576MtFFQnWx6lg9wdcDLb7AYTJPpfZFZC9pnPxJaswgISGhsmqMxIKmo411RRLB
        2cs7nqycc/1gWD1o6+lVQGApzZjbh2WdGaVmG/s+/jjAuvFIVZJTq/ykeg5OAPlH
        SxfcquUWDegDkX4uRJsK2mGhe8RsQ9HLO17jURpNSR0YHOEER5DASv2/cMDiJ9RL
        IgcQ9ZENPC+H1toaQhSnry8wLfWE1a5FC2Pt6upZlFo01UwoBaE6gCUbnwSWvq30
        Op47r9bYIC6nVUTAR/Hbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1695999608; x=1696086008; bh=0f9PVzDopty3N
        YSn/CnTpDi6cQ/7PEttOUaCutnZRc0=; b=Qb1353H+EMr5PJMeI/Jc1uAZzHs2j
        9dBTHA2JSUeURw+KTLA8dtgn8qcH/qRzh4S3g6nT5ovMARHlJ5L8xZsHhszAZJQE
        EMOwhwZQ1/VaUvM/OblqNGo+WdqaNxvGga+Y5ybn+V2GwN6LR1zTPBgncY21seRF
        RO3Q6lqvn0oaxnUcFn9+0R3YyR8jNNSQ8lAUhQdw0TtJF9Qe2n5CLziPgXCz9nwr
        7eswmQzRlY9odAkYkaqGhl/RouuVa4Nez9c5ZGW03fHWHfOmQdZQmp3T/yZMVKP7
        6HjunhwEcs2cYT+FY+4hQwu3mmHdYaFculP5Vw91S/pdG7C3wsJo9c5Iw==
In-Reply-To: <540ed704-0167-821c-48fb-f6f1d3579b33@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reindl Harald <h.reindl@thelounge.net>, Eric <evil.function@proton.me>, marek <cervajs64@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 29 Sep 2023, at 3:36 PM, Reindl Harald wrote:
> Am 29.09.23 um 16:30 schrieb Eric:
>> On Friday, September 29th, 2023 at 06:44, marek <cervajs64@gmail.com> wrote:
>>> - nft flush set ip filter blackhole
>>>
>>> - nft add element ip filter blackhole { X } (bash for loop)
>> 
>> Hi Marek,
>> 
>> Do that last step atomically and it should be plenty fast.
>> 
>> nft flush set ip filter blackhole
>> nft add element ip filter blackhole {\
>>      1.0.0.1, \
>>      1.0.0.2, \
>>      1.0.0.3, \
>>      1.1.1.1, \
>>      1.1.1.2, \
>>      1.1.1.3, \
>>      1.193.146.35, \
>> ...
>>      99.99.99.99, \
>> }
>
> still horrible ciomoared to ipset swap beause it is *not* atomically

It should be atomic, provided that the command stream conveyed to a single invocation of nft includes both the flush and add command. That's how I've been going about it for years now. 

Here is an example, in which a list of newline-delimited IPv4 addresses is consumed from a file named "ipv4-list.txt".

{
    set="ip filter blackhole"
    echo "flush set $set"
    echo "add element $set {"
    sed -e 's/$/,/'
    echo "}"
} < ipv4-list.txt | nft -f -

-- 
Kerin Millar
