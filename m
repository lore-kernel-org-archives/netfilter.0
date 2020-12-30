From: "" <kfm@plushkava.net>
Subject: Re: Correction to nftables wiki
Date: Wed, 30 Dec 2020 22:37:39 +0000
Message-ID: <58b7d4f9-f7a7-dc06-01d9-d1bad5e3b8af@plushkava.net>
References: <76cb4d39d82626ab3d03df4c112ebaf6bdec17de.camel@datahenge.com>
 <5be52cd79aed99af1b11cbf1400534aa60c849d8.camel@datahenge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=g
        Cs+tP0S4cxkCUe/hgXgBCo/JnM3xL62ZsAfl47Adog=; b=ayBCg71oDeiAP46D0
        wSm5+QDyVlkOKlJACu41+KUuJeefSIlQWVyIgGgMHoQCCWOUuqN48dzGd15k4/cZ
        2ajZa33qqv1qI2iYj38jMZtK+YkyaRyM4bMDEY2/OUAEq2y8UANfKxdsp6Dy5qup
        Fl+AU532P89ziEOR5KXPz/aazdzAM6eV7oYWGgf7F5MUyc332tQRiwidjHDHg24x
        6kyMdPCeKYUbeju5JgevEhDwK09cwJnEpuBTrx48fwosXsffV7WlGm5hAUhnbZpB
        FhwuuZicQDNWZ5OxthbFd3ToMVUMcZ5LTuo69PHwu6mmGIYyPcZ4+w0lMEursxwp
        rB/Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=gCs+tP0S4cxkCUe/hgXgBCo/JnM3xL62ZsAfl47Ad
        og=; b=NvAyrxl9AqFaRvDLP/WacxzlTBdUK7b9xns6T94YSpRqgQ1LX67tr94/U
        i2pGc2XLXfatnybnv1Wgnn41ZxwVjpcTDo6AQ9xQVV8IFtW+unP5OrX1CSGwOKY7
        Y+ud63XWnZeO3asx6+pfa2c6EWbmnKiiwVQmm7hxy14zRKnH43Vh3NrtWCLuG0TB
        yyeoOObEXcdDhmmSonzdKy4iTkfhgvs6gYweImucIiB5A3CGL40rYUvQUcBDHOAw
        SYXBDALCa3dqy0PgvP1xZ6O5uwsUnbOGlNE1sAqMkrMJIFn04awExRnla96QZqHy
        EN09iNYcTQW13Z24BFg94L9H8k+IQ==
In-Reply-To: <5be52cd79aed99af1b11cbf1400534aa60c849d8.camel@datahenge.com>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: brian@datahenge.com, netfilter@vger.kernel.org

Hi Brian,

On 30/12/2020 19:17, Brian Pond wrote:
> Dear Netfilter Team,
> 
> I would like to propose a correction to the following Wiki page.
> https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Base_chain_priority
> 
> After the code block, the following sentence reads:
> 
> "If priority of the 'input chain' above would be changed to -1, all
> packets would be dropped. "
> 
> This sentence is incorrect.  All packets will be dropped, regardless of
> the priority.  Because within the same hook, a "drop" action always
> takes precedence over "accept".  Even if the "drop" is in a chain with
> a later priority.
> 
> * I have attached an example illustrating this.  If you load this
> ruleset with nft, browsing the web is impossible.  Regardless of
> whatever priority value you choose.
> * I have previously submitted a bug report about this behavior.  I
> don't believe Netfilter was intended to work this way.
> 
> Either way, I feel the wiki should be updated for accuracy.  That way
> readers understand how Netfilter is currently working, with regard to
> drop and priority.
> 
> Please let me know if you have any questions.  I would be happy to
> discuss further, meet online, etc.

See the following edit.

https://wiki.nftables.org/wiki-nftables/index.php?title=Configuring_chains&diff=610&oldid=534

-- 
Kerin Millar
