From: Saikiran Madugula <hummerbliss@gmail.com>
Subject: Re: ipt ROUTE extension
Date: Wed, 14 Oct 2009 22:29:39 +0100
Message-ID: <4AD642C3.2070900@gmail.com>
References: <9041a1390910141008v26bb354idfcffb173ac87110@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=JbZvomrxyAWzZgHhnw851y2Jbuu31+7NL38tBpz0/8I=;
        b=fubpPN1U8ma124g302pXgm+P6NEGV69Cx3gE+mDO7pEM9YGKyM2vPVoF+Ancei4TUu
         sZp46zXQAy+2LTJGhb5CsmX4rnghZ+UajBQjTkd7YDDcwRzknSD6wnNmSMkZdSVnRtsz
         x2gK5OSU7yMDFMyzlGeMeyAHOeYsageHaVCK4=
In-Reply-To: <9041a1390910141008v26bb354idfcffb173ac87110@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mallika Gautam <mallika.gautam@gmail.com>
Cc: netfilter@vger.kernel.org

Mallika Gautam wrote:
> Hi,
> 
> I am trying to find ipt_ROUTE patch for kernel 2.6.20 version. Can any
> one kindly point me to the site.
> 
AFAIK its been replaced with xt_TEE (http://xtables-addons.sourceforge.net/).
