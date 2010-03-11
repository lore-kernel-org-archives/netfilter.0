From: "Sheepa" <sheepa@sheepa.org>
Subject: Re: Update delay when using nat table?
Date: Thu, 11 Mar 2010 17:12:31 +0100
Message-ID: <5A79052B1E9046B894B2CC5B477D90C1@main>
References: <09084388150B46A2B74F745A8E1272DA@main> <2122a8b921764fb70003e1215e6e38e0@thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	reply-type=original"
To: netfilter@vger.kernel.org

That is probably the case.
How would someone remove an entry (based on IP and port)?

Also, I plan on having around 10k rules like this, currently the packet=
s are
just dropped. Are there any better way (performance wise) of doing this=
?

Thanks,
Sheepa


----- Original Message -----=20
=46rom: "Fran=C3=A7ois Legal" <devel@thom.fr.eu.org>
To: "Sheepa" <sheepa@sheepa.org>
Sent: Thursday, March 11, 2010 3:56 PM
Subject: Re: Update delay when using nat table?


>I guess that is because there is already a conntrack entry for the pac=
kets
> that you're sending to port 777. You can confirm this by checking
> /proc/net/nf_conntrack
>
> If my guess is correct, you have to remove the entry (or even flush t=
he
> entire table) from conntrack with the "conntrack" tool.
>
> Fran=C3=A7ois
>
> On Thu, 11 Mar 2010 01:42:23 +0100, "Sheepa" <sheepa@sheepa.org> wrot=
e:
>> Hello, im trying to redirect a port based in source ip like this:
>> iptables -t nat -A PREROUTING -p udp --dport 777 -j REDIRECT --to-po=
rt
>> 888 -s x.x.x.x
>>
>> Notice that i will have services listening on both ports. Allthough =
this
>
>> works it takes several minutes for it to take effect. And it doesn't
> seem
>> to
>> take effect at all if i keep sending packages to port 777 here in th=
e
>> example. How can i make it take effect instantly? Or is thier any ot=
her
>> way
>> of doing this (redirecting a port locally) on a debian squeeze machi=
ne?
>>
>> Thanks,
>> Sheepa
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html=20
