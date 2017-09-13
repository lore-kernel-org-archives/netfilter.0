From: "Thomas Rosenstein" <thomas.rosenstein@creamfinance.com>
Subject: Re: Change source or destination for packets arriving locally (for
 Direct Server Return)
Date: Wed, 13 Sep 2017 16:40:39 +0200
Message-ID: <3BC60329-5E37-47FE-9B97-0F75F53E51F2@creamfinance.com>
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
        bh=VeDM99WH+v96Q3snmNnfkNOsVueNv1w+iEGDshiowus=;
        b=EW56bFltq+KO4TH/tip+TFH+Le1TFsnjIwy+R37CF5DjZakZhat6YngZyiJs9I1Hbr
         Lm5/FukANy9jmEnVj/xvjJcvpoKfNdhcPhcBe4lvRdo/CwzYvkfzc758LR1t0JPKZp59
         sl+tpbQ/fRo5I8VD5c95KDrEFRzXrkDSNW4mI=
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


Actually, I figured it out just now, the src ip of the packet is defined 
on one of the interfaces.

That's why the kernel is dropping the packet.

Is there some flag to stop it from doing that?
