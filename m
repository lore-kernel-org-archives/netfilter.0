Received: from mx.0x1.digital (mx.0x1.digital [80.240.22.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D012DAFDB
	for <netfilter@vger.kernel.org>; Sat, 27 Sep 2025 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.240.22.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758969759; cv=none; b=fj3+8vXi5dsQmZmNccGBP83ZCl0PEFuaba0q/kn2MZ1YRGBFYDbY2zp3qsxd9cd1Li85BLpMh12lScgy3/kbiEjX4mnOptZTFgOS/KTWEuIAqox1N4/kxEe6cGjCOOnkQUuF8KL6xT7aUh38z03yUxA2pReVNNg2s0r22erkfUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758969759; c=relaxed/simple;
	bh=zXYbilN0cAgc1W36CF9sVq4MfNtHSGM4Ct5El9amH34=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Disposition; b=hT2b9RauXSrkQeNQj2klXgiyBRsqRfzgK91UkirNTgw3nhkg9/Ew5poMsYuk1mkwd+OVZJvr2hv0rl0TF8mvxi3rhKlH9I3m8cLkVNjQ3O+XtGinwcWvM2gKJCGAcgvUizafPa7VoIAgnD8H/ul2RzeKX1AY5gr8b3vHuliX84U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0x1.digital; spf=pass smtp.mailfrom=0x1.digital; dkim=pass (2048-bit key) header.d=0x1.digital header.i=@0x1.digital header.b=LnxYtulC; dkim=pass (2048-bit key) header.d=0x1.digital header.i=@0x1.digital header.b=LnxYtulC; arc=none smtp.client-ip=80.240.22.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0x1.digital
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x1.digital
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0x1.digital header.i=@0x1.digital header.b="LnxYtulC";
	dkim=pass (2048-bit key) header.d=0x1.digital header.i=@0x1.digital header.b="LnxYtulC"
Received: from localhost (mx.0x1.digital [127.0.0.1])
	by mx.0x1.digital (Postfix) with ESMTP id A414A17BDAB;
	Sat, 27 Sep 2025 12:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.0x1.digital A414A17BDAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x1.digital;
	s=20220330; t=1758969754;
	bh=CutZumDhJVRiLFUUpk5D1Gc6ukEVZfRFwBHMR4B9kQ4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=LnxYtulCXuRmP15aA/2gUlm1SzWBtCcXsAZRrgf5HnRkfDXEFoSxQgmplZaodONg0
	 0WeNSuLfFTh4gkSNQSvzG3L7gpS8chDRmGfvyiv7d1PHts1SyDGP5Fz/yHRqJMS9IS
	 BFB5C3NCHl8qVRJeyx2Bk+yxRa2fGh5A4dw18vt/haOR+uqDnZO4WJ61ntVpjSUPTl
	 al5lWa+vGG9Cavnpn8ebH7/rklmAFbVkCO2fsSFv7UbLxpeKpx0g7rcm2KYLtVSGLp
	 nWL7Q330HFnp+mwRqMdinoyKjQmjzsbhH2Z07waHJZg0KMYdMBWME+eEovB5INMO2g
	 sy3nsmc2g4wqg==
X-Virus-Scanned: amavis at 0x1.digital
Received: from mx.0x1.digital ([127.0.0.1])
 by localhost (mx.0x1.digital [127.0.0.1]) (amavis, port 10026) with ESMTP
 id D-2qW9jSF-Lx; Sat, 27 Sep 2025 12:42:34 +0200 (CEST)
Received: from CHAOS.local (84-115-220-193.cable.dynamic.surfer.at [84.115.220.193])
	by mx.0x1.digital (Postfix) with ESMTPSA id 6303C17BDAA;
	Sat, 27 Sep 2025 10:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.0x1.digital 6303C17BDAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x1.digital;
	s=20220330; t=1758969754;
	bh=CutZumDhJVRiLFUUpk5D1Gc6ukEVZfRFwBHMR4B9kQ4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=LnxYtulCXuRmP15aA/2gUlm1SzWBtCcXsAZRrgf5HnRkfDXEFoSxQgmplZaodONg0
	 0WeNSuLfFTh4gkSNQSvzG3L7gpS8chDRmGfvyiv7d1PHts1SyDGP5Fz/yHRqJMS9IS
	 BFB5C3NCHl8qVRJeyx2Bk+yxRa2fGh5A4dw18vt/haOR+uqDnZO4WJ61ntVpjSUPTl
	 al5lWa+vGG9Cavnpn8ebH7/rklmAFbVkCO2fsSFv7UbLxpeKpx0g7rcm2KYLtVSGLp
	 nWL7Q330HFnp+mwRqMdinoyKjQmjzsbhH2Z07waHJZg0KMYdMBWME+eEovB5INMO2g
	 sy3nsmc2g4wqg==
Date: Sat, 27 Sep 2025 12:42:33 +0200
From: =?utf-8?Q?0x1_=7C_nftables?= <dvx4jwe2kewld@0x1.digital>
To: Kerin Millar <kfm@plushkava.net>
Cc: "=?utf-8?Q?netfilter=40vger.kernel.org?=" <netfilter@vger.kernel.org>
Message-ID: <8902E14F-5A51-4455-B40A-AA8B4F97BED3@getmailspring.com>
In-Reply-To: <3a8cc7e8-febf-4b28-ac22-ad03f936e879@app.fastmail.com>
References: <3a8cc7e8-febf-4b28-ac22-ad03f936e879@app.fastmail.com>
Subject: Re: list elements of set
X-Mailer: Mailspring
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thank you for response and deeper insight.

the following command seems to work:

sudo nft 'list set basetable mx_bans_cidr'

output:

table ip basetable {
	set mx_bans_cidr {
		type ipv4_addr
		flags interval
		counter
		auto-merge
		elements = { 1.1.1.0/24 counter packets 0 bytes 0, 2.2.2.0/24 counter
packets 0 bytes 0, etc ...
}



The output is a bit "verbose". Is it possible to retrieve only the
ip/cidr elements without the "table ip basetable { ... " 
lines?

I still have to use cut, sed or awk to retrieve the ip ranges only.

Ideally I would only get:

1.1.1.0/24
2.2.2.0/24
.
.
.


But anyway, you answer got me closer to the expected result. :)
Thank you,
have a great weekend.




On Sep 27 2025, at 11:39 am, Kerin Millar <kfm@plushkava.net> wrote:

> On Sat, 27 Sep 2025, at 9:06 AM, 0x1 | nftables wrote:
>> Hello everyone,
>> 
>> I would like to list all ipv4 elements of a named set. 
>> 
>> the set is named
>> 
>> mx_bans_cidr
> 
> This does not show the table in which the set resides, nor the address
> family associated with the table (which can be "ip", "ip6" or "inet").
> It is the combination of these two things that qualifies any given table.
> 
>> 
>> the command i used:
>> 
>> sudo nft list set ip filter mx_bans_cidr
>> 
>> Error: No such file or directory
>> list set ip filter mx_bans_cidr
> 
> The command is valid. It's simply stating that there is no set named
> "mx_bans_cidr" in the "ip filter" table. You might even not have a
> table named "ip filter" at all.
> 
>> 
>> 
>> I followed the description from this page
>> 
>> https://wiki.nftables.org/wiki-nftables/index.php/Sets#Listing_named_sets
>> 
>> 
>> The query for element in a set is also not working.
>> 
>> I tried all kind of versions of the command, one that surprised me was:
>> 
>> 
>> sudo nft get element ip basetable filter mx_bans_cidr { *.*.*.* }
> 
> Here, you specify a family of "ip" and a name of "basetable". But you
> also follow it with "filter", which doesn't make any sense. A table
> cannot have two names. Presumably, "ip basetable" would be correct in
> your case.
> 
> # nft 'list set ip basetable mx_bans_cidr'
> 
> If you have any doubt as to the naming of your tables, you could try
> listing all sets without their contents initially.
> 
> # nft -t 'list sets'
> 
>> 
>> Error: syntax error, unexpected string, expecting '{' or '$'
>> get element ip basetable filter mx_bans_cidr { somefile-x.x.x.tar.gz
>> someotherfile-y.y.y.tar.gz }
>> 
>> Those are 2 files, that contain 4 dots in the filename, in the working
>> directory ?!
> 
> Indeed. That's your shell performing pathname expansion in accordance
> with the Shell Command Language specification. This is why I always
> recommend that nft(8) commands be conveyed as a single word through
> the use of quoting, if issuing them from a shell. For example:
> 
> # nft 'list set ip basetable mx_bans_cidr'
> 
> Everything between the single quotes will be taken literally and
> passed along to nft(8) as a single argument. No pathname expansion is
> possible then.
> 
> I wrote some material for the wiki that also touches upon the use of
> the shell. See https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Syntactic_conventions.
> 
> -- 
> Kerin Millar
> 
