Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3145E1E1027
	for <netfilter@vger.kernel.org>; Thu, 10 Oct 2024 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595148; cv=none; b=a+2W3Ftby4XBL11C8Wvw8mGOpdZe6ApHaNSFylWaPe2iCUgPB7/nqv2x6BqLt0HBbZYEdZN2Cf6MaD0h5lqwfDcAQCk0Ijs5hW/psAEo92QGe2/ArG27KLwcXsXmHfwFUZ9onJmjOhntEXH3BlSLGPnwUwWhxi9s5I6w5XPvG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595148; c=relaxed/simple;
	bh=WFeDF5LOa16gfvnoM5Z+PMFcO/kcYdF3AARBZpsKwt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5IlNsNMagNYJN3rzqKf3NNTTDH6O44t9nu6Rhcbulpn+I5mNBY1gGos4HbZQ7mSNShe+JD7kjrsJH4IudyQi+7KNbUBbW8w08ZpHIhBCebaQYcZDP7QQlzRCWzIREweOpILtjy80+8lhl9cPPty5jdtaVlKrjE+5Uq6Zmd+m/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=59080 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1sz0Yn-00Ei5p-Tk; Thu, 10 Oct 2024 23:19:04 +0200
Date: Thu, 10 Oct 2024 23:19:01 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Graham Bartlett <graham.ietf@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: issues when trying to inspect payload > 250 bytes
Message-ID: <ZwhExf0oNL3llaSv@calendula>
References: <CAO4D2DPQhOPVQXNxgyJBRetFsgFwUj3JGnfa28cnep2MOybb=Q@mail.gmail.com>
 <Zwg_DT7ADPBWir_A@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zwg_DT7ADPBWir_A@calendula>
X-Spam-Score: -1.9 (-)

On Thu, Oct 10, 2024 at 10:54:37PM +0200, Pablo Neira Ayuso wrote:
> Hi,
> 
> On Wed, Oct 09, 2024 at 09:01:57PM +0100, Graham Bartlett wrote:
> > Hi
> > 
> > I seem to be hitting a limit when inspecting past approx 258 bytes
> > using @ih, 2064 16 0x2222.
> > 
> > This returns the error 'Could not process rule: Numerical result out of range'
> > 
> > I'm guessing that there's a hard limit on inspecting past 250 bytes
> > and wondered if anyone knows of any way that I can increase this ?
> 
> Did you already file a bugzilla ticket for this, right?

Oh, actually someone else...

https://bugzilla.netfilter.org/show_bug.cgi?id=1775

so there is a record on this issue already.

Thanks
