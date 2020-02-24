From: Stephen Satchell <list@satchell.net>
Subject: Re: Waiting until first release of NFTABLES
Date: Mon, 24 Feb 2020 08:24:20 -0800
Message-ID: <ff0fb90e-8da1-18b5-9be5-dc7c4886a009@satchell.net>
References: <c4e081c5-3bb9-827e-a382-388fe4d859de@satchell.net>
 <875zfwssw1.fsf@goll.lan> <b0399d25-901e-38a8-7359-8096516a818e@satchell.net>
 <e36d450d-6707-4902-9378-a326504e5840@thelounge.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e36d450d-6707-4902-9378-a326504e5840@thelounge.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

On 2/24/20 1:25 AM, Reindl Harald wrote:
>=20
>=20
> Am 24.02.20 um 06:02 schrieb Stephen Satchell:
>> As for other packages with version numbers of 0.x, I'm not all that
>> concerned in a firewall router for anything except the firewall facility
>> itself.=C2=A0 This router will have, as its sole job, filtering incoming=
 and
>> outgoing packets to my upstream.
>=20
> 1.0 vesions in the opensource world typically stand for "feature
> complete" and you couldn't care less about features developers are
> planning when you don't miss and use them
>=20
>=20
> besides that "nftables" is not the "firewall facility itself", it's the
> package with the userland tools
>=20
> the kernel does the filtering and has no version 0.9 for decades

"A chain is as strong as its weakest link."  libnftables.c doesn't carry=20
a version number in its source, so I don't know what release level it's at.

One thing I would love is a way of injecting packets into a userland=20
test tool that reports what nftables did with it.  If I had such a tool,=20
I would be more inclined to use a 0.x version because I could verify=20
that the code plus ruleset is doing what it's supposed to do.

Yes, I know that a number of IP et al filters don't have a quality check=20
feature.  (Run into this all the time with Cisco routers, for example.)

