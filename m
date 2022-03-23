From: =?UTF-8?Q?L=c3=a9o_El_Amri?= <leo@superlel.me>
Subject: Re: json_cmd not working as intended
Date: Thu, 24 Mar 2022 00:56:18 +0100
Message-ID: <2b2b64d4-c7d9-fc26-2ab5-6af2baf464df@superlel.me>
References: <uHSFrk1rZGQ1Q18XE415Rn-mCIl3BfZ8Gafuz8KTHku5GOGqGrX_1p4mZV6qSArpk5qFNrHuLh91XkgZUcS2F8bk14M1_2Pr2VIwjgtGpHs=
 () protonmail ! com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <uHSFrk1rZGQ1Q18XE415Rn-mCIl3BfZ8Gafuz8KTHku5GOGqGrX_1p4mZV6qSArpk5qFNrHuLh91XkgZUcS2F8bk14M1_2Pr2VIwjgtGpHs=
 () protonmail ! com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

On 18/03/2022 15:21, Francisco Albani wrote:
> Hi!

Hi Francisco,

> I was translating some nft cli bash scripts to python and tried to apply =
wh=3D
> at I learned in https://man.archlinux.org/man/extra/nftables/libnftables-=
js=3D
> on.5.en , but I could not make it work.
>=20
> I made a repo with the minimal example that shows the difference: https:/=
/g=3D
> ithub.com/franalbani/nftableson

I also have an issue with the netdev/device part. I believe it would be=20
better if you described the issue directly in the message rather than=20
linking to a git repository. Let me describe the netdev/device part:

Calling nft_run_cmd_from_buffer with JSON as input, for the command "add=20
chain netdev table_name chain_name {type filter hook filter device=20
existing_device priority 0 ; policy drop ;}", returns the following=20
error: "internal:0:0-0: Error: Could not process rule: No such file or=20
directory". The same command, given as non-JSON input works.

I do not fully understand yet what json_parse_cmd_add_chain is doing=20
with the "dev" part of the object, I'm only 30 minutes into reading.

I believe this is a bug (in v0.9.3), either in the documentation, or in=20
the nftables code.

There is also the issue of the device of netdev chains not being shown=20
when requesting a JSON output (can be tested with "nft -j list ruleset"=20
when a netdev chain exists). Since the JSON output is loosely=20
documented, I don't know whether we can call this a bug. Either way,=20
it's quite annoying for me because I'd like to rely on the device to=20
select chains to delete when scripting firewalling. I believe the JSON=20
output should show the device(s) for netdev chains.

If the issue is coming from json_parse_cmd_add_chain, and looking at the=20
diff between v0.9.3 and v1.0.2, I believe this isn't fixed in v1.0.2=20
since nothing related to the "dev" parameter was changed.

I'll try to investigate further until a maintainer take a look at this=20
(they'd be far more efficient than me, as I know nothing about nftables=20
internals).

--=20
L=C3=A9o
