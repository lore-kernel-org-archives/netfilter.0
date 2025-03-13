Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B15B262D35
	for <netfilter@vger.kernel.org>; Thu, 13 Mar 2025 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741856363; cv=none; b=TU49afRzb3zShaSsBpBGJ+yEVDzShQ5CCLe6DRi1bi+XS0vq9npwHRnRdNTbnrzJ5QC/4bnw9CiLYZktca9lL093uDR41zYcCDUSvOYX3V1Cb8i0L5hkKAU90YsZOHYdIejEvK9crxGkeyNXRXznXcJPtMPmcXLrh5btzH8XGMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741856363; c=relaxed/simple;
	bh=dr4koQRr0uq/8OR7Sd5tePNfcVptOKsmgvUWjL/hD2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cblpKyHnI1SG0sQuQ/qC9l1fJiS5tIhAW+bcVsRQ3Z5JBYp0TynXZ1M1EifYQ+rs4rtRxQhWZp02a+U6rrrGDN5fpr42y6hhAdtPAHueEHkKaNOFSscUJI1EuhC+GZIivT50hALwgRKpfkSYDJuOjWuoLbYCgOhDQIomq3MJhCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=fMCoGChO; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=fMpZwyCs; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="fMCoGChO";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="fMpZwyCs"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 6E074602A5; Thu, 13 Mar 2025 09:59:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741856354;
	bh=YSJP83lhJxuxyRKvy8YNJxRmOWvmqEY3QB6nnO6hBmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMCoGChOifteIxxcEGKtx1cnFu9hZ/2h4n36NJxRfl0p+kGqq+ltC9vSYhj27SzIa
	 VC50TkmeouTCIsBJgTneljqs6zb89dxLI5pwubcBdgQka25QT4ye0Jzr1jhrw8AewK
	 VOeiCn7LtGUBMxkMsDduy0W4E7JzzdpYfLCgTuiF2HiiN2yWAI+OHY+Mu9mD9Zoxku
	 A0QgxhuugNpaJ3TfUpKGP2MeVTtwpDJYFVaBM+hllXDEin6iehbhw6MoOlRAXIkLBZ
	 NKHSuBA9BmkBTgBWe43nzMnLakIHFlLc19gIVVhELxgJulobi7nHvUc10LiIfXOgXB
	 wpAomqUdyrZ4g==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 84D9D602A0;
	Thu, 13 Mar 2025 09:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741856353;
	bh=YSJP83lhJxuxyRKvy8YNJxRmOWvmqEY3QB6nnO6hBmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMpZwyCsgeUbg+ca/GvcYOaSXPCnzzJcD7lWl1F4lN8L+/wWiDKGkkO0JbHBVFr4r
	 6ZMQxbnubnbk33wGlyimO2b+1lFz8rPnNG3CxYU9VYyPXRAUaq+NGwr/3Er8rC4FES
	 xW/50Ji94WgPksQzAnOT7c1jo6+lReF7COGHmjtJ2hEKBb0/s3BHKKHAX3j6ULAF16
	 GtHpeJ8IhlGXGOuRZDmpKhrNn/0ilsj+2MXtDc3u/Q8qQMVfaHlx4qe1CqWl0WgP4u
	 dd2fSiAIUUcbJQQ4giA6MW0+epdzV3SpsP2V3PjoDZl1gGOrr6Lb2OLS5GLD+YCmhj
	 FOVpH9lA2TFyw==
Date: Thu, 13 Mar 2025 09:59:11 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Lars =?utf-8?Q?Nood=C3=A9n?= <lars.nooden@gmx.com>, f@calendula
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>
Subject: Re: Dynamically appending addresses to a named set
Message-ID: <Z9KeXyPhYJHsXFqg@calendula>
References: <6eec303a-752f-41e7-a903-37b3614d170b@gmx.com>
 <34c26829-a535-43b5-accd-884f4acd0614@app.fastmail.com>
 <Z9Hk8SsJwZArWo9C@calendula>
 <7773800a-a467-4821-8ee0-bab3bc001ab7@app.fastmail.com>
 <Z9IFgS-NOhJKUsFk@calendula>
 <cd939795-b632-4eba-9ff0-c003c4419ba0@gmx.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd939795-b632-4eba-9ff0-c003c4419ba0@gmx.com>

On Thu, Mar 13, 2025 at 06:31:03AM +0200, Lars Noodén wrote:
> Thanks.
> 
> On 3/12/25 21:44, Kerin Millar wrote:
> > I suspect that your set has been declared with the "interval" flag
> > in effect, in which case updates from the packet path are not
> > allowed. As far as I can tell, this constraint is undocumented.
> 
> Yes, it is the case that the interval flag has been set.  It seems that
> the interval flag necessary when the set shall contain a mixture of
> single IPv4 addresses and subnets with elements:
> 
> 	"Error: You must add 'flags interval' to your
> 	 set declaration if you want to add prefix elements"
> 
> and with auto-merge:
> 
> 	"Error: auto-merge only works with interval sets"
> 
> It is necessary to have auto-merge since the individual IPv4 addresses
> and subnets get added in an unpredictable manner and may overlap.
> 
> On 3/13/25 00:06, Pablo Neira Ayuso wrote:
> > The ruleset above provides sufficient context to infer that the
> > dynamic flag is needed, but that might not be the case in all
> > circunstances. The dynamic flag cannot be inferred in all cases like
> > the one above.
> > 
> > Without Lars' set declaration, the question is incomplete and it is
> > not easy to answer.
> 
> The following is basically the set up:
> 
> table ip foo {
>         set bar {
>                 type ipv4_addr
>                 flags interval
>                 auto-merge
>                 elements = { 192.168.2.0/24 }
>         }
> 	chain input {}
> }
> 
> The two important parts to retain are auto-merge and pre-defined
> elements (and be able to add to the elements later).

which together with your previous rule means that:

# nft add rule foo input tcp dport 22 counter add @bar { ip saddr }
Error: Could not process rule: Operation not supported
add rule foo input tcp dport 22 counter add @bar { ip saddr }
                                        ^^^^^^^^^^^^^^^^^^^^^

reports EOPNOTSUP because interval sets do not currently support
updates from the packet path.
