From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: TAP interface and iptables forwarding/nat/masquerading
Date: Wed, 14 Jan 2015 22:56:48 +0100
Message-ID: <54B6E620.9070800@plouf.fr.eu.org>
References: <CA+HxBU+vzVOhY-iCMty=87Mo3yMnzo5Lw=x5E54D3Rud4GXSTA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+HxBU+vzVOhY-iCMty=87Mo3yMnzo5Lw=x5E54D3Rud4GXSTA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-15?Q?St=E9phane_Charette?= <stephanecharette@gmail.com>
Cc: netfilter@vger.kernel.org

St=E9phane Charette a =E9crit :
> If I bring up a device alias like this:
>=20
>> sudo ifconfig eth0:test0 10.0.1.1 netmask 255.255.255.0
>=20
> ...then use these few simple iptables rules:
>=20
>> sudo iptables --table nat --append POSTROUTING --out-interface eth0 =
\
>>     --src 10.0.1.0/24 --jump MASQUERADE
>> sudo iptables --table filter --append FORWARD --match conntrack \
>>     --ctstate NEW --src 10.0.1.0/24 ! --dst 10.0.1.0/24 --jump ACCEP=
T
>> sudo iptables --table filter --append FORWARD --match conntrack \
>>     --ctstate RELATED,ESTABLISHED --jump ACCEPT
>> sudo iptables --table filter --policy FORWARD DROP
>=20
> This gives me a working home router with nat/masquerading capability.

IIUC, this acts as a "stub" router routing between two networks on the
same interface. Correct ?

> But if instead of creating an alias with the ifconfig command, I
> instead use a TAP device opened up from some C++ code with the same
> 10.0.1.1/24 address, I don't see any traffic coming into the TAP
> interface.

How do you send trafic through the TAP interface ?

> What I eventually want is to have a user-space C++ application that
> can examine traffic, and make decisions on what traffic to drop,
> modify packets, or packets to log.  Then that C++ application sends
> the remaining packets on their way.  Is it possible to use iptables
> for this?

You may want to check the QUEUE and NFQUEUE targets.
