From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Returning nat packets vanishing after mangle:PREROUTING and conntrack
   processing
Date: Sat, 19 Dec 2009 19:39:51 +0100
Message-ID: <4B2D1DF7.1060105@plouf.fr.eu.org>
References: <7ad63010a18944d3264b5ba158c236df@localhost> <4B2CD13D.504@plouf.fr.eu.org> <40efba0ec31032f27b200a4da7b17ae9@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <40efba0ec31032f27b200a4da7b17ae9@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Scott Shambarger <scott-netfilter@shambarger.net>
Cc: netfilter@vger.kernel.org

Scott Shambarger a =E9crit :
>=20
> Fantastic, works great.  Changed to 'net.ipv4.conf.default.rp_filter =
=3D 0'
> in sysctl.conf (was set to 1).
>=20
> Oddly, I had rp_filter enabled on the system in kernel 2.6.30 and it
> worked.  Has rp_filter changed somehow in the newer kernel (or is it =
now
> working 'correctly'?).

(Searching in kernel changelogs...)
Yes, rp_filter slighly changed in kernel 2.6.31 (commit
27fed4175acf81ddd91d9a4ee2fd298981f60295). IIUC it is the way that
net.ipv4.conf.<interface>.rp_filter and net.ipv4.conf.all.rp_filter are
combined together that changed from a logical AND to an arithmetic MAX.
This was a fix for a previous patch in kernel 2.6.30 (commit
c1cf8422f0512c2b14f0d66bce34abb0645c888a) which added support for
reverse path filtering "loose mode" (actually a route presence check),
changing rp_filter type from boolean to integer and assigning the value
2 to the new loose mode (see Documentation/networking/ip-sysctl.txt for
details).

Before kernel 2.6.31 :
Actual rp_filter for <interface> =3D net.ipv4.conf.<interface>.rp_filte=
r
AND net.ipv4.conf.all.rp_filter
I.e. reverse path filtering is enabled in strict mode if rp_filter=3D1 =
for
both "all" and the interface.

Since kernel 2.6.31 :
Actual rp_filter for <interface> =3D
MAX(net.ipv4.conf.<interface>.rp_filter, net.ipv4.conf.all.rp_filter)
I.e. reverse path filtering is enabled in strict mode if rp_filter=3D1 =
for
either "all" or the interface.

If by "I had rp_filter enabled" you mean that only
net.ipv4.conf.default.rp_filter was set to 1 and
net.ipv4.conf.all.rp_filter was left to 0 (default), then with the
kernel 2.6.30 the resulting AND was 0, so the reverse path filtering wa=
s
disabled. But with the kernel 2.6.31 the resulting MAX is 1, so strict
reverse path filtering is enabled.

Notes :
1) "Loose" reverse path filtering may be a bit better than no reverse
path filtering and should work with your setup.
2) Reverse path filtering in kernel 2.6.32 uses the mark as in policy
routing, so strict reverse path filtering may work better in multihomed
setups like yours.
