From: Matt <lists@killock.net>
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Wed, 08 Jun 2022 12:37:13 +0100
Message-ID: <a4ccbbb1077d7c5a281ed718d6f62809@killock.net>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>
 <010201812a0fb624-e64464be-4c31-4d01-afb6-1cbfab70e333-000000@eu-west-1.amazonses.com>
 <60e26dbd-93a8-1c2a-5204-66bbdffb1291@thelounge.net>
 <c4a18871-d4e7-ce65-eaaa-55c58b230077@gmch.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=killock.net; h=
        user-agent:message-id:references:in-reply-to:subject:subject:to
        :from:from:date:date:content-transfer-encoding:content-type
        :content-type:mime-version; s=dkim; t=1654688233; x=1657280234;
         bh=iIujdfPZPqCgvuGDiujJgG90eB/gUfuPeF6gAiVqXbQ=; b=lPq2L4whSrz/
        /ygu4pkn6+UW7xpzQSbt8h2su5l/umRnu2VNGwOEO/NSs+5vAUW7X7YyYl4i/WDc
        xQGeAOtw8bkhqOWdzVD8s4dl8X6rEWKkDD620z5MCLcNg2Yw5IgeEeW+eX2bxD07
        DoFVeo9a3dnrs7X3HGKNs7dtDZAIOrU=
In-Reply-To: <c4a18871-d4e7-ce65-eaaa-55c58b230077@gmch.uk>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 2022-06-08 11:38, Chris Hall wrote:
> For input such as "-s 10.0.0.2/24", the 10.0.0.2 simply isn't a valid
> network address for a /24 network.
> 
> I agree: the parser should detect invalid input and reject it.  I can
> see no good reason for being sloppy here.

If someone uses 10.0.0.2/24 but meant 10.0.0.2/32, then just omit the 
/24 or /32 - it's not required.

'-s 10.0.0.2' works fine

Thinking of all the iptables firewall scripts that could be in use right 
now, and would be affected by a change that stops accepting 
'10.0.0.2/24' as acceptable, and the disruption that would cause, 
expecting it to be changed is unreasonable.

If you mean to write a rule for a single IP address then just use that 
single IP address, don't use a subnet suffix. Get into that habit 
instead.

Matt
