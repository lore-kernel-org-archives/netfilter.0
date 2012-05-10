From: Neutron Soutmun <neo.neutron@gmail.com>
Subject: Re: [ANNOUNCE] ipset 6.12 released
Date: Thu, 10 May 2012 23:28:25 +0700
Message-ID: <CAMQP0s=DvvYL9SKURz2nm9WuWHQEXBQv9UEQ487GQMwhqa_rgg@mail.gmail.com>
References: <alpine.DEB.2.00.1205101211080.18562@blackhole.kfki.hu>
	<alpine.LNX.2.01.1205101238020.20012@frira.vanv.qr>
	<alpine.DEB.2.00.1205101316470.18862@blackhole.kfki.hu>
	<alpine.LNX.2.01.1205101327310.12733@frira.vanv.qr>
	<alpine.DEB.2.00.1205101337160.19028@blackhole.kfki.hu>
	<CAMQP0sn=2jKYzoiUVu+oTRYj-niL84Lg2Z1UoO0UnFXJjV8Ggw@mail.gmail.com>
	<CAMQP0s=uSzOn-o7jwKLyhTaZud4d04hMN=JXrCQLrFD+6Zinkw@mail.gmail.com>
	<alpine.DEB.2.00.1205101724370.19418@blackhole.kfki.hu>
	<CAMQP0sm+_8FytQxQHCgk44DVesxMycYQbMW9z+XR0-09NniT9Q@mail.gmail.com>
	<CAMQP0snnXgGCJqN1iuN+y9_rgpa7HMrRuM0akhCa-NtxmBz_QA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=ENRMFzZL7x5Yxg9G7S4w7lnKLaSHPZl1jsJG7nz2oWA=;
        b=PKgsyFV8wGAnoZTO4rVVyt7Yu69yOOBe0dodzWPt49VtnGXe9n2aI5+Aja7vmATzOO
         zZiFtl5/HbFzZEWdp2i/Puhovd3JsdaY3vNXfVfxPyKbtlyHzYUmzZmID6zG3YNiu6nq
         e8/GIfeN8pqNCjjp6QKkUFTFumXHD9/G2Et7nV205i96Ba+YgcKeuZ7EbLcBrEkQJA00
         mJdg2gfDlYSJnc9jDts6plcc/o1Yye1ORFHYBm3VanTfWrlkRjM+UV7BD/exTYLlRZm8
         D2iPT3zD978rFH25SP7K5ur6rYyLsFGIjCW4HYnz6Xqj3pVSZhKj1BoGgwloFENwKtCg
         1KVQ==
In-Reply-To: <CAMQP0snnXgGCJqN1iuN+y9_rgpa7HMrRuM0akhCa-NtxmBz_QA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org

>> No, it's for the userspace tool. The set types can be compiled as dynamic
>> modules (shared libraries), instead of statically compiling into the
>> "ipset" binary.
>>
> Got it! I always assumed that the userspace modules got compiled as .so
> files, so I must have been looking into the future ;-) . I also assume
> that I may configure which modules to include and which to leave out,
> right (otherwise I don't see the point of this feature)?

the point of this feature is providing the easy way that the
third-party or the experimental modules
plug into the existing ipset userspace binary without recompile.

You could build the experimental ipset "FOO" kernel module and build
the shared-lib of "FOO" userspace tool module and
plug into the system without recompile the ipset userspace tool at
all. It's inspired by iptables (kernel/userspace module).
