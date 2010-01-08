From: Elison Niven <elison.niven@gmail.com>
Subject: Re: conntrack -F not flushing the table
Date: Fri, 8 Jan 2010 22:04:46 +0530
Message-ID: <201001082204.46961.elison.niven@gmail.com>
References: <201001062301.37395.elison.niven@gmail.com> <4B45D6CD.4090903@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=k2IZNUyXbGb2Uku9VjFf0h8oy3HaStNAI7CI8wBX/sk=;
        b=E4b+/JKxRG/zX+c1B2BYIV4p//Fgc4xZDR7bny0YYGSoEBSqsS4wlAsTFfSqUqLBMb
         oBOxGgN40ygx3hHGLNsfeShhPWV1A+Xl2FIMEpLV87CT6O+94C2q76Z1Z7/W71iEM3tp
         3tvTlMvwtYYTpckHdoHS8h5i89yfkqMemNNrk=
In-Reply-To: <4B45D6CD.4090903@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Thanks for replying but i do not have strace on my board, will build strace 
for powerpc and post the output.

On Thursday 07 January 2010 18:12:53 Pablo Neira Ayuso wrote:
> Elison Niven wrote:
> > Hi List,
> >
> > I am running linux on an embedded powerpc board on which conntrack -F
> > does not seem to flush the entries as seen below:
> >
> > # conntrack -C
> > 2000
> >
> > # # command to flush
> > # conntrack -F
> >
> > #conntrack -C
> > 2000
> >
> > I am able to delete single conntrack entries using conntrack -D but
> > conntrack -F does not work.
> >
> > Any ideas on what could be possibly wrong, Am running linux-2.6.22 with
> > all conntrack modules built in the kernel.
> 
> Could you post the result of `strace conntrack -F'?
> 
