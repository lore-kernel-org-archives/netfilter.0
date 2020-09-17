From: Jacek Kowalski <jacek@jacekk.info>
Subject: Re: nft snat with maps for port ranges?
Date: Thu, 17 Sep 2020 10:26:48 +0200
Message-ID: <16e35ff6-6b67-c325-cc56-e1635426a0f7@jacekk.info>
References: <5f62fa2a.1c69fb81.c81b.e621SMTPIN_ADDED_MISSING@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk-info.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/4b6Is0aQ213RCIlEZbuF/pNdskBC7e+Rg8QonlhRxU=;
        b=Pj9y8YvXyOyJuN9vUYwxYZfnhRJ5UKklOO+1fLwD57qVwSSzQ1aIOts4FML1vApDwp
         nCR4MGPAsqJtG6OQOAjZ0ml/5AU6k0f9kdyPS4wXhK4Q7biiaRPKAK3LagB4+mSVPswm
         tnEoGDBYuli0m/k74rBcgMk+ht1fP2WdB1/ATb9eOIKcM/RvwPDSTmHPlbTKZauPIzjH
         JMvonHtluCuFiGKbqv3wFvGEWueTCxOkx/Y3IppPqwcKmiOxKkXMLoThpF9ERGioaJvS
         WWfXM0EX9eYZLeWwuhg5M//TaznIZhBUdmcWSNuaftcyhr2oS99UMFQp+w0ev8LuBq9A
         XM6g==
In-Reply-To: <5f62fa2a.1c69fb81.c81b.e621SMTPIN_ADDED_MISSING@mx.google.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david@hajes.org
Cc: netfilter@vger.kernel.org

Hi,

> Did you try?
>
> x.x.x.x:10000-10999,
> y.y.y.y:10000-10999,
> ....

If you mean:

meta l4proto tcp snat to jhash ip saddr mod 2 map {
  0 : IP1,
  1 : IP2
} : ip saddr map {
  10.1.1.1 : 10000-10999,
  10.1.1.2 : 10000-10999,
  ...
}

then yes, the error thrown is:
"Error: syntax error, unexpected -, expecting comma or '}'"


> Or port range as variable and set just for IPs
>
> nft .... saddr:$ports ...

Either I don't get what you're trying to suggest or it doesn't simplify
anything over iptables. I still need the same number of rules PLUS extra
variables (which could be replaced with inline expressions).

-- 
Best regards,
  Jacek Kowalski
