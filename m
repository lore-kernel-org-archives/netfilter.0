From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Creating a map with libnftnl
Date: Thu, 30 Jun 2022 17:11:53 +0100
Message-ID: <20220630171153.f6db1674be194c72ca6d17e7@plushkava.net>
References: <fbaccc73-c98c-4a21-bc12-0c89b041ae32@vt.edu>
        <20220630160303.ed722cd8c3a70facdf133f14@plushkava.net>
        <20220630160628.f7bd5dd1f234d834be19aed6@plushkava.net>
        <a751cf13-8ca9-7d9d-e1d7-6f4242ae8860@vt.edu>
        <20220630165409.7c3d0d1920ba9163ab057386@plushkava.net>
        <cc75919c-63ad-7255-1c60-63f266ba244c@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1656605515; x=
        1656691915; bh=vSL5xuDazBQVfnoLoZfKZzdhHnQN+SOKRk71J2+ksuc=; b=D
        qu1ydgOphmyjva5l2yvbAIM4ZTwA6/+QQ3eNkqbOJFBEA7B2Q5nd3t5iHI+q2VjE
        agzoV+ejfu1GmEbPqVlYEspLl5NGfAVZOPHxCaOA5LV+VY2rpxQ/ypsWdGI9qDwZ
        odxm4EqF964aNtb1gRXQAK0OsonfKRPssOHPKOib5yKBwfetIGyAit2tUv49U31Y
        gcQjjymQ1w3NU4WwEUyuBLHusRsQinBEGAHP3zYf0+UyjANj+OPl4bpWpEYk8EJr
        irpfs4C1LxWNUdiR1Bsg9P5sQyaF8v8NmPcsBSSwp+7GydJFlsIHV5Lg37QhXm6h
        SvHCfLBWqgpIBgw4JiNMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656605515; x=
        1656691915; bh=vSL5xuDazBQVfnoLoZfKZzdhHnQN+SOKRk71J2+ksuc=; b=u
        EZNlxI3aS48iY7FhpSz9VTSkJ5ywpyjhGVePF6gxpBrAWcYQ0f97Lx65ASDc4QIA
        T7m+uCUcZX9N9JF7AVPt+y1xQSouCy5GUpgUpqiWPXD15qDVV4zVqeWAfAISg5Hm
        Hu2/C8ZDSnCnJDOhrmIqL+u/73nMpJW/iCXLTjFWzvCml+xP12XHF5Ga4gVDhNuZ
        nqhfmztVtnnu3IxHwEU0ssqnPDd9ji4ouuBCo+XqT7xZTWdRXLFog1+bLhhZoYCx
        RB1ulYSfATbHphQdIwfE4pWO4ocXi70facTjSlMCg5qwTLz4O7wf5kx+rj2bGpme
        PRJpe1LJVMiYMgqsFQALA==
In-Reply-To: <cc75919c-63ad-7255-1c60-63f266ba244c@vt.edu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kiernan George <kbg98@vt.edu>
Cc: netfilter@vger.kernel.org

On Thu, 30 Jun 2022 15:59:12 +0000
Kiernan George <kbg98@vt.edu> wrote:

> That's actually what I had, I got screwed up when copying it over. 
> Regardless, do you know how to set that up correctly with libnftnl?

I do not. I'll leave it to one of the resident API experts to chime in.

-- 
Kerin Millar
