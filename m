From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Will ingress rate limiting using ifb works at 1gbps
Date: Tue, 28 Oct 2014 15:34:20 +0530
Message-ID: <CAA5aLPg5oppnTJ1GYmULAk0vg_wfFn51CeBz7V0wf2qyZhrb4w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=I4pzy4cjYewNYLaxwnyMTVaTCA+JJ6Fx5Ssr9igkU2U=;
        b=EHb86VxjxVcAps1fb6WHPjIt5jj9Obn6OP5VOiOFiCcwIEj/8Nr62AtNF0kPRS9n/1
         yuR/o62FmngjnyWv66avdG69xJ8+ldOjbAugWFZK1vYe+QVLGpGc/M6WbX5Y3Xt8hH/8
         3gb61MBVEN+RIv9zXOn0ELc9eUmwBxAb5adgL3RcQXX93y2d7OtmuHOaQ/cHINsZ6ICB
         qW6mO05QljAP68nkxRD3fMWGXjJJSGLHv5ftZSK7wUSnu6AlQEF/ovPFLtA0UpnpWxgK
         WSxJOpyAE57qZGOMPXcn/pLS3xBDUPxDSgqcRg+0JduwBYWbJU2CXBH1TUvZ/0cXltsg
         d3jw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I want to do rate limiting for one incoming interface and multiple
outgoing interfaces. It becomes simple for me do rate limiting on
incoming interface itself without touching outgoing interfaces. So,
for downloads I can use egress rate limiting on incoming interfaces
and for upload ingress rate limiting. But as ingress rate limiting
will work efficiently only by using IFB, I doubt the performance as it
is software mirroring of packets from eth0 to ifb0 which at high loads
might introduce packet drops.

So I just want to ask whether ifb will be able to handle 1gbps load
assuming 64bytes packet.
