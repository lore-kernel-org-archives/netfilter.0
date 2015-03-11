From: Stuart Shelton <srcshelton@gmail.com>
Subject: ebtables: ebtables-restore segfaults when 'among' list has many items
Date: Wed, 11 Mar 2015 20:51:37 +0000
Message-ID: <2B1BE39E-516E-4C80-8137-553E21E5803C@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-type:content-transfer-encoding:date:subject:to
         :message-id:mime-version;
        bh=Rel+U6AyKwm7emBfjjZt50MfMe5/NIvAQ9dPP1cDX74=;
        b=JrNSeBonZ1FpL8O2cRblT9+PDwJ/zQh5Ops6Nn2Kzy5h2PcO2wtYMV/b7RdvijjKh5
         HfVlB1Pbp0pXtg+PZW1juynT+jrDNRv/ea2mTqiZC5x1KL/bzpeDbMr5U1i5iOe2lpx+
         VAMtYlUzJQDC9Ogov3Eu3GcIvsQe0ark3Ls7c7jv/mu8ZfJ6vg/0fN8miI6dgHwHjTQv
         EFzwFK1GlYgvWl3PdNjYnxsIxKI1d72GQrKLQuRhBwIT9zn6QMUzH7owzc1EKkwv+yNk
         l3TV6c6JolOl4kEtsaKAKtlPvUO9305p/pPFHjooFG1xH/F2sr+2IjwoIuDgqXnHNbvt
         yitA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org


Hi,

I=E2=80=99m trying to build an ebtables rule-set with an entry resembli=
ng:

ebtables -t filter -A FORWARD -i in+ -o out+ -p IPV4 --among-src-file !=
 /var/lib/ebtables/ethers.lst -j logdrop
ebtables -t filter -A FORWARD -i out+ -o in+ -p IPV4 --among-dst-file !=
 /var/lib/ebtables/ethers.lst -j logdrop

(where =E2=80=98logdrop=E2=80=99 is a single-rule chain with policy DRO=
P and entry =E2=80=98--log-arp --log-ip --log-prefix "Mismatching MAC:"=
 --log-level 4 -j DROP=E2=80=99, if that=E2=80=99s of any significance)

I notice two issues here - the first is that =E2=80=98ebtables-save=E2=80=
=99 never produces the correct output for such =E2=80=98among=E2=80=99 =
entries, with the generated output ending:

=2E..,xx:xx:xx:xx:xx:xx=3Dyyy.yyy.yyy.yyy, -j logdrop-c 0 0
                                    ^          ^^

=E2=80=A6 with a trailing comma (which may not be anything other than a=
n aesthetic issue), and no space between the target and the =E2=80=98-c=
=E2=80=99 counter token (which is definitely a problem).  This occurs e=
ven when the loaded file contains only two items.

However, the greater issue still is that if a list of greater than 69 e=
ntries (or, more likely, 2k of data - 69 entires is going to be ~2000 b=
ytes on average, which seems to be suspiciously close=E2=80=A6) is defi=
ned, then this list can (apparently) be made live in the kernel and can=
 be saved, but =E2=80=98ebtables-restore=E2=80=99 will always segfault =
when attempting to reload it.

dmesg says:

[7315212.511342] ebtables-restor[24542]: segfault at 0 ip 0000000000400=
f7b sp 00007fff4a315820 error 6 in ebtables-restore[400000+2000]
[7315240.848830] ebtables-restor[24576]: segfault at 0 ip 0000000000400=
f7b sp 00007fffa37d77b0 error 6 in ebtables-restore[400000+2000]
[7315369.074719] ebtables-restor[24603]: segfault at 0 ip 0000000000400=
f7b sp 00007ffffb8951a0 error 6 in ebtables-restore[400000+2000]
[7315432.481345] ebtables-restor[25156]: segfault at 0 ip 0000000000400=
f7b sp 00007fffa6d24420 error 6 in ebtables-restore[400000+2000]
[7315704.848695] ebtables-restor[26750]: segfault at 0 ip 0000000000400=
e4d sp 00007fffd01d9b00 error 6 in ebtables-restore[400000+2000]
[7316379.348187] ebtables-restor[27008]: segfault at 0 ip 0000000000400=
e4d sp 00007fff7bd81e60 error 6 in ebtables-restore[400000+2000]
[7316508.452788] ebtables-restor[27066]: segfault at 0 ip 0000000000400=
e4d sp 00007fff7e43f8e0 error 6 in ebtables-restore[400000+2000]

=E2=80=A6 but I don=E2=80=99t currently have gdb on this router, unfort=
unately.

This figure of 2k/69 entries may well vary dependent on the number of c=
haracters or the overall size or number of rules present, or it may be =
an absolute limit.  Given that the issue seems to occur when more than =
2k of data is loaded and I=E2=80=99m loading the same data twice (once =
for source, once for destination), this could be an issue when the over=
all dataset to be loaded exceeds the page-size/4k.  On the other hand, =
the loaded lists are hashed, so this may again be coincidence.  I guess=
 I=E2=80=99m pretty safe in assuming, though, that this is not the inte=
nded behaviour.

Both of these issues have work-arounds - although working around the =E2=
=80=98among=E2=80=99 size limit would likely mean swapping from a =E2=80=
=9Cif not in list then drop=E2=80=9D to less efficient groups of =E2=80=
=9Cif in list then accept=E2=80=9D in a separate chain with a DROP poli=
cy, which may be less optimal.

Thanks in advance,

Stuart

