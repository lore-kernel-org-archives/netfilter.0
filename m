From: <joydeep.bakshi@infoservices.in>
Subject: Re: iptables port redirect question
Date: Mon, 17 Sep 2012 12:47:20 +0530
Message-ID: <20120917124720.433e03c4@shiva.selfip.org>
References: <20120917110300.5e546d0c@shiva.selfip.org>
	<3980014.EOsJlpYLpK@alaris>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3980014.EOsJlpYLpK@alaris>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Michal =?UTF-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Cc: netfilter@vger.kernel.org

On Mon, 17 Sep 2012 08:12:23 +0200
Michal Kube=C4=8Dek <mkubecek@suse.cz> wrote:

> On Monday 17 of September 2012 11:03EN, joydeep@infoservices.in wrote=
:
> > Hello,
> >=20
> > How can I redirect all packets exclude the packets for lan (
> > 192.168.0.0 ) and all packets to/from lo (localhost) ?
> ...
> > But this also redirect all local lan packets naturally, as it compa=
res
> > with lo . How can I combined both lo and local lan ? Can a customiz=
ed
> > chain help ?
>=20
> Yes, in general, custom chain and RETURN target can help to simulate=20
> "or" operator. But in your case, you should be able to combine "! -o =
lo"=20
> and "! -d 192.168.0.0/16" matches to do what you need.
>=20
> On the other hand, I prefer to explicitly state what I want to=20
> masquerade rather than masqeurading everything with some exceptions.
>=20
>                                                           Michal Kube=
=C4=8Dek
>=20

Thanks,

Actually my requirement is fulfilled by routing everything excluding lo=
 and
local lan. May be I need to exclude the gmail smtp and pop. But that's =
all.
Does the "and" operator simply works as you have described ? What shoul=
d be done
if I go for a custom chain ?

-- regards
