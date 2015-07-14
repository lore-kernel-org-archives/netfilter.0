From: Glen Huang <hey.hgl@gmail.com>
Subject: Re: Network slowing down by masquerade
Date: Tue, 14 Jul 2015 20:52:34 +0800
Message-ID: <1E8FACB4-D45A-4564-AA7A-B7A940B91867@gmail.com>
References: <C20C16F2-3345-4B9F-835B-7C35207A3A88@gmail.com> <55A18502.6090201@plouf.fr.eu.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=content-type:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=KusCkXy+0fu/FOwWVqDrFdgjg4E8QbvT3Jh+hr2s33k=;
        b=BEMhMqf5ZY8OZW/v16CFKt8VWOmBYdOJbeu5AU9RM+jwN0a13TzPFaR8Hd2uH1Zizg
         lzi1iSDOqdyErAq8O3w/ACjmffq0dC79eGim+FmshtRxAC5QTdbeODh2p3WNNObqGgHI
         1/7nvkgEqdNj3RnkRaTr2hozV4ZhRB7li+ZZP0QbmqRRW/bTb3OTn/bm/xNM/lOq7zFQ
         RvciP0oShVzoYhSISA1ahIuwwUCIxZ8jogg6e8LHvr94A7x4yqM3DVgfiZsNhVekc8uz
         6nzpQhqzM8MR9ROHxBkIUu1cgQ9VzABNglb7ns2LKEVl7yB+Z6AaeNHjnA4J5YGIffrM
         a+Mw==
In-Reply-To: <55A18502.6090201@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> Why do you have to use --interface ?

Because ppp1 is not the default route's output device. I'm running that=
 command on the gateway to test the connection. Forgot to mention it, S=
orry.

> I would suspect first MTU issues

It's indeed a MTU issue. After enabling MSS clamping, I get full speed =
on the host. Thank you so much for the help. :)

> On Jul 12, 2015, at 5:05 AM, Pascal Hambourg <pascal@plouf.fr.eu.org>=
 wrote:
>=20
> Glen Huang a =C3=A9crit :
>> I have a pptp client connection (ppp1) on a gateway. If I directly
>> using curl --interface ppp1 to download a file, I get full download
>> speed very quickly (2m/s).
>=20
> Why do you have to use --interface ?
>=20
>> But if I route my lan host to ppp1 and -o ppp1 -j MASQUERADE, runnin=
g
>> curl to download the same file on the host starts very slow (less th=
an
>> 100k/s), then the speed *slowly* increases(about 50k per second), un=
til
>> it reach about 1.8m/s. While downloading the file on the host, the
>> gateway's cpu usage never reach 1 from the output of top.
>>=20
>> If I directly establish the pptp client connection on host, I quickl=
y
>> get full speed again.
>>=20
>> I wonder what might slow down the network when the packets are
>> forwarded. I'm currently guess it's the masquerade target, but I'm n=
ot sure.
>=20
> I don't think MASQUERADE is the culprit. I would suspect first MTU
> issues (fragmentation, path MTU discovery).
>=20
>> How do I test it?
>=20
> Lower the MTU of the client host LAN interface below ~1460.

