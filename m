From: Mateus Caruccio <mateus@caruccio.com>
Subject: Re: Redirect mirrored traffic to userspace app. [RESOLVED]
Date: Thu, 21 Oct 2010 15:56:50 -0200
Message-ID: <AANLkTi=s9LAzk909QAjvhQKUVrn5bC+tgK6n2cfjyvY2@mail.gmail.com>
References: <AANLkTikQLQ4J0+8-Ao5viwjQ4b4YCUDvuez3mKcf2EF7@mail.gmail.com> <alpine.LNX.2.01.1010211941210.22599@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1010211941210.22599@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thu, Oct 21, 2010 at 3:41 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
> On Thursday 2010-10-21 18:42, Mateus Caruccio wrote:
>
>>In the end, we came with a very simple solution (no iptables/ip neede=
d):
>>
>>>From DEVEL_SRV we ran:
>>
>># ifconfig eth1 PROD_SRV_IP netmask PROD_SRV_NETMASK promisc -arp hw
>>ether PROD_SRV_HWADDR up
>>
>>That is it !
>>
>>All traffic targeted to PROD_SRV_IP is now being accepted by our
>>mirrored eth1. Since this is an interface aimed to tests only, no
>>matter what's being accepted.
>
> It still looks wrong though. When using TEE, no expensive promiscous
> mode is required, nor are static ARP entries.

As I said, I do not have access/permission to run anything in our
production servers (our admins are a "little" paranoid :)
Also, since port mirror is mirroring only those specific proto:port
packets, I dont think that would cause any performance penalty.

Anyway, this is not beautiful as it could, but works for our needs.
Again, thanks for support. I will keep looking for a more
straight/clean solution.
I'm not a protocol/kernel specialist, so this is a good challenge.

Mateus.


>



--=20
# ################ VOTE NULO ################
# Mateus de Oliveira Caruccio <mateus at caruccio dot com>
# Old programmers never die.=A0 They just branch to another namespace
