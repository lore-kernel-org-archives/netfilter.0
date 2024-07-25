Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4FA4690
	for <netfilter@vger.kernel.org>; Thu, 25 Jul 2024 02:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721873957; cv=none; b=R2UdXuwYpiBd1TR8tcUuLR4S8h6eY+DHXRJu8xlgUagQX4n++zfdeOavV9JzkN/PfyrSYoZd06BNllidA9sbr/ZAhLeHP5Q4d6uys9IiMqxlj8SMzCgLLNRXWqQYBypoXLtchgrT2WwBZogo4auIReOlIdldomI5zl1taB0B8Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721873957; c=relaxed/simple;
	bh=IuYeLkfnMYPeV/mBIHEmf9tdkcCrr/qcQ0+SpG+TSNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQZsG3GufoE9LdB9V4t2A/23PBBEeZ5wM/5fqxL4OC+M3WrSmhPt34M+Khd9sCu7JEMHcevsvoPQjYD0FezmDPNlZHi4mGweYhB+VNcip8UFDdxs4NSyEJPC/6NhHVyYlTf6Sy7XcaPuIcou23cX8+dCuoWo8DOgE7HD6TJX9as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1sWo4O-0003Ud-UE; Thu, 25 Jul 2024 04:19:04 +0200
Date: Thu, 25 Jul 2024 04:19:04 +0200
From: Florian Westphal <fw@strlen.de>
To: Tom Isaacson <thomas.isaacson@motorolasolutions.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Unknown option "--to-ports"
Message-ID: <20240725021904.GA13051@breakpoint.cc>
References: <CAMp_5HbpSmy4G0-Aty9dD4FnwvvNU-iQfTtzYhysQSiL6jbA1g@mail.gmail.com>
 <CAMp_5Ha4HGLqkWAA=syC3+U0M3xxq3OuN9b_WvYNc9dV=CvzDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMp_5Ha4HGLqkWAA=syC3+U0M3xxq3OuN9b_WvYNc9dV=CvzDg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Tom Isaacson <thomas.isaacson@motorolasolutions.com> wrote:
> >     Sharing Internet using method: nat
> >     iptables v1.8.7 (legacy): unknown option "--to-ports"
> >     Try `iptables -h' or 'iptables --help' for more information.
> >     Doing cleanup.. done

Broken iptables installation.

> > The offending iptables commands are:
> >             iptables -w -t nat -D PREROUTING -s ${GATEWAY%.*}.0/24 -d
> > ${GATEWAY} \
> >                 -p tcp -m tcp --dport 53 -j REDIRECT --to-ports $DNS_PORT
> >             iptables -w -t nat -D PREROUTING -s ${GATEWAY%.*}.0/24 -d
> > ${GATEWAY} \
> >                 -p udp -m udp --dport 53 -j REDIRECT --to-ports $DNS_PORT
> >
> > I searched around for a solution and found
> > https://community.unix.com/t/iptables-v1-8-7-nf-tables-unknown-option-to-ports/385377/3

This has all diagnostic commands that you'll need to figure out whats
happening.

> > but this command also fails:
> >     # iptables -A OUTPUT -m owner --uid 0
> >     iptables v1.8.7 (legacy): Couldn't load match `owner':No such file
> > or directory
> >
> > iptables links to xtables-legacy-multi but it seems to have all of the
> > necessary files present.

iptables says it can't load match 'owner' (libxt_owner.so).

So its either missing or iptables is searching the wrong location.

strace should tell which directory iptables is searching to fetch
extensions.

Some embedded distros split packages into subpackages to save space,
so it might be missing package too.
