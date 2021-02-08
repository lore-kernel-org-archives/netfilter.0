From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: Constraints on nft expressions and statements in inet ingress
 chains
Date: Mon, 8 Feb 2021 13:01:55 -0500
Message-ID: <9b17af0b-d99d-1925-ef77-d48ef5b593d3@fhmtech.com>
References: <5959d455-c6b8-acaf-bc1c-9500b4a2716c@fhmtech.com>
 <20210208163214.GG16570@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=/2bRa74YL9GxVAbHxkh3+3DtojMP+QvaMG9XXEVnQko=;
        b=DFBIu4KuiJXBjS2TOTdpqHBp2ssJMKeAxO8kW6b/cCs7fu8HsO70Ub9dmEopq0yaDyT2PIbTbvMFI6Rg+PQFUy5StHkrZCGOJ2Yjexk2D1m50zKxnpotVUici6JqhN2hmuLdLRygSLfl19vMQSZMw0O1c3cCM7esOnBNvr/+ECg=;
In-Reply-To: <20210208163214.GG16570@breakpoint.cc>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

On 2021/02/08 11:32, Florian Westphal wrote:
>> - reject statement
> Should work in recent kernels.
 >
> ... >> - packet mark
> Will be present for loopback and it can be set/assigned.
 >
 > ...
> conntrack info may be present for loopback case.
> 
 > ...
> access to l4 header will not work for subsequent fragments.

Thanks, Florian! The above is very good to know while working on my 
rulesets.

Best regards,
Frank
