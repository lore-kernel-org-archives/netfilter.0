From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Synflood filtering and Conntrack
Date: Thu, 29 Jul 2010 14:34:33 +0200
Message-ID: <4C517559.2030702@plouf.fr.eu.org>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr> <4C5161E2.8020407@chello.at> <alpine.LSU.2.01.1007291315440.2646@obet.zrqbmnf.qr> <4C516687.6060602@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C516687.6060602@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>, "Dennis J." <dennisml@conversis.de>, pablo@netfilter.org

Mart Frauenlob a =E9crit :
> On 29.07.2010 13:21, Jan Engelhardt wrote:
>>
>> # iptables -I INPUT -p tcp --dport 23 -j DROP
>> # conntrack -E&   telnet localhost 23
>> [1] 6949
>> Trying ::1...
>> telnet: connect to address ::1: Connection refused
>
> refused? on DROP?
> my nc does show a timeout.

That's the IPv6 connection attempt. The Telnet server does not appear t=
o
listen on  IPv6, so the connection is refused.

>> Trying 127.0.0.1...
>>      [NEW] tcp      6 120 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1
>> sport=3D59734 dport=3D23 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0.1=
 sport=3D23
>> dport=3D59734
>>
>> ...seconds later...
>> # conntrack -L | grep =3D23
>> conntrack v0.9.14 (conntrack-tools): 12 flow entries have been shown=
=2E
>> tcp      6 97 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D59734
>> dport=3D23 packets=3D1 bytes=3D60 [UNREPLIED] src=3D127.0.0.1 dst=3D=
127.0.0.1
>> sport=3D23 dport=3D59734 packets=3D0 bytes=3D0 mark=3D0 secmark=3D0 =
use=3D2
>>
>> 2 minutes it is.

That's because it is a locally generated connection, so the conntrack
confirm takes place after POSTROUTING. Even though the packet is droppe=
d
in INPUT after it is looped back, the conntrack entry is already
confirmed. Now try again with the DROP rule in OUTPUT, or from a remote
host.

> oh, well exactly what I did.

Probably not exactly.


