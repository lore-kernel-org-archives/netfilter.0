From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: rate limit by MAC
Date: Wed, 1 Jul 2009 12:48:47 +0100
Message-ID: <56378e320907010448n2a02fa6cxf9653518f7eff428@mail.gmail.com>
References: <4A4B42C6.4060103@msm.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=8kLeVVSs4Vp1VWHQqcy34sRBxV3ilNOcVJwWfE2fRQA=;
        b=BimH6UvhIBq21wXGm2NJ31nObfbNdDPDTxk7Qcfox0WGIt9cQIVz/FbJTLU6G0F99t
         wBs2pa3Yu1tiG7ksW6xQxxsz+JtcFd0QuAOf+fvEp8EMs5y3RGZmv4sWCr11zItLOtIO
         Zjm4B3Nr2FIbVfV4nIKwMiAcGOfkvecV/FMqw=
In-Reply-To: <4A4B42C6.4060103@msm.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: netfilter@vger.kernel.org

2009/7/1 =F3=C1=CD=D5=D3=C5=CE=CB=CF =E1=CE=C4=D2=C5=CA <samusenko@msm.=
ru>:
> Hi!
>
> Can iptables limit rate by MAC? Think it no.
>
> What on Linux can do how i need?
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =9Ahttp://vger.kernel.org/majordomo-info.html
>

You might be able to...

iptables -A FORWARD -m mac --mac-source <<mac address>> -m limit
--limit 100/s -j ACCEPT would restrict the given mac address to 100
packets per second... but depending on how many mac addresses you have
it might be too much to enter each rule...

The hashlimit might be better if you can use ip addresses instead of
mac addresses.

--
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Fo=
rest Cats
http://www.pbase.com/arimus - My online photogallery

--=20
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Fo=
rest Cats
http://www.pbase.com/arimus - My online photogallery
