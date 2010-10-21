From: Mateus Caruccio <mateus@caruccio.com>
Subject: Re: Redirect mirrored traffic to userspace app.
Date: Wed, 20 Oct 2010 23:57:54 -0200
Message-ID: <AANLkTin=WwAwPWjLq_nY7AZqr3hgkDSciEQEWZBwfJym@mail.gmail.com>
References: <AANLkTikKCEBEv61415CCoM8uBzd1jL6+TDF7Gswh5+Ys@mail.gmail.com> <alpine.LNX.2.01.1010210017290.19350@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1010210017290.19350@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Unfortunately I'm not able to run any command on production servers :(
All I could get was a physical port mirror, using an ethernet cable in
the switch.

Since I do have a copy of the packet on my own box, why can't I change
it, inside my own box, to match my own IP addr and route it to my own
userspace app (no matter interface)?
=46or me this should be simple:

1 - a pkt reached my interface with prod-server-dst-addr;
2 - before it get routed, rewrite its dst-addr to my interface's addr;
3 - let the kernel delivery it to my interface's local addr:port.

thanx.

On Wed, Oct 20, 2010 at 8:21 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>
> On Wednesday 2010-10-20 23:58, Mateus Caruccio wrote:
>>
>>Our DEVEL_SRV should receive exactly the same packet PROD_SRV
>>receives, but with destination address modified
>>so it can reach our userspace application.
>>I've tried to "DNAT" it, but without success:
>
> Because DNAT is factually wrong, as it does not make a copy. Instead,
> use -j TEE on the host where the copy is to be made, and use either a
> packet socket (tcpdump uses such) or local delivery routing (`ip rout=
e
> add local dstaddrinpacket` and so).
>
>>tcpdump shows that all requests are being properly mirrored from PORT=
2 to PORT3.
>>ifconfig eth0 on DEVEL_SRV does not present any increment on RX
>>statistics, but if I "ifconfig eth0 promisc", it starts to increment
>>RX.
>
> Forget about ifconfig. People should use modern tools like ip.
>



--=20
# ################ VOTE NULO ################
# Mateus de Oliveira Caruccio <mateus at caruccio dot com>
# Old programmers never die.=A0 They just branch to another namespace
