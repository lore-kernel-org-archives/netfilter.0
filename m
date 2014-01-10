From: Kristian Evensen <kristian.evensen@gmail.com>
Subject: Re: Packets not hitting the nat POSTROUTING table
Date: Fri, 10 Jan 2014 13:18:47 +0100
Message-ID: <CAKfDRXgitOtCSBrCmCjJ_Njwhh1HScBfjt2sYY2MQ0PjsVXEDQ@mail.gmail.com>
References: <52CF1B40.2070201@cdf123.net>
	<CAKfDRXg6ikUtbe3WF6EZTPpDSm_-nPSNPGgXGC95A4GPN9YEhw@mail.gmail.com>
	<52CF2A9B.3000903@cdf123.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=BC55SMTBy2qoU4OMsIDvJu5fMPV0qg7rnB8WXktKhZI=;
        b=Wgpfnn7Woss9SZu3e6uMLFoLrUoDPYYRaIyMyd+Zl8HXa1tKqsKV9W3dTGPp1BIz1E
         Mrl2emmEEiwbP/g5DhkdC/dzGEXVo8qiTqarHtF+efGt/wlqkQKVqzKkxgZDAeUG3vU5
         9WQ+/LBGzn8tdKlf5F6A0AkRCGqAlwgKzR44ufj/HGk31HN70N1WX2mG8BkV/K/wPMTc
         SaH65pYiG+Ru5Gm0qZ98mxevPzDA19ZoUPMMOM3y8YIah8ZSZh3REUj2soYMQbZy4B64
         pAjVteY+d0O8xzEDALGEZb33Pbcd52UGizKcshC63fIQUwWk1VrqG1X6MO6/8vKwnOJ2
         Xtdg==
In-Reply-To: <52CF2A9B.3000903@cdf123.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Frederick <cdf123@cdf123.net>
Cc: netfilter@vger.kernel.org

Hi,

On Fri, Jan 10, 2014 at 12:02 AM, Chris Frederick <cdf123@cdf123.net> wrote:
> When you say "established connection" are you talking TCP level established
> connection, or is this from contrack identifying the connection?  I guess
> what I'm asking is if doing a NOTRACK in raw would allow the packets through
> and still pass through nat/POSTROUTING?

Sorry for not being accurate, I meant established as in an established
mapping. If you use NOTRACK, I believe packets skip conntrack and
thereby the NAT table altogether.

> I did see that they are hitting the POSTROUTING chain in the mangle table,
> but I can't SNAT from there.  Does xtables-addons provide this?  I'll
> probably start looking there.

Yes, xtables-addons used to provide this in the RAWDNAT/SNAT targets.
I am not sure why there were removed, but the modules compile fine so
keeping an out-of-tree patch is no problem, at least for now.

-Kristian
