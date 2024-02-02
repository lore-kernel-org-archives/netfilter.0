Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218F263AA
	for <netfilter@vger.kernel.org>; Fri,  2 Feb 2024 00:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706834233; cv=none; b=I/pyLv6itvZT6bzoI7jc7uTcfWux8z3jf3NAvKE4TPOPe9IXKBN7OSUy6Gr2WrZ/156cgkWDXCJ7jy8KZDimLySqOxAPm6Ekz9r66G2iRQ4e8bJDoimCHi9iLXyoWX8CuUN9NGaLwDKzQDhf+L6cCQgBK7s/p+DP/FuBUFkcWIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706834233; c=relaxed/simple;
	bh=EyvtUPUI8FDLHF3dHw9yo+GqXlaxiatZqnYCuKdiwbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SH7hKUFsvL/GFiuIZmKDH6YOAso3ibo6AR/Bw0vWWq53Kf3MbNb+Nj2thMb5bkHHMpONGgU460QzysPe+Yz2uOxA6jJXYMZyzOx+Vot3mwNephvUaKxAZb7UXF3Wh5KyXZKLkWSEfLPZfOr48gpjuTm6UY/V1SiF7KnGje/D1ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luge1XG5; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luge1XG5"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc6af9a988eso1395068276.0
        for <netfilter@vger.kernel.org>; Thu, 01 Feb 2024 16:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706834231; x=1707439031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQaGJRkjouBGULUiigEI8L4KlUx58ZZw/j5e68frTU8=;
        b=luge1XG5LzaWECJChbyNSAluq9ZQUP19+BdxW3uBdfJe8B2CXJGggjm4fWXy/7vt8Y
         7E26B0D3rhfgvRnQWhWUdgkfjFYn6h7/bfVdLTA9pru1EA4HA8gy3ujTytZ9CYNo/FPP
         hiRd6LiJDgKZDOnndzPVHH/J3GbJIXsnppn1BjHdG25AuurDV2hOpqwqG7R5CWek7I9j
         7dq3kWadZjhhU2N8ACY5TE1cLlCBBYPqPl47LqvyD2YQJQcOkAjjCeSU08jFRx+jReF5
         /3TI/hAGczh2ntpD2RmHl+FiCPX+OEyPHK6ji/mGWcIjHPmt4J22xopQD1zz82TpQ6rt
         LTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706834231; x=1707439031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQaGJRkjouBGULUiigEI8L4KlUx58ZZw/j5e68frTU8=;
        b=eVmySH3fmepD8VIvzGVgaboWqOkooG2aYa9Y5J9J1CV86yT15eqf9osDSOyIMLEU50
         mS/Rm7OvGt/AZ0g7nbVwhjXR3XX4vNTF9KV233cOI04q8bZcKkRc5M98zAUSPvL7AU/j
         0XIBxYDF32CJ4crANZH55uZE6WKeIU23f5N0QxdVVpF49bbzeLiBOFt34054cSIYxgzz
         f6GcYBJsRmsnsSsMBP9GgEFsNCjtPgriyW85ZtbL9HhhxOHOeMXdtZuU4xEnVBhKzK9Z
         7fRm8xS2pE2y+98CymOs4HQz8wGauIil2gWA64qj4cowV79RiT+eUGEfE68CEmCnYpNc
         wZJw==
X-Gm-Message-State: AOJu0YzPosQO74BQjh5hOgiHb1PdEZhS8EfLhCmy5qJI4F01wazMvZI1
	zl7vGuPBmf5XpO+ZLS1/2olGqQTVxUOQ7gS+tNJRvCG18KniT3L7dtWoHND98mTQS44rJHntrD8
	jVR7RYys7ZOrDt4LiuYmeBQLGQHRDCC6b
