From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: ebtables fix changing source MAC
Date: Sat, 04 Apr 2015 15:38:39 +0200
Message-ID: <551FE95F.8080005@familie-kuntze.de>
References: <551F9234.2040308@e-posta.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <551F9234.2040308@e-posta.sk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "otik@e-posta.sk" <otik@e-posta.sk>, netfilter@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello Oto,

You can use arptables to do that. ebtables can't do that.

arptables -A INPUT -s StupidEthernetDeviceIP --destination-mac MyOwnMac=
Address -j mangle --mangle-mac-s TheMACAddressIwant

You can of course replace the -s StupidEthernetDeviceIP with another fi=
lter. However, as you are using a bridge device and probably
a lot of other devices communicate over the virtual bridge, you should =
construct a filter for a rule
that guarantees (either by logical constraint or physical constraint [e=
=2Eg: The only device connected to eth0 is the stupid ethernet device, =
assuming eth0 is slaved to br0])
that only traffic from that host is mangled. Otherwise, you will not be=
 able to establish a connection to any other host.

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

Am 04.04.2015 um 09:26 schrieb otik@e-posta.sk:
> Hi all,
>
> I need to connect LINUX to ethernet device. Everything would work exc=
ept that device after SYN packet starts to send packet with changing/ra=
ndom/mascilious MAC. It seems linux would drop such(mac and IP not matc=
h records) packet. This is expected to reduce Inject/Man-On-Side attack=
=2E
>
> Device computer is too expensive to be replaced. Also original box ca=
n comunicate with it with no problem making change with no point. Origi=
nal solution runs on Windows which seems to be more permissive on this =
issue. I can confirm this. I ran simple SW to resend stream on Windows =
and all communications was ok. However i can not use this solution in p=
roduction.
>
> The things are even more complicated as my Linux box is located 12 ho=
ur fly and another 4 driving, with no internet access. I got last shot =
to try it, so I'm waiting even your brain storm ideas.
>
> My basic idea was to have ebtables SNAT rule, but I need it to run be=
fore routing decision to work. As I understand SNAT works on postroutin=
g - too late. Im running bridge on my box to remove need have external =
switch.
>
> Oto
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVH+laAAoJEDg5KY9j7GZYWsUQAImanjlFoTA17WHSpyoFfDJk
eSMv2hatWODkrUjG4y+nabJKcgEIP+Hg+WgaOVcWjdGPlJ65EWnrr/Q6j5GcYY7l
x9zR/9YsysiNaDQbGBh9r6+rvKot/F8Putm6/dzL1GwX5jBrCLjhGQX2qi8VKyRP
3xqYwXEZ/iple24r729V9X+W1LHTqMHCvx+X3XpSeE5srddTA7eSWxMRNGdNJ7ib
YLn3cOEyYRfP5qtHJNzvjjzf2wPvFAWGdVTw9fqOGM2Asb/C21K3mkPT9nLUGbIx
VvaFI7t6uo0NQCUShhS+SbHGNrUfFD2EJfhkweMLd0CB2SomUDB1V66TRwtIJZgx
NQ+/HVdlL8fs93j634VScYITtBiRLXgF4p/n/nTDisbDltbtT7Hd+AuHwhTUJwds
VUy23PsG2zQUeNQiN6mkmsgF/uG5lGyPygFdprkm5bv7QbTtdCAep8ZUY1KqwdTT
BHWRYVUHi9YiSy8SifVfej0BrljGFF9QNu7t9IVEso5HCmI/h99qbowfbPtZwN57
/v8vpKtP/+bAOFnpjVPTTC0oPY/+LCUYeTzy4+B3FHuZkXHb4vZxkQBpVPonSs0B
NeGkoyXVj8+Els98Fv+oI4dVMnFrDAHWqrJR+3uejD01OrY7Q0fa5MU5ZbW2cJQa
gRQo3WBaC5XKU5zyNM0S
=3DNtuh
-----END PGP SIGNATURE-----


