From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: redundancy with Adsl modem
Date: Wed, 4 Jan 2012 18:15:12 -0200
Message-ID: <CAMTjHrw4Rrb7c4h5Sv2jRctiUcqWD8O-xZx54M9Dp5jc8qZYdQ@mail.gmail.com>
References: <CAMTjHrw92RRMe4Y2cGfVsS6eBrvL-=1pYCueOC7vOW=RT_-=7g@mail.gmail.com>
	<1325574854.2270.130.camel@andybev-desktop>
	<CAMTjHrxMUCb1b4tKeQon9QuJCxp3YunwJ7BiPfBtCokGFLYkWg@mail.gmail.com>
	<op.v7jefiizx1lyi3@debiandesk2.net>
	<4F041738.9090908@freemail.hu>
	<op.v7kb75oyx1lyi3@debiandesk2.net>
	<4F0493D5.3040001@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F0493D5.3040001@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?B?R+FzcOFyIExham9z?= <swifty@freemail.hu>
Cc: Lloyd Standish <lloyd@crnatural.net>, Andrew Beverley <andy@andybev.com>, Mail List - Netfilter <netfilter@vger.kernel.org>

good your tips G=E1sp=E1r,


I would ask myself: Do I really need redundancy or do I need alternativ=
ity?

 yes, I need redundancy. when an line adsl come down all traffic go to
other line adsl. I couldn't have done this on linux machine. if you
has any how to about please post here.


thanks.










Em 4 de janeiro de 2012 16:00, G=E1sp=E1r Lajos <swifty@freemail.hu> es=
creveu:
> Hi Lloyd,
>
> Thank you for your comment ! :D
> I have never used this monitor, but I am going to try it... :D
>
> 2012-01-04 15:08 keltez=E9ssel, Lloyd Standish =EDrta:
>
>> I'm sure your iface match is very useful in many circumstances. =A0H=
owever I
>> would like to point out that link status monitor (http://lsm.foobar.=
fi/)
>> actually evaluates the link quality by pinging an IP (perhaps severa=
l hops
>> past the gateway IP), keeping track of the number of lost and late-a=
rriving
>> packets over the last 60 seconds. =A0If the number of late or droppe=
d packets
>> exceeds a certain (configurable) number, then the link is reported a=
s
>> "down". =A0The main advantage to this (and the fact that it happens =
outside of
>> netfilter) is that the firewall can be automatically reconfigured to=
 exclude
>> the failed link from routing. =A0When the link quality is seen to ha=
ve
>> improved, the failed link can be included again in the routing decis=
ion.
>
>
> I think that both of these approaches has pros and cons.
>
> Maybe you also know that (in Linux) the kernel chooses the output int=
erface
> depending on the routing table and not the source IP...
> So if the ping is not bound to a specific interface then it is "usele=
ss"...
> (There is an oping utility that can be set up to use a specific inter=
face.)
> I do not know LSM but I hope that it is also aware of this.
>
> Besides this, pinging is not always accurate and may lead the applica=
tion
> think that link quality is dropping down...
> Just imagine that the pinged host(s) can be under a DOS attack and th=
e reply
> times can go high...
> (Not to mention that the pinging generates traffic and that requires
> resources. Probably not too much resources at all :D)
>
> Other question is that how often/rarely do you ping? If often then it=
 is too
> much traffic. If rarely then do you REALLY KNOW that the interface wa=
s all
> the time up?
>
> To repeat myself: I do not know LSM :D
>
> It seems to me that LSM is some kind of line quality checking softwar=
e...
>
> OTOH my match checks the interface state when the packet is in the qu=
eue...
> With that info you can mark the packets and let the kernel decide abo=
ut the
> routing depending on the mark..
>
> But my match does not know anything about the "quality" of the connec=
tion
> just about the state of the interface...
>
> Returning to the main question:
> If an interface goes down then the associated connections will most l=
ikely
> break down...
> Without knowing the required "high-availability" services, for exampl=
e you
> can use "fallback_relay" in postfix; multiple remote lines in openvpn=
, etc.
> etc. etc.
> So maybe the redundancy is not the right word for the main requiremen=
t...
> I would ask myself: Do I really need redundancy or do I need alternat=
ivity?
>
>
> Swifty
