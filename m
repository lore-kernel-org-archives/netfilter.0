From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: conntrack-tools 0.9.14 can not block the connection
Date: Mon, 10 May 2010 13:11:00 +0200
Message-ID: <4BE7E9C4.5050800@plouf.fr.eu.org>
References: <201005061651.40203.rfeng@wurldtech.com> <alpine.LSU.2.01.1005070954230.32277@obet.zrqbmnf.qr> <201005070917.27301.rfeng@wurldtech.com> <alpine.LSU.2.01.1005071823100.23210@obet.zrqbmnf.qr> <4BE46649.1040703@netfilter.org> <4BE4669B.4030904@netfilter.org> <alpine.LSU.2.01.1005072144530.31492@obet.zrqbmnf.qr> <4BE4747D.9010705@plouf.fr.eu.org> <alpine.DEB.2.00.1005082227270.30449@blackhole.kfki.hu> <alpine.LSU.2.01.1005082237100.3357@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1005082237100.3357@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Jan Engelhardt a =E9crit :
> On Saturday 2010-05-08 22:33, Jozsef Kadlecsik wrote:
>>
>> With tcp_loose enabled (default) conntrack accepts non-SYN packets a=
s=20
>> "NEW" ones, i.e. attempts to pick up connections from the middle.
>>
>> With tcp_be_liberal enabled (default is disabled) out of window pack=
ets=20
>> are not marked as INVALID.
>=20
> And for grand completeness on the reader's behalf: an out-of-window=20
> packet can not occur if there is no previous ct entry (for the same=20
> tcp connection) whose window values could be compared to to see if=20
> there is an out-of-window condition.

Thanks to both of you for clarifying.
