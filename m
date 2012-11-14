From: =?UTF-8?Q?J=C3=B6rn_Krebs?= <jk@smartbyte.de>
Subject: Re: VoIP conntrack issue
Date: Thu, 15 Nov 2012 08:33:21 +1100
Message-ID: <CABY2qi-PHM03ZmkvxCb7PkmCOosA5da9Jqd+nTzj3XHcrZOEhw@mail.gmail.com>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com>
 <201211122202.02082.neal.p.murphy@alum.wpi.edu> <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com>
 <alpine.LNX.2.01.1211140225280.4653@nerf07.vanv.qr> <CABY2qi8BmP4t1=4gj4iW1niTJWNagTbeVu=C+t6S2WvfyRttBg@mail.gmail.com>
 <alpine.LNX.2.01.1211141055040.4653@nerf07.vanv.qr> <50A3BB0A.9070301@ngtech.co.il>
 <alpine.LNX.2.01.1211141648280.17446@nerf07.vanv.qr> <50A3C06B.2050301@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=Qo7E9Tpw93JJdweMwp6bPw1DqtFC5gxYSoyORNpwvOo=;
        b=iy5jQCtIAGeffkaFwi+IyDkSgqikbzg8gZIQxIeySb9tvJKNTiHlpoRSY8HSnzsiTd
         HAEJa7O9mGkD1UccVbt5jcbWshm2yc8FLK4G32ASoiJBGrQB7bKTe3msX245EWlf8pPf
         JWOSBqfAAlMl92hw+/O9pSKYYnBrB3/lUIid60mUJJl9gsdJkQSEj8mHgfTNE1t77sUd
         JTOX/CWaHOR/++4ZYiOj/IuyiQQofmaG1zksRcWHwn4pW6UD/YZcKIHvUgP4ICkUgcW6
         q2+hy8t7QAh8G2GuUtaBi+nt065JNewXq4LwwWLH+GKWJ5ZPPgEhMe01h+ndbocwjJJd
         RwqQ==
In-Reply-To: <50A3C06B.2050301@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@vger.kernel.org>

Hi guys,

sorry, but you didn't get my point:
The most advanced networking operating system is not capable of doing
symetric NAT?
That's bad. that's just plain bad.

I will try to get someone on the development list.
I am working for a big company ( which does not rely on this, that's
my private stuff, luckily),
but if we would do this kind of incomplete Development (not
implementing the symetric NAT functionality, although we obviously
know, that it would make things work better),
we would be in trouble. Sadly no one does pick up the point in this,
that there is some missing functionality.

Thanks for you advice with using static mappings, but that doesn't
work, as I cannot predict which ports my phone will use.
(I did that trick with two phones I have at home, but it will never
work with my mobile, so that isn't a solution.)

Thanks guys, and bye.

On Thu, Nov 15, 2012 at 3:01 AM, Eliezer Croitoru <eliezer@ngtech.co.il=
> wrote:
> On 11/14/2012 5:54 PM, Jan Engelhardt wrote:
>>
>> On Wednesday 2012-11-14 16:38, Eliezer Croitoru wrote:
>>
>>> >Or instead just use DNAT with specific ports that will allow any o=
ther
>>> >traffic from this host to others based on basic NAT what called
>>> >"port-forwarding"
>>
>> Port forwarding is a terrible misnomer, because the port itself is a=
n
>> entity belonging to the host, and as such static. NA(P)T, or "port
>> mapping" if you have to, is just fine and catches the spirit properl=
y.
>> If you need a car analogy, you can't move the piers/ports either, on=
ly
>> the ships.
>>
>> That said, DNAT is exactly what I gave as one way of resolution. Fro=
m
>> there, one can use --dport(s) as needed, but then that's not a full =
1:1
>> NAT anymore.
>> (I get the feeling my mail was ignored, perhaps you should go throug=
h
>> the text and bottom post like everybody else.)
>>
>>>> >>  iptables -t nat -A PREROUTING -i internet [-d 114.XX.234.123] =
\
>>>> >>           -j DNAT --to 192.168.1.38
>
>
> Since he has very specific problem I suggested to do that which exten=
ds your
> saying.
> By the way you spelled it better then me..
>
> Regards,
> Eliezer
>
> --
> Eliezer Croitoru
> https://www1.ngtech.co.il
> IT consulting for Nonprofit organizations
> eliezer <at> ngtech.co.il



--=20
Bye Bye, J=C3=B6rn Krebs
--------------------------------------------
64 Queen St., Blackstone 4304
Phone: +61731363381
Mobile: +61431068955
Telefon: +495516345347
