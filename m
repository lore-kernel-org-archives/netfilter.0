From: George Shuklin <george.shuklin@gmail.com>
Subject: Re: Best practices on iif usage at persistent ruleset
Date: Tue, 4 Jul 2023 16:04:27 +0300
Message-ID: <66270f9c-6465-62bd-e100-c6615df86ac2@gmail.com>
References: <ede291f8-c556-0d0c-d598-7c69f387ed74@at.encryp.ch>
 <20230703152544.GD7043@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688475871; x=1691067871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZnRdhDkmL1w6jSfpTgWU+I23XDs9FTL4SzTUacQRykQ=;
        b=d//ZXXE7AyojOHzwZ3D/5UE8rTCIIj9EUwsomQLrE30uA9RrGImRJrAS35MLzTCNw7
         ZSe9YK4YzS95huD5x6q7jJAywrV7RVq2+t4ZFRVIRyLKKUTPHt5kU7QLl443A5Ulvl2p
         A/Vtkg8iNYBbliKcwYlkhWGZzd7aMRmJeaY0lWIb+IBTUIwHtv5aepM4IjW71EJUOcZN
         idvRMgTsaxM2uiC/RDhkJewYt5Ak0GzSM7Ay2Qx1sZcmtQKROrTTFZzDKireTeX08Srx
         3ZND11h0M7znJqTATY0BunqAo1oKFPhysc9Fgpa4D1r2fkanO0UXCFuerpSMCoNzdx3p
         DZVg==
Content-Language: en-US
In-Reply-To: <20230703152544.GD7043@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Westphal <fw@strlen.de>, Serg <seentr@at.encryp.ch>
Cc: netfilter@vger.kernel.org

On 03/07/2023 18:25, Florian Westphal wrote:
> Serg <seentr@at.encryp.ch> wrote:
>> I know that there is iifname as a safe alternative, but as far as I know it
>> has huge performance drawback and thus its' usage is discouraged in my case.
> Not really. Its copy and compare 4 bytes vs. copy and compare 16 bytes.

Is iface name lookup o(1)?

