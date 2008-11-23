From: Wolfram Schlich <lists@wolfram.schlich.org>
Subject: Re: PaX killing conntrackd (strange "execution attempt")
Date: Sun, 23 Nov 2008 15:29:11 +0100
Message-ID: <20081123142911.GJ7976@bla.fasel.org>
References: <49216734.9080505@netfilter.org> <49255C80.8215.1C8E5CB2@pageexec.freemail.hu> <492967A9.90105@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=bla.fasel.org; h=date:from
	:to:subject:message-id:references:mime-version:content-type:
	in-reply-to; s=mx; bh=MqP8+Mon6Sl1Giv6yu/8hweLt7Y=; b=bYxwENCNCE
	ibiowoJ4y9qDAVhI8q2n+9K4DBgP5u6jL72WnO7LeObPAxbbJLMIwwCOnONgRObM
	gjaQITngLBTbJq0JBe4737p9lw1BXE3TO3K9b12Oao52R2EHzlbWDUCcSvhL6Tfh
	BCDkxt1T+xIhxVls0pBK+m8aXZk0jNasg=
Content-Disposition: inline
In-Reply-To: <492967A9.90105@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

* Pablo Neira Ayuso <pablo@netfilter.org> [2008-11-23 15:25]:
> [...]
> Thanks for the detailed report and your time. I'm going to push the
> following patches to git. One of them is a rudimentary test file for
> automated checking of unset function pointers, this should be better
> that the big-fat-comment elsewhere :)

Thanks, Pablo! :)
I'll add the patches to our Gentoo ebuild for 0.9.8.
When do you plan to release a new version?
-- 
Regards,
Wolfram Schlich <wschlich@gentoo.org>
Gentoo Linux * http://dev.gentoo.org/~wschlich/
