From: Dave <finalglide@gmail.com>
Subject: Re: ip_conntrack files
Date: Wed, 14 May 2008 14:01:38 -0700
Message-ID: <935fab200805141401k7aadcbeci65f2c830dda74b14@mail.gmail.com>
References: <1210768892.2956.476.camel@kr0sty.1.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=g8BVKk+BlQnOjqY+bhFeesBrJPOWJsjQ114m7p0fxCk=;
        b=oSpjZXxVJXSjr33tuqRfVU1k7gm3tgtMk9ocFjiRmhz6IPlXsR9CeIcQ/Ur6ml4Xx/+kQXWeKyXySQfbzj7iJyVKCXjM/KZ9yU2aNA19zexgCNrhgppdwDgfDansVWQKzi1QLrXtI63RBhBqSwPN5LgGc32WhomKetBvLGTRnnU=
In-Reply-To: <1210768892.2956.476.camel@kr0sty.1.com.ar>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: mylists@itcom.com.ar, netfilter@vger.kernel.org

Hi Martin, I went down this road as well.

The source files seem to be included in the latest Patchomatic
sources. Did you check this site?
http://www.intra2net.com/de/produkte/opensource/ipt_account/

The POM will patch your kernel sources with the ACCOUNT tool, this
part worked flawlessly.

The source to add to the POM util is here if the files are not in your
POM already.
http://www.intra2net.com/de/produkte/opensource/ipt_account/pom-ng-ipt_=
ACCOUNT-1.12.tgz

I actually tried to compile the userspace tools for ACCOUNT but it
always failed, so I never got to use it.  Maybe you will have better
luck, please let us know if you are successful getting it up and
running.

Good luck
-Dave




On Wed, May 14, 2008 at 5:41 AM, Martin <mylists@itcom.com.ar> wrote:
> I don't know if I'm getting more confused while working in this task,
> but can't find where are source packages of ip_conntrack for kernel
> source, all I find is the userspace daemon and some libs at netfilter
> site.
>
> =BFCan someone tell me where to find them? I mean those that use
> at /usr/src/linux/net/ipv4/netfilter
>
> Thanks
>
> Mart=EDn
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
