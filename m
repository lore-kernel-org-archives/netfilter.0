From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Wed, 06 Oct 2010 16:26:14 +0100
Message-ID: <4CAC9516.5040609@googlemail.com>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com> <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu> <4CA7978B.9020900@googlemail.com> <alpine.DEB.2.00.1010032106460.26617@blackhole.kfki.hu> <4CA8FDE1.8090809@googlemail.com> <alpine.DEB.2.00.1010041134130.28881@blackhole.kfki.hu> <4CAC866D.7060101@googlemail.com> <4CAC8992.2030708@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=rmassYkVYcbJuMTr61mJblzh4AuE8c6ss47dzWpntig=;
        b=uIEBeTQ//52ZYNOvpQIuCd+TUHZC6AfW/zKLu3X0IgXGQ9DdQRfcn8FwdYVyUmANCF
         4U+OregCz/tJPTD9ZvMiwj3rk7srrP/luyNHdZhLcWLfQs+vmjWRPBu9Kg6Fw5abNwUI
         Mxv5P42gBvqAVJp7TLDMWjKeEWLo+/5islgrA=
In-Reply-To: <4CAC8992.2030708@mailinator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Wright <mike.wright@mailinator.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org


>>
>> Is this deliberate or a bug?
>
> It's deliberate.
>
> The numbers are treated as modulo 256.
>
> 30,000 / 256 = 117.1875
> .1875 * 256 = 48
>
> Thus the whole number parts become segments of the quad: 117.48
Right, thanks for clearing that out - I now know how to convert my 
ip-to-country numbers to IP addresses ;-)
