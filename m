From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Redirect mirrored traffic to userspace app.
Date: Thu, 21 Oct 2010 00:21:05 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010210017290.19350@obet.zrqbmnf.qr>
References: <AANLkTikKCEBEv61415CCoM8uBzd1jL6+TDF7Gswh5+Ys@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikKCEBEv61415CCoM8uBzd1jL6+TDF7Gswh5+Ys@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mateus Caruccio <mateus@caruccio.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2010-10-20 23:58, Mateus Caruccio wrote:
>
>Our DEVEL_SRV should receive exactly the same packet PROD_SRV
>receives, but with destination address modified
>so it can reach our userspace application.
>I've tried to "DNAT" it, but without success:

Because DNAT is factually wrong, as it does not make a copy. Instead,
use -j TEE on the host where the copy is to be made, and use either a
packet socket (tcpdump uses such) or local delivery routing (`ip route
add local dstaddrinpacket` and so).

>tcpdump shows that all requests are being properly mirrored from PORT2 to PORT3.
>ifconfig eth0 on DEVEL_SRV does not present any increment on RX
>statistics, but if I "ifconfig eth0 promisc", it starts to increment
>RX.

Forget about ifconfig. People should use modern tools like ip.
