From: Satish Patel <satish.txt@gmail.com>
Subject: Re: Build firewall with millions pps support
Date: Wed, 27 Apr 2016 08:57:36 -0400
Message-ID: <B4F13F97-5E5F-4ED3-8DC7-6213641E3D4A@gmail.com>
References: <CAPgF-foyqY7_UbQVK7R4vU5MRP0XsfgXAjpQUNwNROZVq9YxDQ@mail.gmail.com> <20160427063952.GA55161@onelab2.iet.unipi.it>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=references:in-reply-to:mime-version:content-transfer-encoding
         :message-id:cc:from:subject:date:to;
        bh=/e6eEvoNMtd7VwsTKbwkIWDbPqSnlYiIZuyzbsdmTAg=;
        b=HTKndAmXCLR+fXfnymDj1hVt7G3EgT5RsbJiCmv3HOjVlUuTdevkngFQFWX+sVYrd+
         x1MGcH6JVGlXtWb2CAt7qzOel8zXN8Dj/nTHkaBoD4Dn0ckmSPEe73NNOOFJpBqvv43L
         x459J+ilSxHElnfp9Wgpebg8+798kXYprBlJuQ4t3mOzAzRVCh+I5z1urA9/S7oUGKsH
         FiwynlpKmYpIaLUU8aX5z1XA6TMOHYY72ymvVtGChO9IW4p0lyyqURF+R9DOJpbJ6QR+
         eGIyNfcUzzWLczdbf9OoARbyb4Rzv1HNS7koNt2sWyCCHj2+gmgCi7txYQhJg1hOUMkL
         IZGA==
In-Reply-To: <20160427063952.GA55161@onelab2.iet.unipi.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luigi Rizzo <rizzo@iet.unipi.it>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

It looks good I will sure look at it. Just curious why we need dummynet I think it use for traffic shapping right? Just trying to understand how ipfw and dummynet will boost pps? 

--
Sent from my iPhone

> On Apr 27, 2016, at 2:39 AM, Luigi Rizzo <rizzo@iet.unipi.it> wrote:
> 
> ipfw+dummynet
