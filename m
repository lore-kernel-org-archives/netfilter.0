From: =?iso-8859-1?q?Albrecht_Dre=DF?= <albrecht.dress@arcor.de>
Subject: Re: Help: iptables NAT broken with pppoe
Date: Sat, 07 May 2005 20:00:04 +0000
Message-ID: <1115496014l.3549l.0l@antares.localdomain>
References: <1115397393l.3864l.0l@antares.localdomain>
	<427C5C41.3010407@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427C5C41.3010407@riverviewtech.net> (from
	gtaylor@riverviewtech.net on Sat May  7 08:12:17 2005)
Content-Disposition: inline
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
Content-Type: text/plain; charset="macroman"; delsp="Yes"; format="Flowed"
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi!

Fist, thanks a lot for your reply!

Am 07.05.05 08:12 schrieb(en) Taylor, Grant:
> I'm not sure why it's happening but your PMac G4 system is sending reset =
=20
> packets in response to the responses from the server.

Ouch! That's indeed very strange. I can only repeat that it *did* work =20
using isdn, so apparently there is some pppoe related porblem?

> Have you tried  using an SNAT rule temporarily on your POSTROUTING chain =
=20
> to see if the problem is with the MASQUERADE rule?

Same effect - replaced the masquerade rule by

ppp0ip=3D84.44.130.37
iptables -t nat -A POSTROUTING -s 192.168.42.0/24 -o ppp0 -j SNAT \
- --to-source $ppp0ip

but tcpdump still reports

21:50:33.986790 IP 84.44.130.37.49224 > 213.95.27.115.80: S =20
3806917882:3806917882(0) win 65535 <mss 1452,nop,wscale =20
0,nop,nop,timestamp 380633236 0>
21:50:34.047457 IP 213.95.27.115.80 > 84.44.130.37.49224: S =20
118817856:118817856(0) ack 3806917883 win 5792 <mss 1460,nop,nop,timestamp =
=20
1571974157 380633236,nop,wscale 2>
21:50:34.047558 IP 84.44.130.37.49224 > 213.95.27.115.80: R =20
3806917883:3806917883(0) win 0

The modules ipt_MASQUERADE and iptable_nat *are* loaded, btw.

> Also, what is your "echo 2 > /proc/sys/net/ipv4/ip_dynaddr" doing for =20
> you?

I don't see any messages in /var/log messages or in dmesg, if you mean =20
that. Or did I miss your point here? I found some howto where they stated =20
this would be necessary...

> You might want to check to make sure that reverse path filtering
> is not turned on by default.  You might also want to turn on verbose =20
> routing messages to see if there is any thing useful being reported.

Hmmm, can you tell me how I actually check reverse path filtering and turn =
=20
debugging on? Sorry, I'm neither a iptables nor a kernel guru :-/

Thanks a lot for your help,

cheers, Albrecht.

- --=20
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Albrecht Dre=DF  -  Johanna-Kirchner-Stra=DFe 13  -  D-53123 Bonn (German=
y)
        Phone (+49) 228 6199571  -  mailto:albrecht.dress@arcor.de
    GnuPG public key:  http://home.arcor.de/dralbrecht.dress/pubkey.asc
_________________________________________________________________________
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCfR5On/9unNAn/9ERAq1EAJ9LcwjnujvlQRKzne9m8Q64bYY1VQCdHxNk
Ddfy9kIaOz/9IssqpR74iK4=3D
=3DENLW
-----END PGP SIGNATURE-----



