From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Order of iptables vs. ip6tables chains
Date: Fri, 23 Jan 2015 23:38:54 +0100
Message-ID: <54C2CD7E.8070702@familie-kuntze.de>
References: <20150123223116.GA3522@blackhole.tracing.lan> <54C2CD64.5000104@familie-kuntze.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54C2CD64.5000104@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Thomas Preissler <thomas@preissler.co.uk>, netfilter@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

=46orgot the picture: http://inai.de/images/nf-packet-flow.png

Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

Am 23.01.2015 um 23:38 schrieb Noel Kuntze:
>
> Hello Thomas,
>
> Inside chains it's top to bottom.
> This [1] picture shows where the chains are used.
> Also, IPv4 traffic is only handled by iptables rules and IPv6 traffic
> obviously only by ip6tables rules. iptables only handles ip traffic, =
not decnet or any
> other fancy layer three protocol.
>
> Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
> Noel Kuntze
>
> GPG Key ID: 0x63EC6658
> Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658
>
> Am 23.01.2015 um 23:31 schrieb Thomas Preissler:
> > Hello folks,
>
> > I am wondering in which order are iptables/ip6tables rules executed=
?
> > So for example I have the same rules on v4 and v6 on INPUT and FORW=
ARD
> > matching MAC addresses, interestingly only ipv4's counters are <> 0=
=2E
> > (I know about ebtables.)
>
> > So I guess the order is v4 INPUT then v6, after that v4 FORWARD the=
n v6
> > - for example?
>
> > And yes, I can't wait for nftables to go live...
>
>
> > Kind Regards
>
> > Thomas
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUws1+AAoJEDg5KY9j7GZYOsIP/3fIcaWFt6b012if7G+Cg+4l
ThqvCSMCAkFsReMixIHCLGRMlU0P2l+vG86CzL2aFyN6WzHt79K3c8Wf6qJxTExw
N/3vbEAw89xKIMhEZQmjRQn8DlPnU52BqGp6vCoB+JLWqZjk3y6W/81ICoRfxX8Z
Brhc1HiYokcp9wByOIWm3E9EiJ/GtJ9H0wchYit3MFDp8nG67qjLnSuMGILZczZB
9Hzx1ASlGBAw0QtPyR4xTZlTNu1nA2NBgi+5dRGNXmv+u5a7aT0CJEkP6FRS36yj
o0YmFgbqpb68KhIPMA1YfalDq5hkL19+tfD3Iz1o9yH7rive9V/UfOZv+sO+2Ya4
ZFVaR+irsC5xBjkt6HP9aA1XLNvTRiVivM+j97w968sp8tW37dlgr30irSMjh/HJ
MknbaYE1MSEr0f9rigfwgdR/VVeAIXhhUZC6Bq7eE6QMaMvzMonuYEUKR2DfHmkV
JW25DN5HS0hHr5+izX9AYoEDIbJxNMCGIPwdC4Cujg9A/rcqcWMFGdXgUcl4NxaX
4EFQvy0dJqf+ruKNGX5TZDyyHqzH4Lm0IfQ6KdWSc2Hqo15wjx4yfa18Kzs6+voo
4wlRI/SiNympJi+zkiiSQsiaASdtxu01Ip0BTd8ryjR6Zot7j/k7y5THX1QVaqMh
+yd5iy8PaxGm3sBigjpS
=3DKEVI
-----END PGP SIGNATURE-----

