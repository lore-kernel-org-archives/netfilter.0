From: Steffen Weinreich <steve@weinreich.org>
Subject: Re: nftables stateless NAT in raw table mangles fragmented UDP
 packets
Date: Tue, 4 Jan 2022 20:41:23 +0100
Message-ID: <8ebd2425-7cef-8d75-784f-a86517a52dc8@weinreich.org>
References: <cdb7af33-1e07-05b7-a9d9-142d06d9cbfe@weinreich.org>
 <Yc8Hpu/5LPyT5HIU@salvia> <Yc8H9sHapPLHKWXV@salvia>
 <6df4612e-717e-9392-97f7-724c006a64f7@weinreich.org>
 <b68d1a2f-b930-a1dc-df5f-5ed79af18497@weinreich.org>
 <20220104184149.GA938@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weinreich.org;
        s=dkim; t=1641325284;
        h=from:subject:date:message-id:to:cc:mime-version:content-type:
         content-transfer-encoding:content-language:in-reply-to:references;
        bh=269eIByxAyrb36EtQWmYd1lWmY8Ab18iWqNC5UAEvD0=;
        b=WrWzziZmzeVqviGZ82ZkQLi0b0lJSm+99JQ12aeDBRx+Ght70zQRjCcGuynT7Hkf50mC4G
        viOSmIGp69K0namXX3bJ9AD4GPiYdHkkLz4UZu1ezZq3HQDMbMePPFxwOHWkzfxEmQNjqF
        P1+X23U5HznTcw3Vf8HYGHWSU3OhzDLKxbgZQvmCA3d3cDuduKFOvKO3/UVhgbaWp1G5mN
        H8iYO/D2Y7aDaPwvC6gwRoX6RVQOBADaZOYp0yIrdcvKCcsNxr22TMVI30kRnKoxq7hxNd
        OzQZgVmdCJFxh4cSCal/MwAYGSAXMiTLcFb1R5ndEZZobqFiIy+eCVhXooU0bQ==
In-Reply-To: <20220104184149.GA938@breakpoint.cc>
Content-Language: de-AT-frami
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Hi Florian,

> You can substitute it with 'pkt->xt.fragoff'.

Many thank for the prompt hint! Using this on 4.19 get the kernel
compiled and the issue is also gone!

cheerio

Steve

