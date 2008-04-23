From: "Yves DUF" <yves.duf@gmail.com>
Subject: Re: IPTables : How to force data coming from ethX being output by the same device
Date: Wed, 23 Apr 2008 21:06:59 +0200
Message-ID: <c4ecb9830804231206m2f83f26flc684f58193327c05@mail.gmail.com>
References: <c4ecb9830804230703q3f3cc02doc03c34a293d6014c@mail.gmail.com>
	 <funiac$l5i$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=xesBOBVGCo6HX4KhCmqPpFoIVw/4mNyovDE4VX9zobU=;
        b=J89N3U4GKY7zGReR6E9lAx0jEdKCRYT04WOaGT6AGl86k/yS4rbjQFKvj5MDDwzyAwclx6A5mJrILGbESDSfh1nT6y+CKeLJuMClkWvkOiDgcTwd6JbWiZB+voPUvqyOmGVEJb1+QsLPfUH/SGYGT+hv/D1JVLwUs9W3Bd/5UoU=
In-Reply-To: <funiac$l5i$1@ger.gmane.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Leonid Zeitlin <lz@csltd.com.ua>

Hello all.

Thanks for your multiples advices, I didn't dream such a reactivity.
Sorry if I've mistaken with iptables, but maybe you are all right, it
seems more advanced routing than iptables.

2008/4/23, Leonid Zeitlin <lz@csltd.com.ua>:
> Hi Yves,
>  I'm not sure I understand your problem completely, but sounds like your
>  situation is similar to the one described in Linux Advanced Routing and
>  Traffic Control HOWTO section 4.2 here:
>  http://lartc.org/howto/lartc.rpdb.multiple-links.html. Try to follow the
>  instructions in section 4.2.1 "Split access", this might be what you need.

Thanks for the link. Let me some time to understand and test this, and
I will say if it was the good answer.

Regards.
Yves
