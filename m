From: Florian Westphal <fw@strlen.de>
Subject: Re: iptables 1.8.8 fails with error code 111 but iptables 1.8.7
 succeeds with same script
Date: Fri, 17 Jun 2022 17:09:31 +0200
Message-ID: <20220617150931.GA19244@breakpoint.cc>
References: <f8b1ba7f-2d59-e068-92ca-a139959aa2fd@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f8b1ba7f-2d59-e068-92ca-a139959aa2fd@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Amish <anon.amish@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

Amish <anon.amish@gmail.com> wrote:
> I use Arch Linux. Apache 2.4.54 and iptables 1.8.8 (nft based).
>=20
> I have a setuid script, given below, which runs via apache httpd and simp=
ly
> calls "iptables -w -nvL INPUT" and gives the output.
>=20
> But with iptables 1.8.8 it fails with error code 111 (undocumented code)
>=20
> > curl http://127.0.0.1/ipt.e
> EUID =3D 0, EGID=3D33
> iptables exited with exit code=3D111
> iptables exited with exit code=3D111

I plan to add this to the manual page:

iptables will exit immediately with an error code of 111 if it finds
that it was called as a setuid-to-root program.
iptables cannot be used safely in this manner because it trusts
the shared libraries (matches, targets) loaded at run time, the search
path can be set using environment variables.

> So it appears to be some kind of bug introduced in 1.8.8.

Its intentional.

> The C script follows: (Can be used for testing)
> int my_system(const char *program, char *const argv[])
> {
> =A0=A0=A0 pid_t pid =3D fork();
> =A0=A0=A0 if (pid=3D=3D(pid_t)-1) return -1;
> =A0=A0=A0 if (!pid) { execve(program, argv, environ); exit(127); }

iptables evaluates some environment variables and trusts that info.
If you absolutely have to do this, re-set environ so that someone
else calling this wrapper can't use it to load their own
modules/targets.

Then add a 'setuid(0)' before execve.
