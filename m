From: Darius <dram@mailbox.org>
Subject: Re: Metering is not working with dynamic sets on nft v0.9.2
Date: Fri, 7 Feb 2020 12:08:53 +0100 (CET)
Message-ID: <1040016530.90308.1581073733434@office.mailbox.org>
References: <8665bae3-ba91-2699-15ea-27d256d9bcd2@mailbox.org>
 <4d26b387-5466-d57d-6191-dcbe8926ec01@gmx.net>
 <20200207101740.GC6466@breakpoint.cc>
 <89800836.90200.1581073253643@office.mailbox.org>
 <20200207110626.GD6466@breakpoint.cc>
Reply-To: Darius <dram@mailbox.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :subject:subject:references:in-reply-to:message-id:reply-to:from
        :from:date:date:received; s=mail20150812; t=1581073733; bh=Bfq4e
        eqIaFIBD8BnxffKNsT181bwcTDcC2AFF94+V6g=; b=AUJDm1m3Bny3i0v3hVZkI
        74MfNFp+veuo14bVa5UlmvKwKQA91lQzGReY6Wd5qMTiIOyXCzYQ5UIfFbgtfbYD
        S15neNjRtmhIlFcLoHs1Co1VC/axP0lu525DdqKrhl8Unr/fGdnyM0J1wiJa0H4w
        SAJlg3WY3fUqFafjChUHelYWdCU2J8W1aE2sr0FnNzCLJY+b+9aLdBVJaPTfKVnM
        EOBCwS7mYRDMLLB0yvRstT7dMoTbVJeol8bhCtdJNbBFVN8johyWSRk+zaBZtuJ3
        kzvxyLppbKWXWRTkRqbomvXDLMynekDqjnkJDoYRKbZRBPUvGEOFxAVgRbmiZx1C
        w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1581073737; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IJbsCd6xATBRIjNKiQmLkBOYm2P1hKVgR8rkk7wbjPo=;
        b=Pm/GxrgyJQtuNc1qZOGXcARqXVyMYIv8ltSWwuEyOpu0Ux3/XHuL/Hz/Ztk+/3+apRRZhk
        RR4G7dqss19BirqWSAHUZE2u+8g3j7IJQKQv14yiaVSZJYE49pj3S2hG75uRiCBbkFRimt
        G/4A/RAzbtfGuplOYPcJEBG2ScYCWLXrbCNKjiAGLzUNZf9tODO/VhouIlQOLH83p7RQ1b
        cb9bY7ZjjbLgnV3TfSCWeHCketUeRhX/RGfZpkVqtLARwKID6GTxiEnQHegi5NK1Ohuhes
        LW5GGSc+fxJjzusZUyO1i5PS3rtWzfxE7RPkGtBnH42/GrEHBplSvGQ+oIoUxA==
In-Reply-To: <20200207110626.GD6466@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks! Will investigate a bit

Regards

> On February 7, 2020 12:06 PM Florian Westphal <fw@strlen.de> wrote:
> 
>  
> Darius <dram@mailbox.org> wrote:
> > Ok, I'll keep using 'meter' keywork. Sets are working just perfectly, all sets instructions works as well.
> > 
> > But do you know if it is only 4.14 kernel affected? Is there any bug report and patch available for this issue for kernel 4.14?
> 
> No idea.  I suspect its this patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=acab713177377d9e0889c46bac7ff0cfb9a90c4d