X-Google-Smtp-Source: AGHT+IEtHAML5+lUcR364jv6upNSx6jiXEg6aSnw0HsUqzVsqOIyYW+QyVqRhIWFsn8Ip/pqLYfuwFiW++8cjYRb6/U=
X-Received: by 2002:a25:844c:0:b0:dc6:b0ce:97d with SMTP id
 r12-20020a25844c000000b00dc6b0ce097dmr7171218ybm.29.1706834230940; Thu, 01
 Feb 2024 16:37:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com>
 <ZbtnQXFtUTkVRZ0C@calendula> <f1787459-57fb-43e9-b04d-bad0e296dc80@app.fastmail.com>
In-Reply-To: <f1787459-57fb-43e9-b04d-bad0e296dc80@app.fastmail.com>
From: Anton <anton.khazan@gmail.com>
Date: Fri, 2 Feb 2024 02:36:54 +0200
Message-ID: <CAJE3=w=zOc_yt5WeJA9XuDfStLe9KArnp5t5N-_Fw4kDFPZ+3w@mail.gmail.com>
Subject: Re: Is there an efficient way to delete multiple elements from a set?
To: Kerin Millar <kfm@plushkava.net>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

At this point I have moved on from the idea of aggregating multiple ip
blocks in a single set because I want my project to work well on
embedded devices which have limited memory and CPU power, and, as I
discovered by trial and error, currently adding elements is not an
option for this application because of high memory consumption and
other performance issues (which I reported in Bug 1735).
I figured that nftables provides a way to swap sets without offline
time, and it's good to have this confirmed. That said, it would be
really nice to have a swap command for nftables sets. This would be a
quality of life improvement that I'm sure many people would
appreciate.
Thanks everyone for your help.

On Thu, Feb 1, 2024 at 2:21=E2=80=AFPM Kerin Millar <kfm@plushkava.net> wro=
te:
>
> Hi Pablo,
>
> On Thu, 1 Feb 2024, at 9:41 AM, Pablo Neira Ayuso wrote:
> > On Wed, Jan 31, 2024 at 10:14:41AM +0200, Anton wrote:
> >> Hello, I've been experimenting with nftables sets for the purpose of
> >> geoip blocking. Let's say I'd like to add ip blocks for multiple
> >> countries to a blacklist or to a whitelist. Perhaps the most efficient
> >> way to do that would be by combining all required ip blocks in one set
> >> (for each family). However since country ip blocks are a moving
> >> target, I would need to regularly refresh parts of that set. My idea
> >> was to delete all ip addresses corresponding to an ip block from the
> >> set and then add the updated ip block. The problem is, this is very
> >> slow. While adding an ip block takes (in my VM) 0.09s, deleting all
> >> ip's from that same block takes 14.5s.
> >>
> >> This is how I'm doing the deletion and the time measurement:
> >> printf '%s\n' "delete element inet test testset { $(cat test.set) };"
> >> | /usr/bin/time -f %es nft -f -
> >>
> >> (the test.set file stores a comma-separated list of subnets)
> >>
> >> Is there a more efficient way to do this? I could of course flush the
> >> set and rebuild it every time I need to update some part of it, but I
> >> thought I'd ask before deciding to implement that.
> >
> > It is possible to flush the set and fill up with content again:
> >
> > flush set inet test testset
> > add element inet test testset { ...  }
>
> I figured that this approach was already on the cards ("I could of course=
 flush the set and rebuild"), though it is possible that Anton wasn't aware=
 that it can be done atomically.
>
> As far I understand the original post, he is aggregating multiple country=
 blocklists to form a single set - a blacklist or a whitelist, as it was pu=
t. That would explain his interest in deleting subsets to begin with. The f=
lush/rebuild approach may well be faster but it would also require reading =
in all of the subsets again - even those that haven't changed. Perhaps not =
a big deal in the greater scheme of things but it does make me wonder wheth=
er there's room for improvement as far as deletions go. I might test this o=
n the next occasion that I'm experimenting with set behaviour.
>
> --
> Kerin Millar
