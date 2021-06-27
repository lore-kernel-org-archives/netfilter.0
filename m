From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Reload IPtables
Date: Sun, 27 Jun 2021 20:07:52 +0100
Message-ID: <20210627200752.694217a849963715fd782049@plushkava.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
        <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
        <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
        <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
        <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
        <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
        <20210627191107.79ca63b9cf4dfe9028649524@plushkava.net>
        <227edb33-b86d-2310-bc63-c6d903bea95d@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        VxSOG1MELbq6oJ2UlCqje5NYokZ+GEfL+2ijvp32yEY=; b=j5J0JoD8/jukjQVk
        ESZfv94hKeu682GxR/95Lyj4nhaIwZFD7TIvhEfEEu+UuY4a2DPJOTRQuSHrPH5q
        oiXSXR/hGroUf+Mk35p5xBUsdRNZPsxpoEuINhG4VbYDQB678i+BINKOV/5mX+zn
        lLAxCNDKMbKHgapoL96S/N7LXd04i/B5cEeY53W6JWFzGodWv7unKwWcI0cfbMIZ
        V5Gtn14v5AWNKDfvYt5coybejL5xT4jv/lNfxP6m0QgUh4eAxx+CLYqI/rnIxN3U
        vyvdzBJQ8ksOeP7pIbsNT8+4TXYuP+bmWfHawGzhD4JxrJXgnwLT3MQSCmPB5wph
        e2nBAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=VxSOG1MELbq6oJ2UlCqje5NYokZ+GEfL+2ijvp32y
        EY=; b=lpxoEZSnFuQxp1Fmo+E1rcHqJUVdIffvMRR6r+sqRyi8KR0iGQpaQHacz
        S2MDUb+BiP1Qb3lgTC8RVCYG00bA0caA50luUt+gh/y/bUeh14UQoy2ZrNr+yExt
        PGcni9rzhvrVFqbYsMG1nKNNcq8anSRpPEl9T6hS/4fhKHKpbAzZFM/Ad50mVl5c
        GCHrTIsyCKpILpvRrlww1eQec5tFQ9YdH1ob+78cpVUQd/vh+j4v3MFzVDjOlFiK
        1TKuhekgBTVevI/E1EHtUtgzIxxAZ1ppD3/PMZMVQBRD1uYqou+Vww9bm3CJUyRR
        qlj5T0yDOA22tWFLAHrh3nS/NC5ZQ==
In-Reply-To: <227edb33-b86d-2310-bc63-c6d903bea95d@att.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: slow_speed@att.net
Cc: netfilter@vger.kernel.org

On Sun, 27 Jun 2021 14:32:39 -0400
slow_speed@att.net wrote:

> Thank you for that very good explanation.
>=20
> As it turns out, I am learning two ways at once.=A0 One is my desktop=20
> computer running Debian 10 which used nftables (and I believe=20
> nftables-persistent is built-in to the nftables mechanism).=A0 The other=
=20
> is a little Raspian server which is based on Debian 10, but does not use=
=20
> nftables.
>=20
> In the second case, one must reload iptables when changes are made to=20
> it.=A0 If I correctly understand, one must use sudo iptables -F, followed=
=20
> by sudo iptables-restore < /etc/iptables.up.rules (or wherever they=20
> are).=A0 Doesn't it need the little left arrow/less-than sign?=A0 Does th=
at=20
> sound correct?

Concerning wherever they may be, they would be at "/etc/iptables.rules.v4" =
in the event that you are using iptables-persistent.

In any case, no, I would not consider this approach to be correct. Running =
`iptables -F` will empty the chains in the filter table. Not only would it =
fall short of 'resetting' the entire ruleset, you would be rendering the ov=
erall procedure non-atomic by unnecessarily splitting it into two distinct =
steps. Depending on your default chain policies, you could leave yourself t=
emporarily wide open or, say, lock yourself out of a remote system. That's =
before even getting to the point of validating the ruleset that you intend =
to load. Just go straight to invoking iptables-restore (or netfilter-persis=
tent). As long as the ruleset is valid, it will be applied in full, atomica=
lly. Otherwise, an error will be displayed and nothing will change. There i=
s no in-between, which is as it should be. In short: my advice remains as c=
onveyed by my previous post.

Use of shell redirection is optional in this case but I would caution again=
st making it a habit in conjunction with the use of sudo. The shell will ex=
ecute sudo which, in turn, will execute iptables-restore with root privileg=
es. However, that very same shell - which, presumably, wasn't running as ro=
ot to begin with - will process the redirection operator and attempt to ope=
n the given file. Provided that the file is readable by the shell's user, t=
his poses no problem. However, should the file's permissions be restricted =
to the extent that only the root user can read the file, failure will ensue=
. By contrast, `sudo iptables-restore /etc/iptables.up.rules` is immune bec=
ause the responsibility for opening the file is delegated to iptables-resto=
re itself.

--=20
Kerin Millar
