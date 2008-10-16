From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: General question about chains
Date: Thu, 16 Oct 2008 09:41:56 -0700
Message-ID: <48f76edb.14098e0a.10f3.2a43@mx.google.com>
References: <001501c92f41$d380c0a0$7a8241e0$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:mime-version:content-type
         :content-transfer-encoding:x-mailer:content-language:thread-index
         :message-id;
        bh=JCA37GdhO90S+TTCNkfbO2qQ8Nah8BvhVLaiUUpFPOs=;
        b=qQQEzaL6ocuMNneJ98Hq90q/SienMdWhOSBDkrK7coLLAXe7fvkqBFFwJDA1I8ognw
         c5KAc4N25dCausQa11gT0VgUpglUnzQO/HJjQbN7VEU11erom5XOI3yeGTD3Hgs3OGIY
         d0WiDNNtAjv975i3GEbCqYN72dTMMBsKItDeo=
In-Reply-To: <001501c92f41$d380c0a0$7a8241e0$@net>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


> 
> So my first question is do I understand correcty how to utilize chains?
> 
> Will I be able to load and unload chains rather than flush everything
> end
> reload everything? ( I have a lot of rules )
> 
> Sample syntax would be great because I have found a million sites
> without
> seeing what I really want.
> 

If you are talking about iptables-restore, you should use the "--noflush"
flag.
It will initialize (and completely override) only those chains defined in
the input.
Note, though, that it should include all chains referenced as targets of
your rules within this input.

