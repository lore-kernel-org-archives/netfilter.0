From: "Rob Sterenborg (Lists)" <lists@sterenborg.info>
Subject: Re: Compiling nft-0.9.6
Date: Mon, 28 Sep 2020 09:55:22 +0200
Message-ID: <578ffef9-4918-bde3-347d-1d85fa4ad62a@sterenborg.info>
References: <95edb5b7-7db6-47d6-2942-1d17b27c2ac3@sterenborg.info>
 <20200927122147.GA2297@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sterenborg.info;
         h=content-transfer-encoding:content-language:content-type
        :content-type:in-reply-to:mime-version:user-agent:date:date
        :message-id:from:from:references:subject:subject:received
        :received; s=sel1; t=1601279722; x=1603094123; bh=9pqaBZPXTeY/FH
        jguBSReSB+M6DgqZVmxXG94BC1n74=; b=dZ5mcEPeP+UfaMA8OEBDb0BQ81nRaN
        aOwto+LjkUvYOIFoeb956wlplDIX5kpnbiSv0HAAoj0qAZg559V2GJP0ECD6Iy0D
        mtdxNnMYKbkH3hJTGY47DMc8QJO8A7sg2dndOEwa4f/h39rItv/WUsvmiUbJ5zfC
        VZ5o/qgTH9kyw=
In-Reply-To: <20200927122147.GA2297@salvia>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@vger.kernel.org>

On 27-09-2020 14:21, Pablo Neira Ayuso wrote:
> Hi,
> 
> On Sun, Sep 27, 2020 at 01:57:45PM +0200, Rob Sterenborg (Lists) wrote:
>> I'm on CentOS 7 and trying to compile nftables 0.9.6.
>>
>> For requirements I downloaded the sources from https://www.netfilter.org/pub
>> and:
>>
>> - I compiled and installed the latest libmnl-1.0.4 in /usr/local.
>>    (./configure && make && make install && ldconfig)
>>
>> - I compiled and installed the latest libnftl-1.1.6 in /usr/local.
>>    (PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ./configure && make && make
>> install && ldconfig)
>>
>> When configuring nftables-0.9.6 it says that libmnl is okay, but it requires
>> libnftl-1.1.7:
>>
>> ================
>> checking for LIBMNL... yes
>> checking for LIBNFTNL... no
>> configure: error: Package requirements (libnftnl >= 1.1.7) were not met:
>>
>> Requested 'libnftnl >= 1.1.7' but version of libnftnl is 1.1.6
>> You may find new versions of libnftnl at
>> http://netfilter.org/projects/libnftnl/
>> ================
>>
>> At the time of writing there is no libnftl-1.1.7 in
>> https://www.netfilter.org/pub/libnftnl/ so I checked Git. In git there is a
>> 1.1.7 tag, so I cloned the repo and switched to the libnftnl-1.1.7 tag.
> 
> There is one here:
> 
> http://www.netfilter.org/projects/libnftnl/downloads.html
> 
> 2020-Jun-05: libnftnl-1.1.7
> 
> libnftnl-1.1.7.tar.bz2 : GPG signature (key) : sha256sum 20dbc13f11004aea2c9e479cfb90359cb11fe3446c3140811c18e4ec1648ed8f
> 
> I just resync the /pub directory so you can also find it there, the
> robot failed to rsync the folder for some reason.
> 
>> When configuring, it returns a syntax error:
>>
>> ================
>> ./configure: line 4141: syntax error near unexpected token `LIBMNL,'
>> ./configure: line 4141: `PKG_CHECK_MODULES(LIBMNL, libmnl >= 1.0.4)'
>> ================
>>
>> I don't know how to fix this..
> 
> You have to install pkg-config.

I found posts mentioning this so I checked to be sure. pkg-config was 
already installed, and also updating it to the latest version didn't help.

Thanks for this. I just successfully compiled and installed 
libnftl-1.1.7 and  nftables-0.9.6.
