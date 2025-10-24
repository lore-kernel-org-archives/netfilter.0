Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A921D7E5C
	for <netfilter@vger.kernel.org>; Fri, 24 Oct 2025 11:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761306317; cv=none; b=jpPZvk1Zm9Ex/AGR4l4ShbTcs+CISp7CjCWP+cxYVK0xbT8eT3BIOWI1BMZTfzprHERO+AbX+DQUrFAu49aylPo9wvOYejfMQjoRr6oHk8E+0z5vcW2182qsOYr6ii6FyJrRevPanIVCAnWQHM/J5v3b8jWZsGddT0jOq+STRBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761306317; c=relaxed/simple;
	bh=vl+btOXEGkrNIgLlXbjaO+dS/UJe6oIVh/W7CAGoaS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxfDAXH/dSlXLFW0/U+NkGdMM3hIee5yE6mdLoFS7pYdyc/NIRk9Me4J57EPpTeS/J+LpXRTBpWa6fBLy1WD+wYj4Q/scDAuqcu3KdlO6DL7u2YwB0//muMwB5vyqHtuwVYlZASuh2RNYdN1W0JCJb28j5AKstfh1CS8li5n2NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 40F90602CC; Fri, 24 Oct 2025 13:45:08 +0200 (CEST)
Date: Fri, 24 Oct 2025 13:45:07 +0200
From: Florian Westphal <fw@strlen.de>
To: louis.t42@caramail.com
Cc: netfilter@vger.kernel.org
Subject: Re: Nftables ct count over 2 counter continues to trigger with only
 1 connection
Message-ID: <aPtmw-suGrj2iLC9@strlen.de>
References: <trinity-85c72a88-d762-46c3-be97-36f10e5d9796-1761173693813@3c-app-mailcom-bs12>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-85c72a88-d762-46c3-be97-36f10e5d9796-1761173693813@3c-app-mailcom-bs12>

louis.t42@caramail.com <louis.t42@caramail.com> wrote:
> I have read the documentation and asked on Stack Exchange but am unable to find an answer to the following behavior.
> 
> Given this table and chain where 123.123.123.123 is my own address:
> 
> table ip mytable {
>         chain mychain {
>                 type filter hook input priority filter; policy accept;
>                 ip saddr != 123.123.123.123 drop
>                 ip saddr 123.123.123.123 ct count over 2 counter
>         }
> }

After looking at Fernandos analysis, does this work when you restrict
this to new packets, i.e.:

	ct state new jump {
		ip saddr != 123.123.123.123 drop
		ip saddr 123.123.123.123 ct count over 2 counter
	}

This is supposed to only ever add new connections and not re-add established
ones.
