From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Why isn't DNAT happening for host-originated packets?
Date: Fri, 4 Dec 2015 00:57:07 +0100
Message-ID: <5660D6D3.8040205@familie-kuntze.de>
References: <CAKmUPx5kE+v03OGAjF32rOGyVQfOLbSmyTEOOK9uApANeWbU1A@mail.gmail.com>
 <5660CCD1.60807@familie-kuntze.de>
 <CAKmUPx44yvsz21jRE9BoxK0D4R+gGjJdk9De5QQHUBzj6o9r6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKmUPx44yvsz21jRE9BoxK0D4R+gGjJdk9De5QQHUBzj6o9r6Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Scott Bronson <bronson@rinspin.com>
Cc: netfilter@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

No.
Packets from the host never pass through PREROUTING anything. How could=
 they?
They originate in the middle top of the graph. They only go right, they=
 never go
left, where the PREROUTING chains are.
- --=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWYNbQAAoJEDg5KY9j7GZYAAYQAI38bZ1eiSjGnsUsjYWeyvCi
i3DqZQcuzCBJgnYBCXH+fo0xsebaqiwkHVFHjqOo6esbCW8Bx5sF/yrae+QMxMjM
9jy35mi77EJx3d9FCBut/uTLR6ERnfN8ahdfMrphlizKcfry+a5dfYVMhSYm0DDb
uLe2sXikSVoeflCMS+mM9OTEewy+BNpkEibnbbFGtt/N1jQe0VB2nYL69HBbakz3
9wQyWxM9d5ZzrKXA6b1GTxodbftRF9acGQSJgf8KQT8XzBZMAKxSJBVdKDex2kbj
IzpRB8ZX47psGYRm8FpOeHENp2tRFPIn761Wmk3PwsGNS1i2MOWcHtTNisDb8ECE
aI88HiQDJu2dl6q29Ql4DYwm3ZJGdEmzG8dIUs5H8DFHfBC/J0XWcjdJUlYSxK1g
JYQppaaOoMF8O5xnmVJRor4j3E2tqDoSDT0fyfJjI4a4+TggvnYFaIWvsLyyQlaO
WB383b5gtlHevHHY2ULtyx9zj6LAtQyAQv3b90NLBbTJEKHOvoznojVd4nmySnbB
k61jvN0CgvedsD/iIViahSVcqP33LVcWabHUH927ffjnfQSE22z4P628kUfdpPuu
Yn8ur1ThQVjnv51sD4+eneInKPLin0wT0PEjjmhzD5nTHGvwXxWAb0IBfZIQTE4f
4aXU6styceOAm4yKpXa8
=3DubDY
-----END PGP SIGNATURE-----

