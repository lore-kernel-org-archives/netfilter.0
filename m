From: J Webster <jw.jwebster@gmail.com>
Subject: Re: How to restrict torrent download  ?
Date: Thu, 16 Feb 2012 20:01:42 +0000
Message-ID: <4F3D60A6.2040803@gmail.com>
References: <20120216160904.2ea59e26@shiva.selfip.org>  <1329389715.3296.12.camel@ns014530.dcyb.net>  <4F3CE276.4010500@cloudways.com> <20120216171502.78212a3e@shiva.selfip.org>  <20120216171909.3a3cd4c1@shiva.selfip.org>  <1329393715.3296.18.camel@ns014530.dcyb.net> <1329411784.18690.463.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=bExT4QA0FHUGO2UjEk023q9czrtFHFuzA3PPV7q/fHM=;
        b=nJEtBtmy8KWE8PpOOobSynCpaSpfKLMKu0305GzJvAJV4avSmiTdSn10h82tvzrVyU
         kloHLr58C4Y08p+MXrIr8ekkEA+6QJPstaa4vwNfpbWy1bAtRUynIyELusJd8KnQKNwI
         RaMeVoWIY/kF6J6QGitCJSp5Vo4KHCsD/T7K0=
In-Reply-To: <1329411784.18690.463.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Will this work on CentOS 5?
How important are the kernal and iptables versions to implement it?

On 02/16/2012 05:03 PM, Andrew Beverley wrote:
> On Thu, 2012-02-16 at 13:01 +0100, Rob Sterenborg (lists) wrote:
>> I think
>>
>> # man xtables-addons, Section ipp2p
> I believe that ipp2p is no longer maintained; their website recommends
> openDPI instead. I've never tried it myself, but it looks promising.
>
> Personally I use the rather brutal technique of looking for several
> connections to high port numbers from a single client. I dare say there
> are false positives, but it works for me.
>
> The details for that are here:
>
> http://andybev.com/index.php/Fair_traffic_shaping_an_ADSL_line_for_a_local_network_using_Linux
>
> Andy
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
