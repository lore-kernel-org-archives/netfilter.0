From: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Subject: Re: Strange behavior with ipset not matching on public range
Date: Tue, 28 May 2013 15:33:55 +0200
Message-ID: <1369748035.5217.5.camel@BEWS005.euractiv.com>
References: <1369662135.4058.24.camel@BEWS005.euractiv.com>
	 <alpine.DEB.2.00.1305271548390.11760@blackhole.kfki.hu>
	 <1369665896.4058.29.camel@BEWS005.euractiv.com>
	 <alpine.DEB.2.00.1305272011390.13657@blackhole.kfki.hu>
	 <1369747804.5217.2.camel@BEWS005.euractiv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:x-mailer:mime-version:content-transfer-encoding;
        bh=pmVTAc94tX0J7iuDBc93S2g7rh39DgOxGMuaukuk2cs=;
        b=vkKNpInM0bA2LwlaB1YLBMIOtDAmmdeFg+Q+TLY5cjISc/OdDiplnNAlTJ/LuMVt/w
         7zomKpcrC/mrymIvG54hthLn5fxpVlhrvEYxYyvkCJ+mmuuvAx1RRo1/xK7YPjX0qrl8
         rD9z8wVGCmLP15VgbpwQH3d4Gsm7Rtac4uQlg/vGzw/16GtmfxARVCF4YhhLzmw+N5B3
         6/jfaOzg6BeOjx15bWRZ5vsuN6DkPydjAQZdocOEhZAiSBhU9dkC8+TM7j72DZwB8Yv2
         iGvrSRf4CDo26UPkIq8FeoSmbUx846g5yjYgXtPmKQcWwhiyAAayuqzFlSwhFvel2Rgp
         1ppg==
In-Reply-To: <1369747804.5217.2.camel@BEWS005.euractiv.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

On Tue, 2013-05-28 at 15:30 +0200, Jimmy Thrasibule wrote:
> > 
> > I think you should upgrade: some drivers doesn't zero pad interface names 
> > and than can fool ipset up to 6.12.1. It was fixed in 6.13.
> 
> Looking at the changelog, it looks like 6.13 is fixing an issue which
> can be the one I encounter. Do you have a link to this commit or a
> commit hash so I can report the bug to the Debian team?
> 
> --
> Jimmy

And by the why is their a way to trace this issue? I mean it would be
useful in the bug report to show that something is going the wrong way.

--
Jimmy



