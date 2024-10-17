Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF17A137C35
	for <netfilter@vger.kernel.org>; Thu, 17 Oct 2024 22:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729203044; cv=none; b=LMNGEjxGFoUgu1PdUdUEQc8n3VvkjPnNvotyc8hhGDcIVU8dJ0BEz6fi/e8uYbt8no2I2mR5ewtLGHsdAYaCfE6FG9Ij13qdx4CR7HcVs2SMFFUnkJjG71u/b3W8ZullEhlOL+cnYgxRMPMOkUVW5d2YEqX1vk/uioPOXOyI1W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729203044; c=relaxed/simple;
	bh=o7EuDbQBAIjE5kUYzXM7T2tsM0tQHOyuDVs6jIjPxOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHLIco3t28fqxyohdGEPyUUfap9GmH2tEcvojoIGgKDHcCs9fwMGFNZBqdI+M7dGOuMhcNYs665ZExDYH+HV1YOn8W/uTOFTJDUWvZTG487IhhplxoIa+edbuwCH/vjh15+CF4utfR3lzQTQYrISoQA/L3YkfY7Po4tlW8yoSxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oo1rqiVk; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oo1rqiVk"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a3b0247d67so5627655ab.3
        for <netfilter@vger.kernel.org>; Thu, 17 Oct 2024 15:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729203039; x=1729807839; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PWxBK1XcV3/yVaL8sBBH7TCNw4TJrFOXLtdXagQkvaY=;
        b=Oo1rqiVkFM9CHINKXE/h2qNU3p/U/8aPWbzMIXRpIRiD2MEIHV0StI0PPf6T7iRFnX
         TIYkS9nia8sDULiNTF/naWLfpRNgwt25j90dTsd4WjjqHUItfMxC+DGgLDCCwgmFkwCb
         Ett34DNcAeo7khsw7fwPamayZbhOtWLxKNkF/tCrxVImJNwZAU0yC3i/jzej46FBqXnk
         3MqbcOpyuCZC6CdHeOligZEivZJ/cepBX032iFkDZepejN1VWiIyUknF0XAbQwhgb1RO
         I95d9WhoXNFrkyaLEzCjLm/hdRn0MAkBCF2NEqpcLXtAxubvjdcxl9AXWDtM7LZ86geL
         6j4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729203039; x=1729807839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWxBK1XcV3/yVaL8sBBH7TCNw4TJrFOXLtdXagQkvaY=;
        b=lv6XBW8oflk9DeViM2HBfnH0U+d/3hu24wtuciEf8ltu0mtfwmPQebSoXNOSLuzTfV
         xgq8iR2nJZiWNRKmiGZ9Mk3X+tYIDrWc383OR6xCv7zres2AYAjxqI2u48/FTT5FiUMm
         pG2iNEM/CTCxIyLFuhyUztRt6uwjGEnxYcvPNKunT6QiOXxHrvRxnkVkyFHBaTRrJdCp
         L/tUQQY777O02mzgaSVGUCxyDasM6V2BJ4SPD6yvuFPCHtJpKm/QpxOGwbBE1gB3C/Kl
         wvTJHc4tYWnpE3wq+q+thrgl0sGJ38pj+juMGSa2PsmiRFJfQHzYqNWpbQ0XuU2ITOhX
         4StA==
X-Forwarded-Encrypted: i=1; AJvYcCVNsWe49AycBDBbkV456BiWzZxYaqsywWDI7ZIEAbtbCRpQ4g9yvBYg+CDrlAwBR+uO4AZ1Pmiyynk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4pvp5geo2icNyxxqBnBKs/NFF1BC9aBfxYLSRf9PX6BNGL85z
	7kQqERdhrFqhS0+QM0RRdW0+9tH1NyQzhd9hE/bbTR0/ZAyuSLhSF6BO5ldxbN1b802Bar/u2AC
	X9o18icPntcFerANzMkYsuUTzU05e4GKQQodcyQ==
