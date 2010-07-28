From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Synflood filtering and Conntrack
Date: Wed, 28 Jul 2010 16:10:29 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007281608440.28383@obet.zrqbmnf.qr>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr> <4C5030EA.90600@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C5030EA.90600@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: "Dennis J." <dennisml@conversis.de>, netfilter@vger.kernel.org, Mart Frauenlob <mart.frauenlob@chello.at>, pablo@netfilter.org


On Wednesday 2010-07-28 15:30, Pascal Hambourg wrote:
>Jan Engelhardt a =C3=A9crit :
>> On Wednesday 2010-07-28 07:24, Mart Frauenlob wrote:
>>>=20
>>> afaik, the (according) ct entries are destroyed on DROP.
>>=20
>> They are not destroyed on DROP, and you can easily check that.
>
>Right, the DROP target has no direct effect on conntrack. When a
>packet belonging to an already existing (confirmed) connection is
>dropped, the conntrack entry is not destroyed. But IIUC when the
>first packet that would create a new connection (and a new conntrack
>entry) is dropped for any reason before it reaches the conntrack
>confirm

Think. -m conntrack --ctstate NEW would not work if the ct only
sprung into existence once it is confirmed.
The ct is created about before you enter the mangle-PREROUTING chain.
