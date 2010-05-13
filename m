From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: Broadcast redirecting
Date: Thu, 13 May 2010 22:17:14 +0300
Message-ID: <AANLkTim2NxNBwc1icLR_o3ibcz3r5udD9deRdAplSqw6@mail.gmail.com>
References: <AANLkTikn9mpzLV3YRvtvwQSIlX31ZZBmWItU8tgf9QkV@mail.gmail.com>
	 <4BEC3608.5050603@uncu.edu.ar>
	 <AANLkTillMVOffaQflD1r5oHwypoAOvxM51EwBSJRd9UV@mail.gmail.com>
	 <AANLkTimnJP4xewG1ANHRCTakHDEvo3NRtoYyJMFTCD-G@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Zz9mGY1+z/UpU38fChycXFRVoPlPAyqYovPkenxjfCo=;
        b=YpeuuVXoVpdfErcH9dh9UNiXg8soqs7LK8wUK3BTW04ya7KXhjOMsvd4XZJ8pR3vux
         cY5MfZezUGcjB+JxVrrDmALtFOGZDChWEajb4aNjJCkwVnvXiLEvz16vxme9nSvZcCim
         KqHBHBhgQX0XjVudBl5sAL+RmyPtAP9dXw5Jk=
In-Reply-To: <AANLkTimnJP4xewG1ANHRCTakHDEvo3NRtoYyJMFTCD-G@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Curby <curby@cur.by>
Cc: netfilter@vger.kernel.org

2010/5/13 Curby <curby@cur.by>:
> On Thu, May 13, 2010 at 12:22 PM, Anatoly Muliarski <x86ever@gmail.co=
m> wrote:
>> Also I can write some daemon in Perl which will receive broadcast
>> packets and inject them on another interface. But the source address
>> of the injected packets will belong to the router and I need them to
>> be as in original packets.
>
> I'm no good at Perl but I think it has an interface to hping, which
> can be used to craft (or mangle?) packets as you please. =A0May be
> something to look into.
>
> --Mike
>

Thanks for the idea, I'll try to have a look into it.

Currently, I have investigated using brouting - it looks more attractiv=
e.
The idea consists in mostly using L3, but treating broadcast on L2.

Here is a sketch:
brctl addbr br0
brctl stp br0 off
brctl addif br0 eth0
brctl addif br0 eth1
ifconfig br0 0.0.0.0
ebtables -t broute -A BROUTING -p IPv4 --ip-dst 255.255.255.255 -j ACCE=
PT
ebtables -t broute -A BROUTING -j DROP

I should try it later.



--=20
Best regards
Anatoly Muliarski
