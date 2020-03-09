From: "" <kfm@plushkava.net>
Subject: Re: nftables equivalent of "ipset test"?
Date: Mon, 9 Mar 2020 19:50:18 +0000
Message-ID: <2b844dbe-2760-ca42-1ace-41593b9fa984@plushkava.net>
References: <633ac5cf-a8db-4142-6ed2-ae335c7e12f1@fhmtech.com>
 <20200309191435.GT979@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=g
        7O5A9iDNkqOXyPriVq9ChP2ngh/FvEIk55ne+M24aM=; b=juFLA036wRsAfqoPs
        3+FeVqA+/9oGQJ7UuvRjOuhbN/KhdHAWDnyRHvjPmUH/VVPh/3Mahpey4wXMoE2L
        OdOban5kfTOgAYfvZlr4A4lxvCxfIzM7qkdOAQlN2D5l40pd6az/f4qroQVKZzUO
        qXnl/jS2/q70tKKyWz8P2qL9LtQGVWHVpyUlqwMArrWq/JoS3hp7lIOnheZXWiyP
        MQJXS5GP7jlGXJxMQlwl1T/5z2CorEgahk1EQq3mqcOQOjLgt6LHmFGlMmwOpHVN
        mumGGdF1b0K9MPzqWhPVCrdE+V9GIq/YZ7lEXp6djANCYLym1bhikhQKQyrVkcSO
        IQ1Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=g7O5A9iDNkqOXyPriVq9ChP2ngh/FvEIk55ne+M24
        aM=; b=Jg/r4Ayw/4ByaqzXdyH1PQviz0bWjlWGJiRyZYRlO9YivedszJdEy63HW
        z26VPf+Nd3TLUNRKPpWDdPPTJniLh7k7FMhR1EsBoCXp1ieQnR8LRie8ntrnPohK
        dspfDQ/7VDB7dZ3eCSFyujnOgdCMJkvXsF34U0hfX54siUZbMvNysq3TDFxGCa8b
        W/VUIcOiz4E1/wTlXkKl7b7Kusk6oYuPt4AkWpTqwM3MXQVxW4Es2bvg5cvoPiNV
        xGzilQIQZXg4IqA+fQhGSHZpkfnpdbuzMSBEjhAkkbmXHMgilRfU0LNB82Yt2H/5
        gPEqTKyt8j4Uu3TpN5SVSQSJwu8XA==
In-Reply-To: <20200309191435.GT979@breakpoint.cc>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>

On 09/03/2020 19:14, Florian Westphal wrote:
> Frank Myhr <fmyhr@fhmtech.com> wrote:
>> Is there a recommended way to test whether an element is a member of an
>> nftables set?
> 
> nft get element inet filter foo "{ 1.2.3.4 }"

Excellent. Thanks.

-- 
Kerin Millar
