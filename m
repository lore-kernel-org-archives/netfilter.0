Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE9F800
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 22:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741817231; cv=none; b=X6zB99GRGVGbX7zxJNUS+cvB9vmrnowRY/9aebaIGVvA5J4vJLarhsBnrJwnS/UUF/a4Wy/Esbus31Q3kXKTcJyYnOYTRhAuqv1euOlLXgh3tIfxGaL6jl5b4gx3kbJnjXat5KzaQG7ogRR87otE/PCB7wm+9viSX/MCbOfeN6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741817231; c=relaxed/simple;
	bh=ytPnLYoUxlyo+5qzBQSUT5PaZ41CKuxYIQcSksjgcIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7Vff4dNJq/uSIYGrLBF3x82WCrdStE5MUp5nEkRrNL66kLN0Vu0cOqlnDotmyJHL6ef6OIMCvZ3jfe8uMGCZg3zzbg0iFmh06/zXAhYy1BIN8GmiquyIKG+jeIJ/ogpmkNbUs1135IkM3ObJ18ojI4E5LK0x8xNqDN4nT2Daag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=aItuAbkm; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=L8VBigVY; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="aItuAbkm";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="L8VBigVY"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 000CB6028B; Wed, 12 Mar 2025 23:07:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741817221;
	bh=2LtQFo11BMLcPZQkXpRu1o6EEJb7yXcQ/LPF5awacgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aItuAbkmOrjlKsIZzs7E2H4cbnctpAGbkghdfDt+15fLNVrmndFwFd3xFO3aRwnWU
	 5Jl3+bYCUM2UXCVOq8fGIf4gyYbkK98FBctiHACzTHFH3s9v8g1dhYnKlIKfIhoyVM
	 bL+ppkFI3+IAOmRQU1AWzIRf2Rid+d0bUmvBiYqhh2ip1n6EEKeKaODTO7G1T1wXeI
	 3ohAZ7CvThD/kCTshw9WLozXZDJqwO75gELaz16UALq2cZUpk9BBQowDS3WkkYeNPd
	 HOQ+lDriZ+ajHuSpPEav1UfsCT/SweLYejz+jTx+3VgqHvqdhPs5Nq7TTFZK91hS4R
	 o3FH4cN/BRxLg==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id EF28560279;
	Wed, 12 Mar 2025 23:06:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741817220;
	bh=2LtQFo11BMLcPZQkXpRu1o6EEJb7yXcQ/LPF5awacgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8VBigVYgoBQHXvLoDA8P8ICHXgjosx/8ebrbDdNE4u1nwvCcYcOJ9F0YkrFb9ZJv
	 GjmCfTfZ7IjbDbul6DVOftU9j0FFQOKb6Y/WU1kWHnwVydLU3Jzx/q3aoZgfLeIQGG
	 h+M+SGHYxWdB39yCgW9NbzaheFU147D+XzceO+dw7UsDq1vZHtT8ZL0RkQeXQvOxTK
	 h2NretLQXE23N2C2GfMDSttAYZRdIM/gcN28ZldKVs8PzEfGWkkYVCHr/NF8PaOMt0
	 w5GygEqGxjC4Gl4TrkKrt7szIR+bJ0324AKs+OajQW5U3kpcgZbIkEura9RfN6tNWX
	 ivs/F/TF8y3ig==
Date: Wed, 12 Mar 2025 23:06:57 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: Lars =?utf-8?Q?Nood=C3=A9n?= <lars.nooden@gmx.com>,
	Linux Netfilter Users List <netfilter@vger.kernel.org>
Subject: Re: Dynamically appending addresses to a named set
Message-ID: <Z9IFgS-NOhJKUsFk@calendula>
References: <6eec303a-752f-41e7-a903-37b3614d170b@gmx.com>
 <34c26829-a535-43b5-accd-884f4acd0614@app.fastmail.com>
 <Z9Hk8SsJwZArWo9C@calendula>
 <7773800a-a467-4821-8ee0-bab3bc001ab7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7773800a-a467-4821-8ee0-bab3bc001ab7@app.fastmail.com>

On Wed, Mar 12, 2025 at 09:50:20PM +0000, Kerin Millar wrote:
> On Wed, 12 Mar 2025, at 7:48 PM, Pablo Neira Ayuso wrote:
> > On Wed, Mar 12, 2025 at 07:44:25PM +0000, Kerin Millar wrote:
> >> On Wed, 12 Mar 2025, at 4:08 PM, Lars Noodén wrote:
> >> > Hello,
> >> >
> >> > In NFTables, I have created a named set called 'bar' in the chain input
> >> > in the table foo.  I can add elements to the set manually,
> >> >
> >> > # nft add element ip foo bar { 192.168.2.2 }
> >> >
> >> > However, I am not able to guess the syntax to have a regular NFTables
> >> > rule do the appending automatically.  I've tried a lot of permutations
> >> > of the following, but always with fatal errors,
> >> >
> >> > # nft add rule foo input tcp dport 22 counter add @bar { ip saddr }
> >> > Error: Could not process rule: Operation not supported
> >> > add rule foo input tcp dport 22 counter add @bar { ip saddr }
> >> 
> >> For the kernel to raise ENOTSUP does not indicate an error of syntax. The bytecode intended for the nftables VM will already have been compiled at this point.
> >> 
> >> I suspect that your set has been declared with the "interval" flag in effect, in which case updates from the packet path are not allowed. As far as I can tell, this constraint is undocumented.
> >
> > Maybe Lars forgot to set on the flags dynamic;
> 
> Not to go off on a tangent but that was my initial thought. Yet, neglecting to specify the "dynamic" flag does not seem able to cause the error that Lars describes.
> 
> # cat test.nft
> flush ruleset
> table ip foo {
>         set bar { type ipv4_addr; }
>         chain input {}
> }
> # nft -f test.nft
> # nft 'add rule foo input tcp dport 22 counter add @bar { ip saddr }'; echo "$?"
> 0

If you list the ruleset above, the dynamic flag shows up.

> That's with nftables v1.1.1 and Linux 6.12.13. Ultimately, the set becomes a dynamic one, even though it was not declared to that effect. I find it surprising because:
> 
> - the behaviour of the implementation directly contradicts the manual
> - it seems difficult to fathom, predict and explain the behaviour
> - it casts doubt on the purpose of the flag (where is it even useful to declare it?)
> 
> I wonder, also, how nft(8) can possibly be assured of my intent in a situation such as this. Imagine a scenario in which the admin adjusts a set so as to be non-dynamic and forgets to remove a rule that updates from the packet path prior to reloading a ruleset. Could it not simply abort upon encountering the rule and require for the admin to resolve the innate contradiction?
>
> Or, is "dynamic" destined to become a historical artifact and be retained only for the purposes of backwards-compatibility?

The ruleset above provides sufficient context to infer that the
dynamic flag is needed, but that might not be the case in all
circunstances. The dynamic flag cannot be inferred in all cases like
the one above.

Without Lars' set declaration, the question is incomplete and it is
not easy to answer.
