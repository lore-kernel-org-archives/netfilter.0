Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9082C1F2369
	for <netfilter@vger.kernel.org>; Thu, 20 Feb 2025 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740051186; cv=none; b=QCyoUD1fijXAMCAaIB/HqP2J0MxEZNqsmn3iZ/KgDTvVd4QrpWhHJv5BNUO74xTdCaG3KJwishsEsf6RUQfPyCUK/2iszF3lwo980icXRVkHh5v9iaQ41SXLqTMxnR6XbcZ7bAy9Krx+75h8NNX9kugjGxjrxPYYsVkbIh4Ih1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740051186; c=relaxed/simple;
	bh=rEjZX4gbwXw1R1nmtdJVsvHpCSSJ/mvwG5Hq1Mn1aoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QatCGEt7UGtON4EghPMbob6dOWUb/X7XwqeAmL2gDUdwY2RAvWu21n83Pe1nd6VHwU3l1GnJmpBPzcsxtUxwvLZ0OifcG/D8Xng5wqIDYB2pMRpp2ga+jfTfYZCFFIsDAtI2lxsuyNaE6VSNfLbMNq/sl34On2TJx1oSgApX1hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=OPi3adnE; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=f2vQYQIl; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="OPi3adnE";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="f2vQYQIl"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 5215A602AA; Thu, 20 Feb 2025 12:32:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1740051175;
	bh=XXfU2k99b4dg9Xf1+GZBERqQUV5Y7ledJAQcV6wQ8t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OPi3adnEA57oQYHjciP0XY8hP5lF0sfnALdTPp211n9qhcAKWTdddHWuUIXG39cnE
	 fIVuAOyrorTBssNAT4tzQfLbNe9Y1EWoz5jpPqpiqYMEJ2ynToZv9/i8+NqgACaWLt
	 FKsrZtvTtXFXtYRT5XItMkB76MKWP+3lU7RaoRiUaHEN6fK+fbqpQeRmtyDptL8Ksn
	 i/oNUjC73lWXoGEHusbu47LyzvbOp15rqEEV1xgKuw5T+bjg6t0KItAXgrv4ysY0J4
	 eZor6oeP16FHlDnvWJRRIFAczUaEtW/Kwfyaa9gNY/ran9pV2R8WH4RUP8PsBqNG1y
	 oRBZGLLXQc1bQ==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 8874160293;
	Thu, 20 Feb 2025 12:32:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1740051174;
	bh=XXfU2k99b4dg9Xf1+GZBERqQUV5Y7ledJAQcV6wQ8t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f2vQYQIlo88SOmINXCWl927mbjrl735MOobBHAjwGvh0HyiuMNsokYDp8eJb/k/MF
	 RsbKQ0+VuX1l9y861IPtIwnB9J8+Ehm524V9+cm8DXnr8GhIslJCdV9+pdaflHj7gS
	 3f94o/NVj7QWX1p1TAsw8nPil4f7qv1vY60+57IGZjkF0ClZXXVxTogo9Zvulp3hXK
	 xzSO6l76ovygWWxx2sngIPlWjtop7HTX/uK5obFbtpFhT6NDDfT+SUzVpCGyWgwpSr
	 lt4kPzRJoj7+FSvGAkF3ZeANy6o0RyJ7CoYt3VKAfSTMyrD0CIC5HRfNpE8UO8hKZA
	 M5IkE7ajPENYg==
Date: Thu, 20 Feb 2025 12:32:51 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Jeremy Sowden <jeremy@azazel.net>
Cc: Slavko <linux@slavino.sk>, Netfilter <netfilter@vger.kernel.org>
Subject: Re: Cannot browse SQL files in ulog2 git
Message-ID: <Z7cS40FiDa7WNdoB@calendula>
References: <468BFBD9-371E-46E5-9BEC-018B8C3F5D11@slavino.sk>
 <20250219230734.GB489148@celephais.dreamlands>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219230734.GB489148@celephais.dreamlands>

On Wed, Feb 19, 2025 at 11:07:34PM +0000, Jeremy Sowden wrote:
> On 2025-02-15, at 14:57:21 +0000, Slavko wrote:
> > i recently play with SQL in ulog2, it works, but i want to
> > read recent SQL examples in doc directory in web browser,
> > but i got 403 response, the same response provides the
> > wget tool::
> >
> >     wget -qSO- https://git.netfilter.org/ulogd2/plain/doc/mysql-ulogd2.sql
> >     Date: Sat, 15 Feb 2025 14:48:34 GMT
> >     ...
> >
> > The Makefile in this dir is readable...
> >
> > Please, is it really blocked or by some mistake?
> 
> Confirmed.  I get 403's for all the SQL files in that directory.  At a
> guess, mod_security is being overzealous.  If you use git to clone the
> repo, you will be able to read the SQL.

Let me take a look at this.
