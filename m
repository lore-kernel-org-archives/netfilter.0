From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: Strange Error When Adding Element to Named Set
Date: Fri, 8 May 2020 18:01:32 +0200
Message-ID: <20200508160132.GA2278@salvia>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Dillinger <miked@softtalker.com>
Cc: netfilter@vger.kernel.org

On Fri, May 08, 2020 at 07:06:56AM -0700, Mike Dillinger wrote:
> Hello,
>=20
> This has been a problem since my kernel was upgraded to 5.6. Everything w=
as fine prior to that where I was running the 5.5 kernel.
>=20
> I'm running Debian testing and here is some information regarding my syst=
em:
> $ uname -a
> Linux rockenfield 5.6.0-1-amd64 #1 SMP Debian 5.6.7-1 (2020-04-29) x86_64=
 GNU/Linux
> $ nft -v
> nftables v0.9.4 (Jive at Five)
>=20
> I have a script that blocks IP's by adding them to a named set, and the n=
amed set has a 12 hour expiration.=A0 After about a day of uptime, I start =
getting the following error.=A0 I'm obfuscating the IP address with "a.b.c.=
d".
>=20
> $ nft add element ip filter blacklist4-ip-12h { a.b.c.d }
> Error: Could not process rule: File exists
> add element ip filter blacklist4-ip-12h { a.b.c.d }
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> I can check the named set and no such IP address exists, and double check=
ed using grep.=A0 Here's the kicker: if I reboot, it works fine. The blackl=
ist4-ip-12h set has 191 IP's so it shouldn't be a matter of too many IP's.=
=A0 I've had up to 300 in the set before with no problems.=A0 If I had too =
many IP's, I'd expect the same behavior after a reboot which is not the cas=
e.=A0 It's not an issue with any particular IP address; rather it disallows=
 anything being added to the named set entirely.=A0 Here are the properties=
 of the set in case something is wrong there:
>=20
> =A0=A0=A0 set blacklist4-ip-12h {
> =A0=A0=A0=A0=A0=A0=A0 type ipv4_addr
> =A0=A0=A0=A0=A0=A0=A0 flags interval,timeout
> =A0=A0=A0=A0=A0=A0=A0 timeout 12h
> =A0=A0=A0=A0=A0=A0=A0 gc-interval 1m
> =A0=A0=A0 }
>=20
> If the set properties look OK, then I'm fairly confident this is a bug.=
=A0 I wanted to know if it's a kernel issue or an nftables issue, and also =
where to go to file a bug, and I can take it from there. I'm not sure when =
nftables was upgraded if we're suspecting nftables.=A0 I'd need to do some =
digging.
>=20
> Any help is greatly appreciated.=A0 Having to reboot daily to work around=
 this issue is not desirable.

Please, make sure your Linux kernel version is >=3D 5.6.7 or manually
cherry-pick this fix which was included starting that version.
Versions from 5.6.0 to 5.6.6 include this problem you describe.

See https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.6.7

Author: Stefano Brivio <sbrivio@redhat.com>
Date:   Wed Apr 1 17:14:38 2020 +0200

    netfilter: nft_set_rbtree: Drop spurious condition for overlap detectio=
n on insertion
   =20
    commit 72239f2795fab9a58633bd0399698ff7581534a3 upstream.


