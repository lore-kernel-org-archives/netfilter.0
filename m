From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: a single rule that mach source ip or destination ip
Date: Sun, 05 Sep 2010 19:17:11 +1000
Message-ID: <4C836017.8020409@standarduniversal.com.au>
References: <AANLkTimXBDQhkkC4UxS5N3semU6V9v46vNfqpPC2cTTZ@mail.gmail.com> <alpine.LNX.2.01.1009051110090.29132@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1009051110090.29132@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

  I think..

a | b =3D=3D !a & !b

or was it

a | b =3D=3D !(a&b)



On 5/09/2010 7:10 PM, Jan Engelhardt wrote:
> On Sunday 2010-09-05 08:13, Mamadou Tour=C3=A9 wrote:
>
>> Hi,
>> all is it possible to write a single rule that match source IP or
>> destination IP.
> It is possible.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

