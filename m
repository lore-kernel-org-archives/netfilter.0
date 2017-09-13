From: "Thomas Rosenstein" <thomas.rosenstein@creamfinance.com>
Subject: Re: Change source or destination for packets arriving locally (for
 Direct Server Return)
Date: Wed, 13 Sep 2017 16:36:33 +0200
Message-ID: <EF187BC7-AC14-4FE5-B876-4011EE8053F3@creamfinance.com>
References: <3B3CC463-CF1E-4020-83E0-5C10C065DD1A@creamfinance.com>
 <CAOkSjBh4nkZ25_oxmkK6W5uFQnMUc7_nCdC+LVA90jbqhdALPA@mail.gmail.com>
 <DF1B4985-ED4C-4881-8A54-11310C5AA3B9@creamfinance.com>
 <CAOkSjBhPTEgftg7eOV2sRY-j0vRCjMF3W7-UwTTUW36nnp524Q@mail.gmail.com>
 <E6E3CCA0-6980-4008-A38D-9E8675590941@creamfinance.com>
 <CAOkSjBix=CoWwDG0+mUVDRu3NQ656U7g=+ZN23hJyVWzk_d26w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=creamfinance.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version;
        bh=hIeRJrwA/dpxxdiRDuzgzvJS1xM07Er3MQRU8GZqLUE=;
        b=kiz86xcWplkIvJRl9eKGNziT3tsT+h11a5SZB+SGBUWCdd+gKi0wUlM06Te1YGd4us
         HmyMeGuRiOL/ZKueslIiYhv9lPnQdZLLSNhBCMTSsJxUTmS8D+55mEe842bNyUcf57hR
         rCRfXL78OEAXq5QeXRSA9mxx1CIdjPONxXQYk=
In-Reply-To: <CAOkSjBix=CoWwDG0+mUVDRu3NQ656U7g=+ZN23hJyVWzk_d26w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero Gonzalez <arturo@netfilter.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>


>
> beware that NAT-type chains only see first packet of flows [0].
>
> In the ruleset I see a rather complex mixture of hooks/priorities.
> I would recommend to not use such a complex scheme unless you really
> know what you are doing.
> Better to simply configure a ruleset scheme similar to what is
> included in iptables, using same hooks/priorities as described in the
> docs [0].
>
> We follow a different approach in nftables than in iptables. In
> iptables, all comes pre-configured, which is easier
> but may force you to have things you don't use. In nftables all is
> open-configured, which could be a bit more complex
> if you don't try to simplify.
>
> [0] 
> https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains

Arturo, I'm aware of this, and I only used this complex scheme to find 
out WHY and WHERE my packets are getting lost.
With the structure I chose I can be sure that no other hook is dropping 
them.

Since neither iptables, nor nftables give any hint why they may be 
DROPPED by the kernel at the routing decision I have to rely on 
information from the community.
So where in the kernel does that routing decision after the PREROUTING 
hooks happen?

rp_filters are disabled by the way.
