From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Synflood filtering and Conntrack
Date: Wed, 28 Jul 2010 16:27:27 +0200
Message-ID: <4C503E4F.7070302@plouf.fr.eu.org>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr> <4C5030EA.90600@plouf.fr.eu.org> <alpine.LSU.2.01.1007281608440.28383@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1007281608440.28383@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "Dennis J." <dennisml@conversis.de>, netfilter@vger.kernel.org, Mart Frauenlob <mart.frauenlob@chello.at>, pablo@netfilter.org



Jan Engelhardt a =C3=A9crit :
> On Wednesday 2010-07-28 15:30, Pascal Hambourg wrote:
>>
>> Right, the DROP target has no direct effect on conntrack. When a
>> packet belonging to an already existing (confirmed) connection is
>> dropped, the conntrack entry is not destroyed. But IIUC when the
>> first packet that would create a new connection (and a new conntrack
>> entry) is dropped for any reason before it reaches the conntrack
>> confirm in the LOCAL_IN or POST_ROUTING
>> hooks (after INPUT or POSTROUTING chains), the conntrack
>> entry is destroyed, isn't it ?

> Think. -m conntrack --ctstate NEW would not work if the ct only
> sprung into existence once it is confirmed.
> The ct is created about before you enter the mangle-PREROUTING chain.

Did I wrote otherwise ?
I wrote that the new conntrack entry created by a packet is destroyed i=
f
if that packet does not reach contrack confirm, so I believe it implies
that it was created first. You can't destroy something that does not
exist, right ?

1. Packet is seen by conntrack in PRE_ROUTING/LOCAL_OUT -> create
conntrack entry.
2. Packet is seen again by conntrack in LOCAL_IN/POST_ROUTING -> confir=
m
conntrack entry, otherwise delete it.

Am I correct ?


