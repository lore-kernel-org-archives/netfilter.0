From: Wolfram Schlich <lists@wolfram.schlich.org>
Subject: Re: PaX killing conntrackd (strange "execution attempt")
Date: Mon, 17 Nov 2008 14:09:24 +0100
Message-ID: <20081117130924.GD26975@bla.fasel.org>
References: <20081114150908.GV26975@bla.fasel.org> <491D9AED.12969.1657939B@pageexec.freemail.hu> <49216734.9080505@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=bla.fasel.org; h=date:from
	:to:cc:subject:message-id:references:mime-version:content-type:
	in-reply-to; s=mx; bh=uTKsZ8Qz4WD1Op18VIlnK0tqS8E=; b=AFvQ+H+n9L
	MP7SBRdrH968Wbyv8//MqkIsC9BYxNF3bSQsS75UZ/ngENXueCWPdaWjlkOJQ0GJ
	Tf5qS6L4osFAcuCdsk4tJPbrN7+LrY3rN9jAbdGjGcrY/7SXsF/3exzB9KGZcf3z
	wAqkJWkdIl3HdjPUUUSk9ZL6B2oolY9CE=
Content-Disposition: inline
In-Reply-To: <49216734.9080505@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: pageexec@freemail.hu

* Pablo Neira Ayuso <pablo@netfilter.org> [2008-11-17 13:29]:
> pageexec@freemail.hu wrote:
>> [...]
>> so that's a null function pointer in whatever structure __build_protoinfo 
>> dereferences
>> there. is it of any help to you or do you need me to dig out more?
>
> Hm, that code belongs to libnetfilter_conntrack (src/conntrack/build.c). 
> The annoying thing is that I see no structure with function pointers in 
> that piece of bits. There are only calls to libnfnetlink functions to build 
> the netlink message that is sent to kernel-space.
>
> @Wolfram: that code is only reachable during a fail-over - ie. when the 
> external cache commits the entries or if you have CacheWriteThrough enabled 
> (you shouldn't unless you know what you're doing). I'm telling this because 
> otherwise I don't see a way to reach that code - considering the posibility 
> of having a memory corruption so that this backtrace becomes useless.

Hmm. There was definitely no fail-over at that time and I didn't
enable CacheWriteThrough either.
But I got a second coredump from the second firewall machine which
I already sent to the PaX team -- maybe the analysis of that one
shows different results. I guess we should wait for this one before
thinking about possible causes.

@PaX team: did you already have time to look at the second coredump?
-- 
Regards,
Wolfram Schlich <wschlich@gentoo.org>
Gentoo Linux * http://dev.gentoo.org/~wschlich/
