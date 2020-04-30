From: John Haxby <john.haxby@oracle.com>
Subject: Re: idempotent nft delete table? (or: why does "flush table" delete
 rules but keep chains?)
Date: Thu, 30 Apr 2020 16:12:00 +0100
Message-ID: <A462AEC5-923F-4688-9CEF-1E820172EEB0@oracle.com>
References: <87368l38gk.fsf@goll.lan>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=o13TJZmF5qnJR3riJ7VRntOSLhfEUPvXl+PCKGfo+Eg=;
 b=lGz+A2/7tt3+qUEe2rOX9+ob4Pu8QuYGxKnUDEVx/O1WTiARDjBzzb+u9gAfsnTLlUOF
 Dl5lp5zEq63kVFTa/thmfyy40mVoBd0WZUNPeUhcS2pmEu/IWgCBDm1AnAdqE4OLzroS
 8ztj9RAnPWzupB3QoYc4oxUigeF3rOtC6tbU96GX8sU7fsbvcSFRIBAB/ML7X1875Ae0
 6BqKaie4DBSECqbU6SP3DyAvOjpGxog3kDIHINLt/Lrzy3nhoO8eKNxWXEQDqpzpqgyU
 XbLjkeO5KjR2x/sHhYiCwyyl+egiTjLfYwDstYAhCnQp7Joho1YLcOC9Ka4thExGIqUX Lw== 
In-Reply-To: <87368l38gk.fsf@goll.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: trentbuck@gmail.com
Cc: netfilter@vger.kernel.org



> On 30 Apr 2020, at 05:26, trentbuck@gmail.com wrote:
>=20
> A typical ruleset looks like
>=20
>    flush ruleset
>    table filter { ... }
>=20
> That works fine until I have several partial rulesets (e.g. the
> sysadmin, libvirtd, and sshguard) that manage their own tables in
> parallel, e.g.
>=20

For various reasons, I construct a ruleset file and the first line or so =
comes from

	nft list tables | sed -n '/mytablename/s/^/delete /p'

Which leads me to wonder whether there is any meaningful difference =
between flush and delete unless you don't want to delete sets defined in =
the table[1].

jch


[1] https://wiki.nftables.org/wiki-nftables/index.php/Configuring_tables=
