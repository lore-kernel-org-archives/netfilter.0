From: "otik@e-posta.sk" <otik@e-posta.sk>
Subject: Re: ebtables fix changing source MAC
Date: Sun, 05 Apr 2015 18:47:46 +0200
Message-ID: <55216732.4040200@e-posta.sk>
References: <551F9234.2040308@e-posta.sk> <551FE95F.8080005@familie-kuntze.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <551FE95F.8080005@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Noel Kuntze <noel@familie-kuntze.de>, netfilter@vger.kernel.org

On 2015-04-04 15:38, Noel Kuntze wrote:
> Hello Oto,
>
> You can use arptables to do that. ebtables can't do that.
>
> arptables -A INPUT -s StupidEthernetDeviceIP --destination-mac MyOwnM=
acAddress -j mangle --mangle-mac-s TheMACAddressIwant
>
> You can of course replace the -s StupidEthernetDeviceIP with another =
filter. However, as you are using a bridge device and probably
> a lot of other devices communicate over the virtual bridge, you shoul=
d construct a filter for a rule
> that guarantees (either by logical constraint or physical constraint =
[e.g: The only device connected to eth0 is the stupid ethernet device, =
assuming eth0 is slaved to br0])
> that only traffic from that host is mangled. Otherwise, you will not =
be able to establish a connection to any other host.

Thanks for proposed solution it seems to be good on first look. I'll=20
test it on end of the month. And let you know.
I never heard of arptables before, but all got its first time :)

As I wrote I got just one shot, so if anybody have other solution pls=20
let me know.

>
> Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
> Noel Kuntze
>
>

