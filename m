From: Stuart Shelton <srcshelton@gmail.com>
Subject: Re: ebtables: ebtables-restore segfaults when 'among' list has many items
Date: Thu, 12 Mar 2015 00:11:02 +0000
Message-ID: <ED3912FE-6C60-4638-B38D-B68D600C7317@gmail.com>
References: <2B1BE39E-516E-4C80-8137-553E21E5803C@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=content-type:mime-version:subject:from:in-reply-to:date
         :content-transfer-encoding:message-id:references:to;
        bh=gPF+4zqSseybidzXUGy9XO1D9nxErX3y6odEUd5Y+8g=;
        b=hE8bfNk4EyXVqU4w0I5HGNGtlCry54NMDdwrgoq0n1tvRhpcPoptjUWvv+xvfH3Xf6
         aT3OIRt1X26mgOvQsTO5VAKTzNZJYy3JPOl4S+axI9lOvyLBkDS48muoxzzewo6F4nt8
         RThHZpx1nEwqyqPJL8ahRgl4Ah9B0hvA50Zez4WTpP51/xtEXW78Z7fZmZ0xpeYdeI0+
         9VgNTeWTStaphQlSjz55jSXrnEruwOmk0NQ3evhEBIVfBqfNihRrkfc2VuQIAX9vy66+
         HUvw2NAt1LGh4GnZP2Fgf2xMs+tfv1xoTuuTFN0kYlcoSeP0BDl8Sl05TilKGnqp2NB/
         Rs3w==
In-Reply-To: <2B1BE39E-516E-4C80-8137-553E21E5803C@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org


Right - I think I=E2=80=99ve fixed all of these=E2=80=A6

Allow newline-separated =E2=80=98among' files, and fix trailing comma:
https://raw.githubusercontent.com/srcshelton/gentoo-ebuilds/master/net-=
firewall/ebtables/files/ebtables-2.0.10.4-ebt_among.c.patch

=46ix missing whitespace (as expected by ebtables-save) for custom chai=
ns:
https://raw.githubusercontent.com/srcshelton/gentoo-ebuilds/master/net-=
firewall/ebtables/files/ebtables-2.0.10.4-ebt_standard.c.patch

=E2=80=A6 and the 2k crash (for that is what it is) can be fixed by pas=
sing 'EBTD_ARGC_MAX=3D2048 EBTD_CMDLINE_MAXLN=3D131072=E2=80=99 as argu=
ments to make when building.  Not nice, but it does the job.

Hopefully this will be of use to someone, somewhere ;)

Stuart


> On 11 Mar 2015, at 20:51, Stuart Shelton <srcshelton@gmail.com> wrote=
:
>=20
>=20
> Hi,
>=20
> I=E2=80=99m trying to build an ebtables rule-set with an entry resemb=
ling:
>=20
> ebtables -t filter -A FORWARD -i in+ -o out+ -p IPV4 --among-src-file=
 ! /var/lib/ebtables/ethers.lst -j logdrop
> ebtables -t filter -A FORWARD -i out+ -o in+ -p IPV4 --among-dst-file=
 ! /var/lib/ebtables/ethers.lst -j logdrop
>=20
> (where =E2=80=98logdrop=E2=80=99 is a single-rule chain with policy D=
ROP and entry =E2=80=98--log-arp --log-ip --log-prefix "Mismatching MAC=
:" --log-level 4 -j DROP=E2=80=99, if that=E2=80=99s of any significanc=
e)
>=20
> I notice two issues here - the first is that =E2=80=98ebtables-save=E2=
=80=99 never produces the correct output for such =E2=80=98among=E2=80=99=
 entries, with the generated output ending:
>=20
> ...,xx:xx:xx:xx:xx:xx=3Dyyy.yyy.yyy.yyy, -j logdrop-c 0 0
>                                      ^          ^^
>=20
> =E2=80=A6 with a trailing comma (which may not be anything other than=
 an aesthetic issue), and no space between the target and the =E2=80=98=
-c=E2=80=99 counter token (which is definitely a problem).  This occurs=
 even when the loaded file contains only two items.
>=20
> However, the greater issue still is that if a list of greater than 69=
 entries (or, more likely, 2k of data - 69 entires is going to be ~2000=
 bytes on average, which seems to be suspiciously close=E2=80=A6) is de=
fined, then this list can (apparently) be made live in the kernel and c=
an be saved, but =E2=80=98ebtables-restore=E2=80=99 will always segfaul=
t when attempting to reload it.
>=20
> dmesg says:
>=20
> [7315212.511342] ebtables-restor[24542]: segfault at 0 ip 00000000004=
00f7b sp 00007fff4a315820 error 6 in ebtables-restore[400000+2000]
> [7315240.848830] ebtables-restor[24576]: segfault at 0 ip 00000000004=
00f7b sp 00007fffa37d77b0 error 6 in ebtables-restore[400000+2000]
> [7315369.074719] ebtables-restor[24603]: segfault at 0 ip 00000000004=
00f7b sp 00007ffffb8951a0 error 6 in ebtables-restore[400000+2000]
> [7315432.481345] ebtables-restor[25156]: segfault at 0 ip 00000000004=
00f7b sp 00007fffa6d24420 error 6 in ebtables-restore[400000+2000]
> [7315704.848695] ebtables-restor[26750]: segfault at 0 ip 00000000004=
00e4d sp 00007fffd01d9b00 error 6 in ebtables-restore[400000+2000]
> [7316379.348187] ebtables-restor[27008]: segfault at 0 ip 00000000004=
00e4d sp 00007fff7bd81e60 error 6 in ebtables-restore[400000+2000]
> [7316508.452788] ebtables-restor[27066]: segfault at 0 ip 00000000004=
00e4d sp 00007fff7e43f8e0 error 6 in ebtables-restore[400000+2000]
>=20
> =E2=80=A6 but I don=E2=80=99t currently have gdb on this router, unfo=
rtunately.
>=20
> This figure of 2k/69 entries may well vary dependent on the number of=
 characters or the overall size or number of rules present, or it may b=
e an absolute limit.  Given that the issue seems to occur when more tha=
n 2k of data is loaded and I=E2=80=99m loading the same data twice (onc=
e for source, once for destination), this could be an issue when the ov=
erall dataset to be loaded exceeds the page-size/4k.  On the other hand=
, the loaded lists are hashed, so this may again be coincidence.  I gue=
ss I=E2=80=99m pretty safe in assuming, though, that this is not the in=
tended behaviour.
>=20
> Both of these issues have work-arounds - although working around the =
=E2=80=98among=E2=80=99 size limit would likely mean swapping from a =E2=
=80=9Cif not in list then drop=E2=80=9D to less efficient groups of =E2=
=80=9Cif in list then accept=E2=80=9D in a separate chain with a DROP p=
olicy, which may be less optimal.
>=20
> Thanks in advance,
>=20
> Stuart
>=20

