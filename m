Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6819132C1E
	for <netfilter@vger.kernel.org>; Tue,  6 Feb 2024 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707221910; cv=none; b=ujDVBCeh5DBdAkr8QExWccP9ENYGQv0zjpV5jTYtZVQH0umFWlX/uCec7hlK5BWoizbIG5OfYLXi1Pq+lwbGgFYdj1T1Pl5kg7fUEHXLWNiTkKPFQO2qlNw00mluHi219iyPYFBU/CTOr9O+2bflshz6+Uw6Pxr6/a+1AQHSe50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707221910; c=relaxed/simple;
	bh=C2A4LTon73W8bxd1GrdpmsfxK0G4QO2kl6pfWjPV0Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVGvc5B4RPJBHvqm31DcLkXouEs1+OPrNJveYfxEa97eZkQX/EBYzc7QukPgYeBssKVsYWNf0Bu3dqKjq5OAFxSXtH3Okjj+j2VQJY9yZUy2xIHaeJ128NlXrM76TTLzEbmHs/ApTpz4sjI4057JXrjcOT8nzGGLaCROMHhK8dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1rXKPC-00023Z-1z; Tue, 06 Feb 2024 13:18:26 +0100
Date: Tue, 6 Feb 2024 13:18:26 +0100
From: Florian Westphal <fw@strlen.de>
To: Anton <anton.khazan@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: What happens if the machine runs out of memory while adding new
 nftables sets atomically?
Message-ID: <20240206121826.GH17626@breakpoint.cc>
References: <CAJE3=wmUcJ0E8nobG=T084XkiEK9UUgR4kyfLHk2enZOunH_1A@mail.gmail.com>
 <20240206111257.GE17626@breakpoint.cc>
 <CAJE3=w=rxa7DC7zP=uw0TFkp4kiSknSt6ALbnmDHx4_7JV7R9w@mail.gmail.com>
 <CAJE3=w=RDEGmT9Vd=y+BFEu5pKkYP4tPpH25+rWbpeDgWFpnWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJE3=w=RDEGmT9Vd=y+BFEu5pKkYP4tPpH25+rWbpeDgWFpnWw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Anton <anton.khazan@gmail.com> wrote:
> > Thank you. And a followup question: is new config guaranteed to be
> > removed if the operation runs into OOM?

Yes, all changes are backed out again.
