From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Packet disappears after DNAT?
Date: Tue, 15 Dec 2015 20:45:09 +0100
Message-ID: <56706DC5.8010206@plouf.fr.eu.org>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>	<5662BD03.60004@plouf.fr.eu.org>	<CAKmUPx40SPPjAjQa2LyKMwQu=Qrd+Cfi1FjmQR5Oap8hQPL8Vg@mail.gmail.com>	<56653CCC.6020603@plouf.fr.eu.org> <CAKmUPx7UQD0zE4ngHanfid4BN8aMFLdJ284peiW0_d8=EFW_JQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKmUPx7UQD0zE4ngHanfid4BN8aMFLdJ284peiW0_d8=EFW_JQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Scott Bronson <bronson@rinspin.com>
Cc: netfilter <netfilter@vger.kernel.org>

Scott Bronson a =E9crit :
>=20
> iptables -t nat -I POSTROUTING -s 192.168.122.10 -d 192.168.122.10 -p
> tcp -j MASQUERADE
> iptables -t nat -I POSTROUTING -s 192.168.122.10 -d 192.168.122.10 -p
> udp -j MASQUERADE

Why restrict the MASQUERADE to TCP and UDP ?

> Gotta say, unning `echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptab=
les` in my
> script makes me a little queasy...  but this page suggests that no ot=
her option
> will work cross-distro:
>=20
>      http://wiki.libvirt.org/page/Net.bridge-nf-call_and_sysctl.conf
>=20
> I guess that's still the case?

Well, the problem is to make sure that the command is run after the
bridge module has been loaded. Maybe a way to achieve this is to use th=
e
"install" command in /etc/modprobe.conf or /etc/modprobe.d/bridge.conf
to have modprobe itself run the command after loading the module :

install bridge /sbin/modprobe --ignore-install bridge $CMDLINE_OPTS ;
echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables

(all in one line)

Of course it won't work if the module is loaded with insmod. Also, the
manpage states that this command may become deprecated.
