From: Hangbin Liu <liuhangbin@gmail.com>
Subject: Re: [contrack-tools PATCH] build: do not compile nfct if we disabled
 cttimeout
Date: Sat, 10 May 2014 10:51:23 +0800
Message-ID: <20140510025123.GK25631@localhost.localdomain>
References: <1399543345-3634-1-git-send-email-liuhangbin@gmail.com>
 <20140509112959.GA3812@localhost>
 <20140509115411.GJ25631@localhost.localdomain>
 <20140509135942.GA11325@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=qQANF0IISrpwfHfIB6UwzOjfgrSA8MBVbFTRLbU+28Y=;
        b=PLCW99QlTKgtZLwA0swFczdTcj5PXRaPk874gNfO2TW/gDxdhWfKsU7sMWuuS3iWsF
         BUCHbup2SI5lYVDWyncLUaxjHb5+XvbFX/qjOMCHpL/os3a7xJ8s/L6pGhymwkbaLg5/
         cyflisuWq7yTL/ZgflLfFySYYTmSi4AWNfyI4CA4HGRJQwWU/9hc5alA8QVYwbv6iIPC
         Ckcid60BUljpyIXCg1jXO+4cFbMtz85jahGHpxVJZBVIs0dghb7EuWTW/2SoXWmlsxof
         lLZp2TOtzDRkBvCYG1sHZD7ek8b5DERjVIAsxnaJv9qlzndiYY2MR1gQOH5iCENsqrOU
         aihQ==
Content-Disposition: inline
In-Reply-To: <20140509135942.GA11325@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter dev <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

On Fri, May 09, 2014 at 03:59:42PM +0200, Pablo Neira Ayuso wrote:
> On Fri, May 09, 2014 at 07:54:11PM +0800, Hangbin Liu wrote:
> > On Fri, May 09, 2014 at 01:29:59PM +0200, Pablo Neira Ayuso wrote:
> > > On Thu, May 08, 2014 at 06:02:25PM +0800, Hangbin Liu wrote:
> > > > If we do not have libnetfilter_cttimeout and disabled cttimeout, conntrack-tools
> > > > will compile fail because nfct.c include nfnetlink_cttimeout.h. Fix it by only
> > > > compile nfct when we have enabled cttimeout
> 
> OK, I see. That's not nfnetlink_cttimeout.h, it's
> libnetfilter_cttimeout.h.

Ah, sorry, my mistake
> 
> Let me check if I can come up with some alternative solution.

-- 

Thanks & Best Regards
Hangbin Liu <liuhangbin@gmail.com>
