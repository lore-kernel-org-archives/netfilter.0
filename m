From: =?UTF-8?Q?Humberto_Juc=C3=A1?= <betolj@gmail.com>
Subject: Re: How to trace IPSec packets?
Date: Mon, 29 Jan 2018 09:25:42 -0300
Message-ID: <CACuyg267+379fHkBactPOShqsrXzQWxq4TM6ZBFh=WJZvqN0vQ@mail.gmail.com>
References: <2A246279-5BD5-4858-9E81-2132542CD4DA@gmail.com> <CALNXhk0TefWZQ7_e+JOuDL7Qs7KFq2DwQ4h+CayKHd3uWd_y_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=+1hSu9wudV339LqPjzLBjNEDdzGkrG/ShgX7I6s39p8=;
        b=u+L6OqSSxe4+0fREJUeyERl63hykuFpeCdroeWI0SXm+AoWLzCoZ71lDmrNeuPuhGa
         NSdLokpXjXZ0C3iNdLgKGa7HBLYDt8u6Tf7OowVjQmQZWEVJR0bsEFJugTDnA+QLqi1T
         WsiH4/sBGa4QQR+yb1zMtAQ6dek5hle89ZyXduHwlGhHt6uZ4RvOz3apGuNDcTjzbCzS
         vnzmktOzb4vNheAqnifQSqd3bU7c+7ORZ/qfor74uwrbywOMCfDiNHXHKgXin0n6Kkcp
         Qa5FULpHcOSw+pPHF50lHQ9M4st1aswjlEVvSnVUhf0I/rH61TQi+B9G1+bzNB2NAz7h
         CGHQ==
In-Reply-To: <CALNXhk0TefWZQ7_e+JOuDL7Qs7KFq2DwQ4h+CayKHd3uWd_y_Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Glen Huang <heyhgl@gmail.com>, netfilter@vger.kernel.org

Hi Glen Huang,


> I have an IPSec tunnel set up between my machine and a server.

- check you source routing address with this command:
ip route get 8.8.8.8

"So, replace your source address to *src ip address*"


> But after dig @8.8.8.8 google.com on my machine, running grep 'TRACE:' /v=
ar/log/kern.log on the server returned nothing.

- after this, you need rewrite your firewall rules in a OUTPUT chain:
iptables -t nat -I OUTPUT -s $SRC_ADDRESS -d 8.8.8.8 -p udp
--dport 53 -j DNAT --to-destination 127.0.0.1

"Because you are redirecting your internal traffic, use OUTPUT chain."

2018-01-29 7:07 GMT-03:00 Glen Huang <heyhgl@gmail.com>:
> (Previous message seems to get smudged. This is a resent.)
>
> Hi,
>
> Hope the question isn=E2=80=99t too basic to be asked here.
>
> I have an IPSec tunnel set up between my machine and a server. All
> packets originate from my machine go through that tunnel and then get
> forwarded by the server. I=E2=80=99m trying to redirect DNS request from =
my
> machine to 8.8.8.8 to a dns forwarder running on the server.
>
> I tried this on the server
>
> iptables -t nat -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp
> --dport 53 -j DNAT --to-destination 127.0.0.1
>
> But it didn't work. To make sure it wasn't because I hadn't allowed
> martian packets or anything. I tried to trace the decrypted packets.
>
> iptables -t raw -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp
> --dport 53 -j TRACE
>
> But after dig @8.8.8.8 google.com on my machine, running grep 'TRACE:'
> /var/log/kern.log on the server returned nothing.
>
> According to this picture:
> https://en.wikipedia.org/wiki/Iptables#/media/File:Netfilter-packet-flow.=
svg
> after decrypting the ipsec packets, netfilter will make the decrypted
> packets go through the ip stack again, and the trace target should be
> able to catch it.
>
> I wonder if my mental model is incorrect or I missed something?
>
> Regards,
> Glen
>
> On Mon, Jan 29, 2018 at 5:10 PM, Glen Huang <heyhgl@gmail.com> wrote:
>> Hi,
>>
>> Hope the question isn=E2=80=99t too basic to be asked here.
>>
>> I have an IPSec tunnel set up between my machine and a server. All packe=
ts originate from my machine go through that tunnel and then get forwarded =
by the server. I=E2=80=99m trying to redirect DNS request from my machine t=
o 8.8.8.8 to a dns forwarder running on the server.
>>
>> I tried this on the server
>>
>> iptables -t nat -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp --d=
port 53 -j DNAT --to-destination 127.0.0.1
>>
>> But it didn't work. To make sure it wasn't because I hadn't allowed mart=
ian packets or anything. I tried to trace the decrypted packets.
>>
>> iptables -t raw -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp --d=
port 53 -j TRACE
>>
>> But after dig @8.8.8.8 google.com on my machine, running grep 'TRACE:' /=
var/log/kern.log on the server returned nothing.
>>
>> According to this picture: https://en.wikipedia.org/wiki/Iptables#/media=
/File:Netfilter-packet-flow.svg after decrypting the ipsec packets, netfilt=
er will make the decrypted packets go through the ip stack again, and the t=
race target should be able to catch it.
>>
>> I wonder if my mental model is incorrect or I missed something?
>>
>> Regards,
>> Glen
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
