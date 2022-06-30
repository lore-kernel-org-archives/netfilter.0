From: Kiernan George <kbg98@vt.edu>
Subject: Re: Creating a map with libnftnl
Date: Thu, 30 Jun 2022 15:18:54 +0000
Message-ID: <a751cf13-8ca9-7d9d-e1d7-6f4242ae8860@vt.edu>
References: <fbaccc73-c98c-4a21-bc12-0c89b041ae32@vt.edu>
 <20220630160303.ed722cd8c3a70facdf133f14@plushkava.net>
 <20220630160628.f7bd5dd1f234d834be19aed6@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=nQ+Y7EvtUImYOewHLSWtxcvFKqeSM3zJd1+tXAMLg40=;
        b=ouXsxAbL2fqZWLOicoKILVfOpdiqhqzKKLKb6suHYZouIEEV3QZewq0sTNP0xJ3ccs
         i3ZtyYeAWsqEleXI0omrMF3MkBVVtaHMqufe9fk45+CTNdXbrsBHqT5yLpz+aFPqbMDs
         ipUw8CgfZ0A8mcl2oyDNOOAtf/bDGhSZ9VbKSE06pwRHPYQQqER+rMLjlBOZQIj4ZyGM
         L3hRlMUNHhdg9IU+XcezdlowMbeqvlXkfdaCzKpBmnM54n0XCUpqOZxPuCTEE9wypbnp
         4PgYujkk9jawP3BaPaPIQEVgV63+e2YlL9y1y3r3ayoAIKohq64tBiK+f3mn1ZZs/TlG
         4nOA==
Content-Language: en-US
In-Reply-To: <20220630160628.f7bd5dd1f234d834be19aed6@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hi Kerin,

My current ruleset is:

table netdev testtable {
         map testmap {
                 type ipv4_addr . inet_service : inet_service
         }

}

I created this through libnftnl. I tested it out by adding an element 
with the following command through the cmd line:

nft add element netdev testtable testmap {1.1.1.1 . 20 : 2.2.2.2}

This returned the error I mentioned previously. I'd appreciate an 
example on how to create a map programmatically with (I'm assuming are?) 
concatenated fields.

Thanks,

Kiernan

On 6/30/22 15:06, Kerin Millar wrote:
> On Thu, 30 Jun 2022 16:03:03 +0100
> Kerin Millar <kfm@plushkava.net> wrote:
>
> <snip>
>
>> Please specify:
>>
>> - a listing of the presently defined map
>> - the command that was issued, verbatim
>> - the shell in use, if applicable
> Never mind that last part. I missed that it was about libnftl, sorry.
>
