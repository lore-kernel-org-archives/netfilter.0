From: Aaron Gray <aaronngray.lists@gmail.com>
Subject: Re: understanding my MASQURADING and SNAT problem
Date: Fri, 25 Oct 2019 00:59:03 +0100
Message-ID: <CANkmNDdOVO4xfZbvRLr6pH-yPg=wgeJ8ZbPwK7ChT5cDabt1Xw@mail.gmail.com>
References: <58adc088-21de-2280-4d77-83ed4c6d2c01@gmail.com>
 <554e82c0-c51c-d555-8fc4-229887bd6fbb@trustiosity.com> <CANkmNDdnBB92niurKFGojdpUi8_wwLFooUWZmYQijMK5Vn1LvA@mail.gmail.com>
 <d3dbd5e3-3d3a-36b7-1552-4af71586a6ba@trustiosity.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q4n6iQ2Spd3OYcymZ/pVTldt/Vbyu/H/b2bIgY6Jg0o=;
        b=mlS48sdTpS2elFsZD3YfG55CI4yDi8SWsy0/f7djpVjhw8l511l9NLa8khh/LSupUD
         Ue6qiu+R8QNRTv1nhVI5DHg0CDOHLvkd0UOb9Lah1LsY1D6XN25QrJO4S8CWKYy2P//r
         MCcAEV5smjDTAhDKUKtppsP1Ly4BgFsK0ISNI/MnLhoopd1/KwtKCoZFTgguRQIuxkhh
         rL8qLjlm+4CgX00x9DVcAynzbgKFR9VESVoL+zZs94fgb1Dqd7r4r10VqEYTKKPkxzzV
         sLmCDnasYhSjGciHCFkN/qT/B9ZEHoab1mDlEJ4kRTGM2uMRXxlImWvotOYvb8/ULWxC
         PXCQ==
In-Reply-To: <d3dbd5e3-3d3a-36b7-1552-4af71586a6ba@trustiosity.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zrm <zrm@trustiosity.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wednesday, 23 October 2019, zrm <zrm@trustiosity.com> wrote:
>>
>> iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
>> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>> iptables -A FORWARD -i enp5s5 -j ACCEPT
>> iptables -P FORWARD DROP
>>
>> And then reject the things you actually want to prohibit, e.g.:
>>
>> iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
>> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>> iptables -A FORWARD -i enp4s0 -p tcp --dport 25 -j REJECT --comment "no spamming"
>> iptables -A FORWARD -i enp4s0 -p tcp --dport 80 -j REJECT --comment "no unencrypted HTTP"
>> iptables -A FORWARD -i enp5s5 -j ACCEPT
>> iptables -P FORWARD DROP
>>
>
> That should've been this, using the internal interface rather than the external one:
>
> iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i enp5s5 -p tcp --dport 25 -j REJECT --comment "no spamming"
> iptables -A FORWARD -i enp5s5 -p tcp --dport 80 -j REJECT --comment "no unencrypted HTTP"
> iptables -A FORWARD -i enp5s5 -j ACCEPT
> iptables -P FORWARD DROP


Okay I was confused about that.

>
> Note that this is a strong reason to rename your interfaces to something meaningful instead of using the ugly meaningless default names.


Yes I miss eth0 and eth1 !

Many thanks hopefully that clears everything up I suspected I had done
something stupid. And half suspected I needed to use the filter table.

Cheers,

Aaron
