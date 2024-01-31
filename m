Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CF45BAFF
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706689666; cv=none; b=egBUgkaAZkhCwLdc2Yd9fZCm5rFTE64rGKgRu8gCBQpPfquM26pGxjN4tsTopjnsMETQtQOlz8YJGqjXDd0S5xXd4EAWm1fsVwT4yG4PFFbknFyEEm1sQdRo8P9RHQr2T752jXOhwvNnrggjX398P+vNFVHddjUpun9Pq1JrBhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706689666; c=relaxed/simple;
	bh=z/SrxQ1BvYGwBWFB6x6Oj+AOU6861xS6kyiFrRsOZoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvVz1x4Oc5QLu/ml53I1w1BBNkWd7aUH+DXlPNG2cfXVz2TwInarDPtmkn3sJMChvG1GPrs1XGBQ0IE5/aWDW23jcjvS25zMJvLVjqaNQqtsBQxbT0SDarOdIeCUibJeygDt+G4pflEnBZH/ARGVN7QqEG6hJPfyokL/hNDqyp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwbPzUAe; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwbPzUAe"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc608c3718dso4257614276.1
        for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 00:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706689663; x=1707294463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/SrxQ1BvYGwBWFB6x6Oj+AOU6861xS6kyiFrRsOZoA=;
        b=IwbPzUAe30JDmtH0VhvSdrXCv86M0H9pF/wqPKqz5SZZ/ViBIfNWA7Jq+JM7Vs/ZdS
         tBdQYXUfmBOsunC8+3gJlo9To+v0DoJ8w674VpF5KIITxUWktFSY9ew2uJdKyuXUNuMZ
         CgiK1erLBtVnkL1rv0v79YfmwTU8yvh02FD3cN96gobtFqsPboqtABa6lWc+/maSYCWK
         zK3+0O+oP4wBRbYme/cLxTWdPEYftY3nUzYYXbFrq1Inf0dTDnHL9hTmIQr5BbdjR70t
         1gEZuH27fdpKQkiSYt1vjTsZxqv3FTWX9FelA6+UIywG+fdDsszSmw2pAyG6lMJJGTIf
         Ashg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706689663; x=1707294463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/SrxQ1BvYGwBWFB6x6Oj+AOU6861xS6kyiFrRsOZoA=;
        b=JQ6HNNL7fF8gIAG/LgO5YF6C1MKG/oxp5iB3UUif7kJVKOqUa+7/HyZedIOji9H1qa
         nHbeJ/UvhjzNPb9m05yRBcDUB07Rd9PxG5y1Xi8FmRFkA3Gux8xdOE/cCc4bi1Z1/CfP
         xQRqmbS+ANYuu6No0mKVVjfJzkOPb/EAjj1visnT3saiH3EVr+EARVwJI8tmB6biqVVX
         to6aXtP/1G5D7lp8tvGupmLa2u7TEHvbqTx+SMFPPECu0oU6eqh7XVH3A21PAtOojKvA
         0xNoxwemp99qEr4i89OMjjemogUG/YrfFGVC58bHnFDd4oDQaS3g00kqHC8ZSWlu1N/M
         /ciw==
X-Gm-Message-State: AOJu0YzmyklrqjuK33j/6VJoqzpUS6OXUjmBTcvVUobor6ARkVfrvNf1
	Mr9c+bkMFN6xt8V831dpH3QtlGWZO3CbKsMzqJ5jNSE55pnuEiUx0qojiCXurszBas7h8PeQJM8
	ed6ugUYXu2TjljG1pf1bdvaJHLb9qyv9y
X-Google-Smtp-Source: AGHT+IE9+sS+riIT9FJKN3FviV+BUfFBSuBoZb+sVyv6+5IBcjmeBLKq0LM3R1HzpzCWeRk7t9kwoEA4QNHs3MFakgk=
X-Received: by 2002:a25:c702:0:b0:dc2:554f:ef44 with SMTP id
 w2-20020a25c702000000b00dc2554fef44mr939122ybe.18.1706689663467; Wed, 31 Jan
 2024 00:27:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com>
 <841e1c2e-1ea9-4e1a-929a-7f954296b8fb@thelounge.net>
In-Reply-To: <841e1c2e-1ea9-4e1a-929a-7f954296b8fb@thelounge.net>
From: Anton <anton.khazan@gmail.com>
Date: Wed, 31 Jan 2024 10:27:29 +0200
Message-ID: <CAJE3=wkyyt2MXfrBK_FvhY_k-AQfDTOcspsXHNW9JaGft75iDQ@mail.gmail.com>
Subject: Re: Is there an efficient way to delete multiple elements from a set?
To: Reindl Harald <h.reindl@thelounge.net>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your input. As I mentioned, I am specifically
considering nftables sets, not 'ipset' sets. nftables sets do not
support swap AFAIK. Now I could use separate sets for each country
regardless and replace them when needed, however this way the firewall
won't be as efficient as with one rule and one set. I may eventually
do it this way if there is no better option.

On Wed, Jan 31, 2024 at 10:21=E2=80=AFAM Reindl Harald <h.reindl@thelounge.=
net> wrote:
>
>
>
> Am 31.01.24 um 09:14 schrieb Anton:
> > Hello, I've been experimenting with nftables sets for the purpose of
> > geoip blocking. Let's say I'd like to add ip blocks for multiple
> > countries to a blacklist or to a whitelist. Perhaps the most efficient
> > way to do that would be by combining all required ip blocks in one set
> > (for each family). However since country ip blocks are a moving
> > target, I would need to regularly refresh parts of that set. My idea
> > was to delete all ip addresses corresponding to an ip block from the
> > set and then add the updated ip block. The problem is, this is very
> > slow. While adding an ip block takes (in my VM) 0.09s, deleting all
> > ip's from that same block takes 14.5s.
> >
> > This is how I'm doing the deletion and the time measurement:
> > printf '%s\n' "delete element inet test testset { $(cat test.set) };"
> > | /usr/bin/time -f %es nft -f -
> >
> > (the test.set file stores a comma-separated list of subnets)
> >
> > Is there a more efficient way to do this? I could of course flush the
> > set and rebuild it every time I need to update some part of it, but I
> > thought I'd ask before deciding to implement that.
>
> that's what swap is for - you don't mangle around live in a large ipset
>
> /usr/sbin/ipset -exist create IANA_RESERVED_IPV4_TMP hash:net maxelem
> 512 family inet
> /usr/sbin/ipset flush IANA_RESERVED_IPV4_TMP
>
> /usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 127.0.0.0/8
> /usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 10.0.0.0/8
> /usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 100.64.0.0/10
> /usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 169.254.0.0/16
> /usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 172.16.0.0/12
> /usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 192.0.0.0/24
> /usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 192.0.2.0/24
> /usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 192.168.0.0/16
> /usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 192.88.99.0/24
> /usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 198.18.0.0/15
> /usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 198.51.100.0/24
> /usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 203.0.113.0/24
> /usr/sbin/ipset add IANA_RESERVED_IPV4_TMP 240.0.0.0/4
>
> /usr/sbin/ipset swap IANA_RESERVED_IPV4_TMP IANA_RESERVED_IPV4
> /usr/sbin/ipset destroy IANA_RESERVED_IPV4_TMP
