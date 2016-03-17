From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.29 released
Date: Thu, 17 Mar 2016 14:00:52 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1603171357330.17324@blackhole.kfki.hu>
References: <alpine.DEB.2.10.1603162136130.7414@blackhole.kfki.hu> <56EA4462.6010106@fastest.cc>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	blackhole.kfki.hu; h=mime-version:user-agent:references
	:message-id:in-reply-to:from:from:date:date:received:received
	:received; s=20151130; t=1458219601; x=1460034002; bh=vQdyfr07Y1
	Du2acr087ntKZti48EUdROxJ18hJ3ehOM=; b=FfOVWLFEz0G+b1ivwSjUcVCDIR
	aFlBmBABZ1n/77y2fhafIvocq3xLG6pYPXWZvEm/KQmb5cW8Uwd+c6Xtc5zgSWhF
	vbQp07KNy5zEfs2R8AM1DwpQdTN1RK7LelGysrBwalVrJujMgOaNQbJqaUeNkiXl
	UtdUaa6eI5F9YBG+o=
In-Reply-To: <56EA4462.6010106@fastest.cc>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: AllKind <AllKind@fastest.cc>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Thu, 17 Mar 2016, AllKind wrote:

> On 16.03.2016 21:40, Jozsef Kadlecsik wrote:
> > 
> > ipset 6.29 is released, because the configure script was broken and a
> > race condition was fixed in concurrent save-swap and then delete
> > operations.
> [...]
> 
> No more utils update? why?

I'm travelling with surprisingly bad network access and I was happy to 
push out the release to solve the configure issue. Utils is not forgotten 
:-)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
