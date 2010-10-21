From: Mateus Caruccio <mateus@caruccio.com>
Subject: Re: Redirect mirrored traffic to userspace app. [RESOLVED]
Date: Thu, 21 Oct 2010 15:46:08 -0200
Message-ID: <AANLkTinz=hfiCpJBkL23PR6ikhjSMaEEr19ABYx1Uq7=@mail.gmail.com>
References: <AANLkTikQLQ4J0+8-Ao5viwjQ4b4YCUDvuez3mKcf2EF7@mail.gmail.com> <4CC0793F.9020703@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CC0793F.9020703@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thu, Oct 21, 2010 at 3:32 PM, Grant Taylor <gtaylor@riverviewtech.ne=
t> wrote:
> On 10/21/10 11:42, Mateus Caruccio wrote:
>>
>> In the end, we came with a very simple solution (no iptables/ip need=
ed):
>>
>> =A0 # ifconfig eth1 PROD_SRV_IP netmask PROD_SRV_NETMASK promisc -ar=
p hw
>> ether PROD_SRV_HWADDR up
>
> That looks like you bound it to eth1 when you were talking about eth0
> before.
>
> Are you using eth0 at all? =A0Or does the box have two nics (0 & 1) i=
n the
> same subnet?
>

Sorry for that :P

In fact eth0 is attached to port mirror, while eth1 is being used to
management (this is the network we use for everyday work).
So, where you read "ifconfig eth1..." it is actually "ifconfig eth0..."=
=2E

>> That is it !
>
> Simple solutions are nice.

Agree. Less is more.

>
>> All traffic targeted to PROD_SRV_IP is now being accepted by our mir=
rored
>> eth1. Since this is an interface aimed to tests only, no matter what=
's being
>> accepted.
>
> Ok.
>
> Are you accessing (for management) the dev server across the network =
at all?

Yes, through eth1.

> =A0Or is everything done on console?
>
>> Thanks Jan and Grant for your suggestions and explanations. That wor=
ths a
>> lot!
>
> You are welcome. =A0I'm glad that you got things working, especially =
as simple
> as you did.
>
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
# ################ VOTE NULO ################
# Mateus de Oliveira Caruccio <mateus at caruccio dot com>
# Old programmers never die.=A0 They just branch to another namespace
