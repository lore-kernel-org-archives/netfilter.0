From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Synflood filtering and Conntrack
Date: Thu, 29 Jul 2010 15:16:55 +0200
Message-ID: <4C517F47.9030805@plouf.fr.eu.org>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr> <4C5161E2.8020407@chello.at> <alpine.LSU.2.01.1007291315440.2646@obet.zrqbmnf.qr> <4C516687.6060602@chello.at> <4C517559.2030702@plouf.fr.eu.org> <alpine.LSU.2.01.1007291448450.15281@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1007291448450.15281@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org, "Dennis J." <dennisml@conversis.de>, pablo@netfilter.org

Jan Engelhardt a =E9crit :
> On Thursday 2010-07-29 14:34, Pascal Hambourg wrote:
>>>> Trying 127.0.0.1...
>>>>      [NEW] tcp      6 120 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1
>>>> sport=3D59734 dport=3D23 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0=
=2E1 sport=3D23
>>>> dport=3D59734
>>>>
>>>> ...seconds later...
>>>> # conntrack -L | grep =3D23
>>>> conntrack v0.9.14 (conntrack-tools): 12 flow entries have been sho=
wn.
>>>> tcp      6 97 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D597=
34
>>>> dport=3D23 packets=3D1 bytes=3D60 [UNREPLIED] src=3D127.0.0.1 dst=3D=
127.0.0.1
>>>> sport=3D23 dport=3D59734 packets=3D0 bytes=3D0 mark=3D0 secmark=3D=
0 use=3D2
>>>>
>>>> 2 minutes it is.
>>
>> That's because it is a locally generated connection, so the conntrac=
k
>> confirm takes place after POSTROUTING. Even though the packet is dro=
pped
>> in INPUT after it is looped back, the conntrack entry is already
>> confirmed. Now try again with the DROP rule in OUTPUT, or from a rem=
ote
>> host.
>=20
> But the ct entry must undoubtly exist to be able to match -m conntrac=
k=20
> --ctstate NEW. Perhaps it's just that conntrack(8) won't show it?

I don't know how things work internally [1], but from the outside it
seems to me that the conntrack entry exists only until the packet is
dropped, i.e. very briefly.

[1] I can read C, but that does not mean I can understand the thousands
of lines of the kernel source code.


