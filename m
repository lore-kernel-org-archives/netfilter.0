From: Gadre Nayan <gadrenayan@gmail.com>
Subject: Re: Confusion regarding nfct_query and nfct_callback_register
Date: Tue, 23 Feb 2016 09:46:33 +0530
Message-ID: <CAKJ7aR7k=yt+7xfss7Kqf9CjQCp87W0r0cEjoiwYt-u1bz-U_A@mail.gmail.com>
References: <CAKJ7aR5QqKWJadptNGrUruWX9JQm3C97bhHqvHY3AR11HXXHyQ@mail.gmail.com>
	<20160212073032.GA320@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=iJwd9z8G6HpolZwT60lJh+YMEGtaKGnwbsVAFMeCvAA=;
        b=QwuRPKwo73ezah/jd7phLlJr/BnnVrD1Up4R+ri0RAxfgUSVxYoY95hNEgdUTn7Tz1
         wbQ1CqA8uh+J4H7g27AQ3V+R37iXAJPyIoIo/TCbtjdoAM7z+JowJThdGqYVpdOfTZMM
         50LEi0MQJiNwgvBZDG5qLOpnvi3KNn1xAtBDthBsPz3b6W+9s/ZsSB00XmcOzbFQj1lh
         iPFbexOP5SRi1LdTvdc2j+qk1mrqICYKPKYMjVjkq67evsmU/A498ZPGQb/7x2IDgLDL
         kDuN06qP/UoJZApxmOUAelGblWXZDatcnsu9koDC3KJ2V/9K/FpTmaQuXIAPoYUF8XNG
         d79A==
In-Reply-To: <20160212073032.GA320@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ken-ichirou MATSUZAWA <chamaken@gmail.com>
Cc: netfilter@vger.kernel.org

Thanks Ken!

On Fri, Feb 12, 2016 at 1:00 PM, Ken-ichirou MATSUZAWA
<chamaken@gmail.com> wrote:
>  Hi,
>
> On Fri, Feb 12, 2016 at 09:40:49AM +0530, Gadre Nayan wrote:
>> Who is providing both these structures (struct nf_conntrack *ct, void
>
> struct nf_conntrack is allocated by nfct_new(). You would find this
> function called in __callback() in src/callback.c. Then it parses
> nlmsg and updates nf_conntrack, calls callback function you
> registered.
>
> The __callback() is registerd as callback of which libnfnetlink will
> call when conntrack nlmsg has received, at nfct_callback_register()
> in src/conntrack/api.c.
>
> # it seems that using nfct_callback_register, functions related to
> # libnfnetlink, is discouraged for me.
>
> I hope this is an answer you are looking for.
> Thanks,
