From: Peter Hoeg <peter@hoeg.com>
Subject: Re: Running nft --check as non-root
Date: Fri, 12 Aug 2022 13:15:41 +0800
Message-ID: <87v8qy9gzg.fsf@hoeg.com>
References: <874jyiu661.fsf@hoeg.com> <20220811161500.GF8667@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hoeg.com; s=google;
        h=mime-version:message-id:in-reply-to:date:subject:from:to:user-agent
         :references:from:to:cc;
        bh=BsB3oiw4igUtHY9vRrDsxo36pjOt4nLqO9flZGof5Qc=;
        b=OVUIAEJZfnE2uOHgx+iaZlKu+j81F9EFddzH6t5V0mPsx68x3qkGF6qHxikYzhTCmJ
         m0EynwdibtIt+7byubtzVlT0sjZi2QF8UARX7SY8lWE+DTpf30w6GO7PcNqdrBIfZwVH
         6rzgsFYA/bzt4g4Zfxt89Zsvf2TdjnBFVml7Y=
In-reply-to: <20220811161500.GF8667@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


> Yes, this not a syntax check. The ruleset is passed to the kernel.

Is there any other way we can verify that at least the syntax is valid? Maybe have a --syntax flag that just invokes the scanner and parser without needing any privileged access?

I know nothing of the internals, so that might of course be completely impossible given the current architecture.
