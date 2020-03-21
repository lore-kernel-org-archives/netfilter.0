From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables 0.9.3, sets with concatentation
Date: Sat, 21 Mar 2020 10:24:21 -0400
Message-ID: <1fc782a6-3e76-1a8d-e8fa-4dede579458c@fhmtech.com>
References: <10a01f25-84fa-fa19-c10f-7c530ef9f10c@hafenthal.de>
 <3c04f9dd-85a1-7bc8-0b8d-72a5afb24a5c@hafenthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=gyFU+M2K29gKfo6DfKR2s741n4G6j7MycsF++5FL1l4=;
        b=AnBsxiOVXcR7h08slPnXtVM3RSQJwdlL8ay8yslTuskeWmSD3EF5ksVAJmvRWsCF+2+C1gOKMiw/bYmHt75Tys/bO2kTcjH7awIDRji2xPgJXbRbMAvDwwOSVFdTCxMlNkfN8KZY3j+L1v4mHa5zFW00/ydwfVJljcjn1/wa0gE=;
In-Reply-To: <3c04f9dd-85a1-7bc8-0b8d-72a5afb24a5c@hafenthal.de>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stefan Hartmann <stefanh@hafenthal.de>, "netfilter.org" <netfilter@vger.kernel.org>

On 2020/03/21 06:17, Stefan Hartmann wrote:
> Thank you Florian and Frank for your suggestions. Yes, I found it now 
> also in the man page under "RAW PAYLOAD EXPRESSION".
> 
> I tested step for step:
> 
> ip daddr $IP4_IF2 meta l4proto {udp, tcp} @th,16,16 {69, 23} accept
> 
> ip daddr $IP4_IF2 meta l4proto . @th,16,16 {udp . 69, tcp . 23} accept
> 
> ip daddr $IP4_IF2 meta l4proto . @th,16,16 @CONCATENATED_SET_3 accept
> 
> and verified with netcat - it is functional in this way.

Thanks for confirming that the above work.

And incidentally thank you for prompting me to look up character length 
limits on set names and other nftables objects. After cutting my 
firewall teeth using ipchains I'm leery of longish identifiers. AFAICT 
limits were/are:

ipchains: 8 characters (!)
https://www.tldp.org/HOWTO/IPCHAINS-HOWTO-4.html

iptables: 29 characters
https://github.com/torvalds/linux/blob/master/include/uapi/linux/netfilter/x_tables.h
   #define XT_EXTENSION_MAXNAMELEN 29

nftables: 256 characters
https://github.com/torvalds/linux/blob/master/include/uapi/linux/netfilter/nf_tables.h
   #define NFT_NAME_MAXLEN       256
   #define NFT_TABLE_MAXNAMELEN  NFT_NAME_MAXLEN
   #define NFT_CHAIN_MAXNAMELEN  NFT_NAME_MAXLEN
   #define NFT_SET_MAXNAMELEN    NFT_NAME_MAXLEN
   #define NFT_OBJ_MAXNAMELEN    NFT_NAME_MAXLEN


> Could there be issues with conntrack, nat, etc with this approach?
> I will test it in the next days.

I wouldn't expect so, but please report back.


> Firstly I will start with separate UDP and TCP service groups.

Sounds reasonable to me.


> Nb. I use separate ipv4 and ipv6 tables, because they are really 
> different protocols. In my experience the mixing leads often to 
> overlooked security flaws - I am working as pentester occasionally.

Thanks for your observation.

Cheers,
Frank
