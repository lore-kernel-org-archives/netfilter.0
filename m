From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: limit speed of file transfer
Date: 22 Jan 2005 21:22:56 +0100
Message-ID: <1106398395.20087.1.camel@nostromo.bgsecm.com>
References: <001001c5001e$d80df760$0201a8c0@micah>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001001c5001e$d80df760$0201a8c0@micah>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El s=C3=A1b, 22 de 01 de 2005 a las 02:08, Micah Wedemeyer escribi=C3=B3:
> Hi,
>=20
> My system consistently locks up on file transfers across the LAN.  When
> transferring a file to it using scp, it dies after less than 5 seconds.
> However, if I use it to download a file from the Internet (using wget),
> it does just fine.
>=20
> I have heard that my motherboard (a Via Epia MII) has DMA problems and
> that high Ethernet traffic is known to lock them up.  My theory is that
> the Internet connection is slow enough to not hit whatever magic
> threshold causes the crash.  So, I was hoping to find a way to limit th=
e
> speed of transfers with scp and ftp so that they also don't lock up the
> machine.
>=20
> I asked on a few message boards, and they all mentioned iptables.  I've
> never used it before, and am a total noob when it comes to networking
> stuff.  So, I was hoping that the people on this list could point me in
> the right direction of where to start.
>=20
> To sum up:  I need a way to limit the speed of incoming file transfers
> using ftp or scp.
>=20
> Any help would be greatly appreciated,
> Micah

Maybe iproute2 can help you. It does QoS and can limit the rate
of a connection. You can find more information on the LARTC HOWTO
at the site: http://lartc.org

Regards.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


