From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Synflood filtering and Conntrack
Date: Wed, 28 Jul 2010 15:30:18 +0200
Message-ID: <4C5030EA.90600@plouf.fr.eu.org>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "Dennis J." <dennisml@conversis.de>, netfilter@vger.kernel.org, Mart Frauenlob <mart.frauenlob@chello.at>, pablo@netfilter.org

Hello,

Jan Engelhardt a =C3=A9crit :
> On Wednesday 2010-07-28 07:24, Mart Frauenlob wrote:
>>=20
>> afaik, the (according) ct entries are destroyed on DROP.
>=20
> They are not destroyed on DROP, and you can easily check that.

Right, the DROP target has no direct effect on conntrack. When a packet
belonging to an already existing (confirmed) connection is dropped, the
conntrack entry is not destroyed. But IIUC when the first packet that
would create a new connection (and a new conntrack entry) is dropped fo=
r
any reason before it reaches the conntrack confirm in the LOCAL_IN or
POST_ROUTING hooks (after INPUT or POSTROUTING chains), the conntrack
entry is destroyed, isn't it ? I guess that is what Mart meant.


