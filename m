From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.6 released
Date: Tue, 24 May 2011 12:09:01 +0100
Message-ID: <4DDB91CD.3080003@googlemail.com>
References: <alpine.DEB.2.00.1105241039080.1846@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=0ZxCxInsPHTHxCPhBiTwxBFjcDR/wjxtyn2YPpJAPD8=;
        b=G2oZlKmci+hrN/r60txKcp0sV3Ss/sdtxPEENg6j2PbH2m0j2sW+6ejXit9k4mmmV+
         hPs5KwXrsL3HetekNFgmU3vxcmQuw+tgVzLnXbSHSoXE65VmV/Fb8F0S4rSFgyggEoa3
         0Cem49y3GXZmoARD1FBZFMHPfROrNg46Hk0Uo=
In-Reply-To: <alpine.DEB.2.00.1105241039080.1846@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


> I thank to Mr Dash Four for his tireless testings and helpful reports.
>   
I thank you for your continuing development of this great tool which, at 
least in my case, hugely improved the stability and performance, as well 
as decreased the maintenance needed on all my systems as a direct result 
of employing this great tool!

> The next ipset package release will come with code simplifications, which 
> mean dropping some support:
>
> - iptree and iptreemap type support will be removed, because the automatic
>   conversion to hash:ip is not fully backward compatible. The hash:ip and 
>   hash:net types can be used instead.
> - kernel version support below 2.6.37 will be dropped, to make code
>   maintenance easier and more straightforward
>   
What are your plans with regards to the last point? The reason I am 
asking is because I am still on .35 (the last "stable" kernel released 
by Fedora) and I might not be able to use new releases if you introduce 
this restriction.

Also, would you consider my suggestion to include the number of members 
registered in a set to be displayed in the set headers (something like 
"Members: 15156") - this would help with managing the number of members 
in that set, which would be particularly useful for sets with large 
number of members.

