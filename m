From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: [SOLVED] Re: LOG target with MARK?
Date: Tue, 12 Feb 2013 17:44:31 +0800
Message-ID: <20130212094430.GA20707@devnull>
References: <20130212030235.GA16352@devnull>
 <1360654592.30430.153.camel@andrew-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=agl1q+g6wXKqqATYG1+m0NaAYd9ql3yVaMfSbXN5bvg=;
        b=UiizJ0TDPbQSvtEFRwiO87BdRj2NARcGBJbslu1es71ZZH33zf9XdMiMFXjW8CRoDR
         6RcEeY/jubk22JgG3wxYo0suJjC+Ye5MP3qHpDsJJsAumP2j82PSsGm+nrhzYKF6qoh4
         E0uFNiGw+jJ/vOfXtrQFdK/fbrpP4yRW1rHlOihoCNTfjgRyfVkP+78yhunnJCfZxSqS
         wgzjf0ZHm2JJzKwKkAfAwQRkEoMMfJBzccv9yM72N9+10F0Wvt0f1nmbUe219xLtymkE
         0EenzYjRe4Z23HEy/1I4aCNnvMEG1Gkw3vilh32ysKriKGUJvc1U8LONRPuKt3ATbFWF
         FkJA==
Content-Disposition: inline
In-Reply-To: <1360654592.30430.153.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: Aaron Lewis <the.warl0ck.1989@gmail.com>, netfilter mailing list <netfilter@vger.kernel.org>

Hi Andrew,

On 07:36 Tue 12 Feb     , Andrew Beverley wrote:
> On Tue, 2013-02-12 at 11:02 +0800, Aaron Lewis wrote:
> > Hi,
> > 
> > Looks like the LOG target doesn't output the mark of a packet?
> > 
> > I checked -j LOG --help and there's no such option, so what should I do
> > to get the mark of each packet and print them?
> 
> It will log marks on packets by default. If there is no mark then
> nothing will be printed; if there is, the value will be printed at the
> end of the logging line (eg MARK=0x64).

Ah, thanks I get it, I did some experiment, if MARK is not set, it won't
get printed.

Now it works.

> 
> Andy
> 
> 

-- 
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://pgp.mit.edu/ )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
