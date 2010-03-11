From: "Sheepa" <sheepa@sheepa.org>
Subject: Re: Update delay when using nat table?
Date: Thu, 11 Mar 2010 19:39:24 +0100
Message-ID: <67C8429999B648F983EB141D7A928400@main>
References: <09084388150B46A2B74F745A8E1272DA@main> <2122a8b921764fb70003e1215e6e38e0@thom.fr.eu.org> <383286BAD7464B6296AB3157C21B3C99@main> <967e5777d730e5c39389a4e554144099@thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	reply-type=original"
To: netfilter@vger.kernel.org

ipset looks intresting but I've no experience of patching the kernel. I=
 did=20
run an aptitude install ipset.

ipset -H
I'm of protocol version 2.
Kernel module is not loaded in, cannot verify kernel version.
ipset v2.5.0
=2E..

What needs to be done here? I've tried googling around but there's not =
that=20
much information available.

Thanks,
Sheepa

----- Original Message -----=20
=46rom: "Fran=C3=A7ois Legal" <devel@thom.fr.eu.org>
To: "Sheepa" <sheepa@sheepa.org>
Sent: Thursday, March 11, 2010 5:40 PM
Subject: Re: Update delay when using nat table?


> So to remove the conntrack entries, you can use the conntrack command=
 (it
> is available in some debian package) that uses (I'm not sure) the net=
link
> interface to netfilter (so you must have that enabled in your kernel)=
=2E
>
> For the 10k entries (I guess it's about different -s X.X.X.X entries)=
, you
> may use ipset.
>
> Fran=C3=A7ois
>
> PS: please post back to the list when you have something working to s=
hare
> with other.
>
> On Thu, 11 Mar 2010 17:11:10 +0100, "Sheepa" <sheepa@sheepa.org> wrot=
e:
>> That is probably the case.
>> How would someone remove an entry (based on IP and port)?
>>
>> Also, I plan on having around 10k rules like this, currently the pac=
kets
>> are
>> just dropped. Are there any better way (performance wise) of doing t=
his?
>>
>> Thanks,
>> Sheepa
>>
>> ----- Original Message -----=20
>> From: "Fran=C3=A7ois Legal" <devel@thom.fr.eu.org>
>> To: "Sheepa" <sheepa@sheepa.org>
>> Sent: Thursday, March 11, 2010 3:56 PM
>> Subject: Re: Update delay when using nat table?
>>
>>
>>>I guess that is because there is already a conntrack entry for the
> packets
>>> that you're sending to port 777. You can confirm this by checking
>>> /proc/net/nf_conntrack
>>>
>>> If my guess is correct, you have to remove the entry (or even flush=
 the
>>> entire table) from conntrack with the "conntrack" tool.
>>>
>>> Fran=C3=A7ois
>>>
>>> On Thu, 11 Mar 2010 01:42:23 +0100, "Sheepa" <sheepa@sheepa.org> wr=
ote:
>>>> Hello, im trying to redirect a port based in source ip like this:
>>>> iptables -t nat -A PREROUTING -p udp --dport 777 -j REDIRECT --to-=
port
>>>> 888 -s x.x.x.x
>>>>
>>>> Notice that i will have services listening on both ports. Allthoug=
h
> this
>>>
>>>> works it takes several minutes for it to take effect. And it doesn=
't
>>> seem
>>>> to
>>>> take effect at all if i keep sending packages to port 777 here in =
the
>>>> example. How can i make it take effect instantly? Or is thier any
> other
>>>> way
>>>> of doing this (redirecting a port locally) on a debian squeeze
> machine?
>>>>
>>>> Thanks,
>>>> Sheepa
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe netfilte=
r"
> in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html=
=20
