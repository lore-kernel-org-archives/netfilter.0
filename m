From: "James King" <t.james.king@gmail.com>
Subject: Re: POM Xtables???
Date: Thu, 24 Jul 2008 01:31:33 -0700
Message-ID: <38bcb3ec0807240131n1f5d4051k9e89731aa2fcb6c9@mail.gmail.com>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>
	 <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>
	 <4866F152.7030109@riverviewtech.net>
	 <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com>
	 <486907EA.60105@trash.net>
	 <alpine.LNX.1.10.0806302218500.30639@fbirervta.pbzchgretzou.qr>
	 <48694787.3080906@trash.net>
	 <alpine.LNX.1.10.0807010907040.26892@fbirervta.pbzchgretzou.qr>
	 <4887BCE0.2050902@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=bSs7s2pCrBROFgU6M6WZ13jJTjlnH74+3uUFe1dqyd8=;
        b=DfLZADVbU6oi0W3fZXhiGT1sj3RLwwAuG3yT05Jg3DnDtLDSrhegDLA1XrpJsj7z6f
         7Pz4D5EHbpXHlmeDpMNmcJTrd5NEOSuMXbLI0f6C8Lme9b76Stb3+yszoZNiKuM0fWn9
         cKEaQYHES5VzFP9yQyvpqmAE5FtaF5Gyrn6mc=
In-Reply-To: <4887BCE0.2050902@trash.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: Jan Engelhardt <jengelh@medozas.de>, Dave <finalglide@gmail.com>, netfilter@vger.kernel.org

On Wed, Jul 23, 2008 at 4:21 PM, Patrick McHardy wrote:

>>> - ipp2p - last version I've seen was a *horrible* mess, unless I'm
>>> confusing it with the other l7 classifier module out there.
>>
>> It was ugly from a codingstyle pov, which was fixed. It inspects
>> packets
>> xt_ipp2p I gave it some care and a cleanup. it also "works", that is, it
>> matches on bittorrent (something I could test), not all (data) connections
>> though, but I guess the control connections are in.
>
> Just send it to netfilter-devel. If its the thing with lots
> of hard-coded binary matches full of magic values I'm not
> interested :) I'd be more interested in a discussion what
> would be necessary to represent all those matches through
> the FSM textsearch match or something similar.

ipp2p is the one with hard coded magic values.

What are your feelings on the kernel version of l7filter (regex
patterns loaded from the filesystem)?  Currently it requires a patch
to add a structure to nf_conn, but I've been meaning to rewrite it to
use ct_extend so that it could at least be included into xtables-addon
and used with a stock kernel, although if there's interest in having
it merged into mainline I'd be willing to focus on that.  One thing
I'm not sure of is whether the license used by the Henry Spencer regex
library it depends on is acceptable by kernel standards (or whether
it's permissive enough to relicense under GPL, as IANAL).
