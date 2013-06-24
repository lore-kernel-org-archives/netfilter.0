From: Borislav Petkov <bp@alien8.de>
Subject: Re: v3.10-rc7 oops soon after boot
Date: Tue, 25 Jun 2013 00:34:01 +0200
Message-ID: <20130624223401.GC24827@pd.tnic>
References: <20130624161305.GC26766@pd.tnic>
 <20130624221708.15489.qmail@science.horizon.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1372113246; bh=NEdiersNsbmQ9pOQByJdrWoz13BLe7wg9iXFXB4H++I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=Aegi2IY/KpUqKrYshMlM/mmrt5UgbwwKMLUhRJ
	2uBrkCRtSsKmkx8XCwXacmch77f1uIn1ISZqn6aAz6o0Bw+kKh6i8NbPSowtZZd+Ma3
	YJJMDUAgyGMsyAWfkneqYb2Y9gkjli9UDf4NhOMWYXLMU22zxSV0QnuZdMYvt7NIxo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1372113245; bh=NEdiersNsbmQ9pOQByJdrWoz13BLe7wg9iXFXB4H++I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=GYcM/Z+ZJG3zYZfb7KjbDaRZVTpta3SJjfm4sb
	ynH4VzQOw8dJAnfKyDZT21JZhr+wJhlq35NypQUOhWxTa27xHYTLmKWUiy6megW5Zjy
	EU+e4bJftL9shPDSZJSV9uwEOoBiEOFHAPQ04oriAHM5hcT2gtaY7dL1pzjdyAyiBM=
Content-Disposition: inline
In-Reply-To: <20130624221708.15489.qmail@science.horizon.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Spelvin <linux@horizon.com>
Cc: pablo@netfilter.org, gaofeng@cn.fujitsu.com, kaber@trash.net, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

On Mon, Jun 24, 2013 at 06:17:08PM -0400, George Spelvin wrote:
> >> Reported-by: Borislav Petkov <bp@alien8.de>
> 
> > This should be:
> >
> > Reported-by: George Spelvin <linux@horizon.com>
> >
> > I only connected the dots...
> 
> Well, you did a whole lot more than me!  I just lobbed a "d'oh, it
> crashes" into the seething ocean of lkml.  (Admittedly, I had reason
> to act fast: we're very close to release.)
> 
> You figured out what subsystem was at fault and got the right people
> involved.  Definitely a valuable contribution.
> 
> Me, personally, I don't give a flying f*** about such credit; I had
> an itch and was trolling for someone to scratch it.
> 
> So feel free to take Reported-by (you are the one who reported it *to
> someone who could fix it*), Triaged-by, or whatever.

I was basically correcting how Reported-by is used - for the bug
reporter.

And yes, it is very important for us (even if you specifically don't
give a rat's rear end :-)) to credit the people - with their permission,
of course - who report bugs. Btw, I assume it is obvious why we need all
those good bug reports...

So I'm perfectly fine with you not giving flying f*ck about crediting as
long as you keep testing -rcs and reporting issues.

:-)

Thanks!

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
