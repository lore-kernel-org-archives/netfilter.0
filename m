Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3646130E21
	for <netfilter@vger.kernel.org>; Tue,  6 Feb 2024 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707217982; cv=none; b=hPrD/yrK0VDbx77qP2XPKEo6J88KwKlb+ujdvlvip8RLmml+2tLvEZ19mycQirNtUp+j8xkORK7OvVdyQ6BprFj58IoTtroO1JUsd0R6OF0VodiCYQ7M7D8Frd93l2IKh6Uuliu7Bc6xIneA9eKoQ4GYgnrPlxuGZEqmrBni01A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707217982; c=relaxed/simple;
	bh=j9SYjj/+MaX3c7rj4zPoMs5EWoppsWOPdU3K8PU9FZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViGIyP3tQwoTyoQKaWY08ewcYskNFM/yQtPhOe8U25pj7tFyiu9h2BJR/u31yd5X3zc7j9Hxd9Cp/alLImQYjZwT4ZdIx3aj0hgjICwAvreHXgY7QEv05RCRPmh9PC5Egpv4i+54EaITBJ1syyeP3JYFHfDIMT1ZeUYIieb+QTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1rXJNp-0001W3-RR; Tue, 06 Feb 2024 12:12:57 +0100
Date: Tue, 6 Feb 2024 12:12:57 +0100
From: Florian Westphal <fw@strlen.de>
To: Anton <anton.khazan@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: What happens if the machine runs out of memory while adding new
 nftables sets atomically?
Message-ID: <20240206111257.GE17626@breakpoint.cc>
References: <CAJE3=wmUcJ0E8nobG=T084XkiEK9UUgR4kyfLHk2enZOunH_1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJE3=wmUcJ0E8nobG=T084XkiEK9UUgR4kyfLHk2enZOunH_1A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Anton <anton.khazan@gmail.com> wrote:
> To be on the safe side, currently my scripts add sets separately from
> adding rules and removing sets. I'd like to ask the devs, is it safe
> under these conditions to attempt performing all these actions in one
> atomic operation? Is previous firewall configuration guaranteed to be
> successfully restored if the operation runs into OOM?

Old config is removed after new transaction went through, not before.
