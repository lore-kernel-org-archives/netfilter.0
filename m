Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693C75DF05
	for <netfilter@vger.kernel.org>; Wed,  6 Mar 2024 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709718046; cv=none; b=SbPabQxVVLzZRsl82y5ROEUD32qR0/oyScy70zIJyWMRwJZ0iYSUukxDgwGWGiHpKgaaaaa1LiOa+JvSqeyUjrTsfM+SRXba1LHTAwx0kucZUGeX2NKKDGd1jFESStcA9KcoH4m+T1ScM89vPrHoHR6rKJ8dxkCSJLewcKSC31U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709718046; c=relaxed/simple;
	bh=Sn0TyTF7YvJW4ATHx5o81Ry3VaCS2bA01MhGZHCnYUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzzJUIcQuX06+tNf8DAzvhd9/NNFD55QfrTG/99JWyM12FsFVn7WTLDAVokVfvT3fW6raVl/Ct2tpRZ4XKHdAJAwsfuOx5EnWfyu6Slia5KiZVqykEiECWn1+EOusJpFkHZ3eJ8m3q9PnTebsRL2z7ez/lXdKyFnecBfpSbC8gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1rhnlS-0005QI-Nb; Wed, 06 Mar 2024 10:40:42 +0100
Date: Wed, 6 Mar 2024 10:40:42 +0100
From: Florian Westphal <fw@strlen.de>
To: Sreedhar M <sreemtech@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nft socket module
Message-ID: <20240306094042.GB4420@breakpoint.cc>
References: <CANvpR2AsqNG7zXsZyw2ONxTH65WDCfEMAEDSt4mJGSuZXmZOZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANvpR2AsqNG7zXsZyw2ONxTH65WDCfEMAEDSt4mJGSuZXmZOZQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Sreedhar M <sreemtech@gmail.com> wrote:
> Hello
> I have some issues with nft socket module , please find this  , I cant
> get the socket functionality on nft that I was using iptables, could
> you please advise
> 
> iptables-translate -t mangle -A qrms0-pre -p tcp -m socket -j MARK --or-mark 0x1
> nft # -t mangle -A qrms0-pre -p tcp -m socket -j MARK --or-mark 0x1

Translation was missing.

Try:
nft 'add rule ip mangle qrms0-pre ip protocol tcp socket wildcard 0 counter meta mark set mark or 0x1'
