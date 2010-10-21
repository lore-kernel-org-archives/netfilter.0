From: Mateus Caruccio <mateus@caruccio.com>
Subject: Re: Redirect mirrored traffic to userspace app. [RESOLVED]
Date: Thu, 21 Oct 2010 16:18:46 -0200
Message-ID: <AANLkTim0byDPGcDH8OzD5JZzBhGxQUwo12CzkkPDTCET@mail.gmail.com>
References: <AANLkTikQLQ4J0+8-Ao5viwjQ4b4YCUDvuez3mKcf2EF7@mail.gmail.com>
 <alpine.LNX.2.01.1010211941210.22599@obet.zrqbmnf.qr> <AANLkTi=s9LAzk909QAjvhQKUVrn5bC+tgK6n2cfjyvY2@mail.gmail.com>
 <4CC0824D.6030403@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CC0824D.6030403@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thu, Oct 21, 2010 at 4:11 PM, Grant Taylor <gtaylor@riverviewtech.ne=
t> wrote:
> On 10/21/10 12:56, Mateus Caruccio wrote:
>>
>> As I said, I do not have access/permission to run anything in our
>> production servers (our admins are a "little" paranoid :) Also, sinc=
e port
>> mirror is mirroring only those specific proto:port packets, I dont t=
hink
>> that would cause any performance penalty.
>
> (I've not used SPAN / port mirroring in a long time.) =A0Does the SPA=
N truly
> mirror select protocols (UDP) to a given port (2077)? =A0Or does SPAN=
 mirror
> all traffic to the switch port?

Is, it does mirror based on proto/port.
In fact it's mirroring only inbound traffic! Amazing, huh?
I do not known what equipment it is, but seems to be very robust.

>
> *chuckle*
>
> I've been on both sides of the paranoia. =A0Usually it's warranted fo=
r
> security / stability. =A0(Usually)
>
>> Anyway, this is not beautiful as it could, but works for our needs. =
Again,
>> thanks for support. I will keep looking for a more straight/clean so=
lution.
>
> Honestly, I don't think this solution is that unclean, at least from =
a host
> point of view. =A0The only dirty part of this I see is the fact that =
you have
> an IP / MAC duplication on the network. =A0However, said duplication =
is
> isolated by a SPAN configuration in a switch. =A0So, it's not really =
bad, just
> something to be mindful of.
>
> I don't know how temporary your dev server is, but I've had 5+ year o=
ld temp
> installs break when the prod server was replaced, thus changing the M=
AC
> address. =A0Just something else to be mindful of.

That's not a problem now. Our tests will last for 3-6 days only.


Mateus.

>
>> I'm not a protocol/kernel specialist, so this is a good challenge.
>
> Challenges can be fun and frustrating.
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
