From: Pierre-Philipp Braun <pbraun@nethence.com>
Subject: Re: failing fail-over - commit still in progress
Date: Fri, 11 Aug 2023 11:58:46 +0300
Message-ID: <131643d8-c16d-a4b9-53a8-ed56881ef728@nethence.com>
References: <910b44e4-06e8-19d6-45f0-06f886a2e812@nethence.com>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nethence.com;
        s=aug2022; t=1691744324;
        bh=vWkol8gsyh57TmFXyppDAQNQ5HMNsD3kOou+ZBR6IV8=;
        h=Date:Subject:From:To:References:In-Reply-To:From;
        b=Vssdj8uaZXogvmZ2209pAU1Ee0sR3e2JuNhuqNOicp/rPY7i99S5zu5sXWIUun587
         Q8axUWuPqoo/x52xb5sY85M1fTFILnS+2anZyzKI21T7pj5DWVbjFv6LWWxf4Rdopo
         QuXUE0LSWyppEPEurOLKP4Mwozx6EwfBNEuS469DX9Q+JXIUVTcrdneuRj2LzMcLIl
         xnZVyhhnuMv3R8Rky4D3+oT0Ottqf8zkS4SNWqB5eWqM3Re3e363RwHb+BQO2HKJOR
         PZGQ/61pb9c8hlwbuICMw1a/Wbm9OFpOv9RiO8OwP38qp/wLSUDz1kaiqy4xopmPDB
         14irfLh30uH4Q==
Content-Language: en-US, fr
In-Reply-To: <910b44e4-06e8-19d6-45f0-06f886a2e812@nethence.com>
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


> nftables.conf:

==> same on all nodes but the outbound external IP
I also tried with the external vrrp vip itself but that won't change 
anything, as we're considering inbound traffic fail-over issue.

> keepalived.conf:
> ...
> ==> same on all nodes, letting vrrp do its own election...

> conntrackd.conf:

==> same on all nodes but the UDP IPv4_address bind and destinations.

