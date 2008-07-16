From: "Curtis Wyatt" <zhackwyatt@gmail.com>
Subject: Re: ipq_get_packet returns wrong data_len value
Date: Wed, 16 Jul 2008 12:55:08 -0700
Message-ID: <7915e7b50807161255wb76b311wf5213613062dacb4@mail.gmail.com>
References: <7915e7b50807151507m3d1ccadfub7cf1882817c72ca@mail.gmail.com>
	 <20080716062424.GB11639@bayen.regit.org>
	 <7915e7b50807160845j3806f5acr392da01f7136f6c8@mail.gmail.com>
	 <7915e7b50807161133g14b61423m589dc07f25936bf6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=CRrMEF0bicoOV5G8XzqSDxNz/lTpN4SsrJz78t7iyKA=;
        b=mvzsENYcGOoWnqn4Zr/xSzWBAAsJAPWMC1SiwaYundBnTKaGj5SK5R5Rky9Vd83Ck9
         Yu0TGCTtZVRe/qRl63Hv2tPxqIgCCB2uBMFMcYLt/JWtWq8t6t8jjXExlIyyur/nn2ch
         UTPZ+EqwegnVTvj9Djc/y/C0hmXRNfvG8XPjg=
In-Reply-To: <7915e7b50807161133g14b61423m589dc07f25936bf6@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, Curtis Wyatt <zhackwyatt@gmail.com>, netfilter@vger.kernel.org

On Wed, Jul 16, 2008 at 11:33 AM, Curtis Wyatt <zhackwyatt@gmail.com> wrote:
>
> Well I thought that did it but I spoke prematurely.  I guess I don't
> understand why I need ntohl on one program on the same machine, and
> not in another program.  Anyways, the data_len is ok,  but the payload
> is wrong.
>
> Thanks again for the help.
>
> -----------------------------
> Curtis
> http://gocalipso.com
>

Sorry about the spam, but I'm narrowing down the problem.

For some reason, there are 3 bytes added to the beginning of the
payload.  Does anyone know why?  They are all 0.
-----------------------------
Curtis
http://gocalipso.com
