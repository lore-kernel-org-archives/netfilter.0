Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8883C01
	for <netfilter@vger.kernel.org>; Sun, 17 Aug 2025 21:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755467347; cv=none; b=ohKovf0ohvWqoSQBTEBDc8KDzlm/Gu4ETaDXqjsnTxtkOKdly9BwB5UOWdcoFO/SAFqjiygnZIr6PhUV80oxunUw4t65ARkwVoLASpvzXGO64n8sLpwcnJiDVW3yYGJjc6YWXFHFpHadUC4XXk5PtexXbDngo92mwu+seJz+9EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755467347; c=relaxed/simple;
	bh=NLOldjB1EZfqS3xGn1A4uiybsvC5A2VeKBwNJC6vj2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkOZ6kNH1Or/GicfAQeMFxwOUDxdGioO7UcFD02ecTH6rBb3jDQg0b+zFDuuIDg+PHpAPyFCOxnq/VBzw7WHhRk6ylnAb8qCpGIevq7Xn5way0GzsoQQenLEMsCCz51VlSIht+Z9E282EB6G2UDvkfcbrUOAJhKZ4XNE93qrLb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=ka9Q7m0v; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=cD9nBQdP; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="ka9Q7m0v";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="cD9nBQdP"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 88A73602B1; Sun, 17 Aug 2025 23:49:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1755467342;
	bh=jqoiSnsbPUx76dfdFqpE/SXPLIvtdmZ5V54N4OJrThs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ka9Q7m0vHBHcP2RAg4P0obJW8lWHAypcKiO36VmexV5aqnKHo3lOsuLP02I5Jytxo
	 P4ftEco1aAB31hV+L25rl3ggDm45LT+p2dnUuvn9VuEz6m/otijasI9YKK72QaOxwl
	 8ejjnhtOtTFA+Jdl6tcZXPkoQBcQww9XCNxTZU6wRA2bMzoDAtW8/efhP9TWef1+b2
	 0BgJcr9KcW1EcnJ4twBfL46/SJr+9QwUMKVQOkX1mn6ALSC7bHZw2m50WN4j6tuExg
	 +r/5XDmTFtbu7D6SRvmDBhkfb1IlBHYxkXzNvVLr7gbkTKUlDpS/pGHTs/0dM+qkmu
	 4RZ8rEry6zeEA==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id C2F91602AF;
	Sun, 17 Aug 2025 23:49:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1755467341;
	bh=jqoiSnsbPUx76dfdFqpE/SXPLIvtdmZ5V54N4OJrThs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cD9nBQdPv2XDxiwLgLyAHCSpSX9QEOweU/CrHQCumJciydzRqJLDM0v+RX6a393SR
	 BW91MnWh+pf2fkUgeYiBG2rqhszIBwjh55MojU86kMXDmRREqcs9N+c50+BDTypY9a
	 P46/xhbQQkhNyd3LgGM24d5goLcH3DlI17+frzMxkwdVrpqUZ62OXSILuW7OujQm/U
	 znr00SyQp3xpNIu/Tj03QFdg1KQl+gDIGyKqH+LmImQwH3Bw29yPp9bMhaMDKgWl4S
	 pjZkfQ1tEM+jlCkc7xWtwugLfdlWe9S0VJFNFdn44KQA2kTaHSFKbTGvB2yrVRN6Lq
	 7+X5MRivUR93w==
Date: Sun, 17 Aug 2025 23:48:58 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: S Egbert <s.egbert@sbcglobal.net>
Cc: netfilter@vger.kernel.org
Subject: Re: 'nft' crashes.
Message-ID: <aKJOStEAQmkC8hPe@calendula>
References: <03c6f343-d5c5-45e9-bf8e-b04f703eb111.ref@sbcglobal.net>
 <03c6f343-d5c5-45e9-bf8e-b04f703eb111@sbcglobal.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <03c6f343-d5c5-45e9-bf8e-b04f703eb111@sbcglobal.net>

On Sat, Aug 16, 2025 at 09:09:02PM -0500, S Egbert wrote:
[...]
> Content of add-chain.tp.nft file is:
> 
> 
>     define MY_POLICY = deny
>     table T { chain C { policy $MY_POLICY; };};
> 
> 
> GDB-captured crash dump:

Fix:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20250817214706.314771-1-pablo@netfilter.org/
