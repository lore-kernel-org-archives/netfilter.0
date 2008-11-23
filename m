From: Wolfram Schlich <lists@wolfram.schlich.org>
Subject: Re: PaX killing conntrackd (strange "execution attempt")
Date: Sun, 23 Nov 2008 15:07:01 +0100
Message-ID: <20081123140700.GI7976@bla.fasel.org>
References: <49216734.9080505@netfilter.org> <49255C80.8215.1C8E5CB2@pageexec.freemail.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=bla.fasel.org; h=date:from
	:to:subject:message-id:references:mime-version:content-type:
	in-reply-to; s=mx; bh=xTqLhIrqUuVvW5cwTBL6oEl7Knw=; b=OSEVnYCupZ
	KrdT4bAwz5paGBL0kuczFUCzRn/xELDARjC8a7YOLbhKHJ1bp/7UVOg2K1bg1DTO
	F8kS6nf8vfnESbRyOPptXsHsbpOd5uF5wQmqo1IjYQq4h/CWlczfBnib0M8l527H
	6OnXHG9kb81NMosNMJ7wWMVUROY8W9zn4=
Content-Disposition: inline
In-Reply-To: <49255C80.8215.1C8E5CB2@pageexec.freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

* pageexec@freemail.hu <pageexec@freemail.hu> [2008-11-20 13:48]:
> [...]
> sorry, gdb used the wrong symbols, i decoded it by hand now and the failing
> code is nfct_copy calling through copy_attr_array[] and it so happens that
> the array has no function defined for index ATTR_HELPER_NAME, the last entry
> in enum nf_conntrack_attr so i guess it was added without the person being
> aware of its uses elsewhere... maybe check your tree for similar issues and
> also add some big fat comment to the enum definition to remind yourselves to
> update other places when adding a new enum there ;)

Pablo? :)
-- 
Regards,
Wolfram Schlich <wschlich@gentoo.org>
Gentoo Linux * http://dev.gentoo.org/~wschlich/
