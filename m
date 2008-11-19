From: "JC Janos" <jcjanos245@gmail.com>
Subject: Re: Check whether an IPSET already exists?
Date: Wed, 19 Nov 2008 06:06:17 -0800
Message-ID: <7259d7020811190606k3139c71em5e6eee2b18a21fc2@mail.gmail.com>
References: <7259d7020811182012u544a1c53w719736aa74bdbc28@mail.gmail.com>
	 <alpine.DEB.2.00.0811190909010.22082@blackhole.kfki.hu>
	 <alpine.DEB.2.00.0811190957230.22082@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=diITQTp36CqbmJGshHJWStxedtlBLJNzSQ7cbGLekDI=;
        b=YedRYqLqnGSFGwYH58jmBynljrT85o61KznrmRl3t96Kav7QfCwz5P1F22SAN/Mx7T
         HDwdz7rffYxSAM7YU3P8RzTsFY9mt6WIrSS1tL3QhsmMDlRTUBGI6Lpg0JWEz5SbmtMs
         qaPBi6W1DVXB441FfqRyTPPCjj9X5nNUhlbME=
In-Reply-To: <alpine.DEB.2.00.0811190957230.22082@blackhole.kfki.hu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Joszef,

On Wed, Nov 19, 2008 at 12:59 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> There are multiple ways to do it, even in bash ;-)

That'll work nicely in a fw script.

Thanks.

--JC