X-Google-Smtp-Source: AGHT+IGJNt7uHTigXZcJWZCIbehmdRG8XxNn3Cdmt0VRKQX0UnG7afgFQ276yoLSk82giBa7y5W0B/H29wZ7ZVQ816Q=
X-Received: by 2002:a05:6e02:1a2a:b0:3a0:9aef:4c2 with SMTP id
 e9e14a558f8ab-3a3f40a7912mr2866205ab.19.1729203038863; Thu, 17 Oct 2024
 15:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc> <ZxE8-pDn9Alzm50K@calendula>
In-Reply-To: <ZxE8-pDn9Alzm50K@calendula>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Thu, 17 Oct 2024 23:10:02 +0100
Message-ID: <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
Subject: Re: Most optimal method to dump UDP conntrack entries
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Oct 2024 at 17:36, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Thu, Oct 17, 2024 at 02:46:32PM +0200, Florian Westphal wrote:
> > Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > > In the context of Kubernetes, when DNATing entries for UDP Services,
> > > we need to deal with some edge cases where some UDP entries are left
> > > orphaned but blackhole the traffic to the new endpoints.
> > >
> > > At high level, the scenario is:
> > > - Client IP_A sends UDP traffic to VirtualIP IP_B --> Kubernetes
> > > Translates this to Endpoint IP_C
> > > - Endpoint IP_C is replaced by Endpoint IP_D, but since Client IP_A
> > > does not stop sending traffic, the conntrack entry IP_A IP_B --> IP_C
> > > takes precedence and is being renewed, so traffic is not sent to the
> > > new Endpoint IP_D and is lost.
> > >
> > > To solve this problem, we have some heuristics to detect those
> > > scenarios when the endpoints change and flush the conntrack entries,
> > > however, since this is event based, if we lost the event that
> > > triggered the problem or something happens that fails to clean up the
> > > entry,  the user need to manually flush the entries.
> > >
> > > We are implementing a new approach to solve this, we list all the UDP
> > > conntrack entries using netlink, compare against the existing
> > > programmed nftables/iptables rules, and flush the ones we know are
> > > stale.
> > >
> > > During the implementation review, the question [1] this raises is, how
> > > impactful is it to dump all the conntrack entries each time we program
> > > the iptables/nftables rules (this can be every 1s on nodes with a lot
> > > of entries)?
> > > Is this approach completely safe?
> > > Should we try to read from procfs instead?
> >
> > Walking all conntrack entries in 1s intervals is going to be slow, no
> > matter the chosen interface.  Even doing the filtering in the kernel to
> > not dump all entries but only those that match udp/port/ip criteria is
> > not going to change it.

We are not worried about being slow in the order of seconds, the
system is eventually consistent so there can always be a reasonable
latency.
Since we only care about UDP, losing packets during that period is not
desirable but is assumable.
My main concern is if constantly dumping all the entries via netlink
can cause any issue or increase resources consumption.

> >
> > Also both proc and netlink dumps can miss entries (albeit its rare),
> > if parallel insertions/deletes happen (which is normal on busy system).
> >

That is one of the reasons we want to implement this reconcile loop,
so it can be resilient to this kind of errors, we keep the state on
the API in the control plane, so we can always rebuild the state in
the dataplane (recreating nftables rules and delete conntrack entries
that does not match the current state)

> > I wonder why the appropriate delete requests cannot be done when the
> > mapping is altered, I mean, you must have some code that issues
> > either iptables -t nat -D ... or nft delete element ... or similar.
> >
> > If you do that, why not also fire off the conntrack -D request
> > afterwards?  Or are these publish/withdraw so frequent that this
> > doesn't matter compared to poll based approach?
> >
> > Something like
> >    conntrack -D --protonum 17 --orig-dst $vserver --orig-port-dst 53 --reply-src $rserver --reply-port-src 5353
> >
> > would zap everything to $rserver mapped to $vserver from client point of view.
>

This is how it is implemented today and it works, but it does not
handle process restarts per example, or is not resilient to errors.
The implementation is also much more complex because we need to
implement all the possible edge cases that can leave stale entries


> This reminds me, it would be good to expand conntrack utility to use
> the new kernel API to filter from kernel + delete.
>
> I will try to get here.

I should bring more of these problems to the mailing list :-)
