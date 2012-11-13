From: =?UTF-8?Q?J=C3=B6rn_Krebs?= <jk@smartbyte.de>
Subject: Re: VoIP conntrack issue
Date: Tue, 13 Nov 2012 14:20:28 +1100
Message-ID: <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com>
 <201211122202.02082.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=q3y0f+ArKwqcxcQOyetEuX55qaGfHTyUKsAhDWLDx8w=;
        b=Sdk/zNPiFnTnyp5LBM86xU38375uBGaDPteF+ykj2LJ3VP6l6zYt6mwHemR+43YoNw
         LZdOP8UbMFPq7CjODenIwE2+PM368d9JwS04LyYrU8HYC6d28mCql73IfPxo4Y089hIw
         II5IevQIc+wsdMVHtcTdSd6PitWOkaTMAs7r86FzSSaZ+JqX6zhaUatxNhoiX1PY9tS/
         blEO4OGaHEnrI15Vbs4w5iJBYQarg/KF980mtWOdGT3jtxLXjfqQABDQO25ZdQhKeIzc
         K+kNSN6OtoLqT3L+rO3NiPk4jcxP0IYUULJM8qXzubXn9W5KziqOfGBES02LdLsm8KN9
         dSUw==
In-Reply-To: <201211122202.02082.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter <netfilter@vger.kernel.org>

Not really, as I use the devices behind the firewall, in many
networks, so I need one setup that works.

But to be honest, I don't like to start this discussion:
My question is, why can netfilter not reuse the same port?
The host inside the firewall is the same, so why can't linux manage a
port mapping, which says: If a UDP packet comes from host A to us,
port 1234, AND host B, port 1234, map both to internal host Int1?
(under the assumption, that Int1 tried to establish the connection
with Host A and B first).

The point is: There is NO port mapping clash, why is netfilter
creating one? and does a port remap? (For UDP ... TCP is different.)

On Tue, Nov 13, 2012 at 2:02 PM, Neal Murphy <neal.p.murphy@alum.wpi.ed=
u> wrote:
> On Monday, November 12, 2012 09:49:49 PM J=C3=B6rn Krebs wrote:
>> Hi guys, I got the error, that my last mail hasn't been postet, so I=
 try
>> again:
>>
>> I know this might have been discussed a thousand times, but actually=
,
>> I think, not often enough.
>> First my situation:
>> I have a private network, iptables NATed of cause! then I have a
>> Xen-VoIP-Server(Asterisk) and at last a VoIP provider.
>> What I like to do is initiate VoIP calls over my VoIP Server and sen=
d
>> the data (RTP audio stream) directly to my provider. The would work
>> pretty good if ther wasn't my iptables NAT.
>
> One possibility is to run siproxd on your firewall (provided your VoI=
P system
> can use a proxy). This should resolve nearly all VoIP problems relate=
d to a
> NATting firewall.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Bye Bye, J=C3=B6rn Krebs
--------------------------------------------
64 Queen St., Blackstone 4304
Phone: +61731363381
Mobile: +61431068955
Telefon: +495516345347
