From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables carefully open the related-flow: ct state related ct
 helper "ftp-21" ...
Date: Mon, 15 Mar 2021 07:18:33 -0400
Message-ID: <33016e73-20fc-33bc-248e-6e74bc9b1c63@fhmtech.com>
References: <ae754fef-dbae-6a71-b7d5-b730bc21c363@hafenthal.de>
 <052d6523-bf4b-fadf-b95d-15bd63457cef@fhmtech.com>
 <1b961364-e014-57c9-5849-eb67c05b3a76@hafenthal.de>
 <5f52d13e-d135-7cb2-707f-2037ba041c87@fhmtech.com>
 <375f428e-f37b-551a-e09d-1024f00abb3d@hafenthal.de>
 <20210308210518.GC10808@breakpoint.cc>
 <624d2626-2fdc-a1d8-825c-81891488bf9d@hafenthal.de>
 <af7cddce-b8cf-1a01-1b71-130ea452c84b@fhmtech.com>
 <20210309172428.GF10808@breakpoint.cc> <20210309210606.GA6016@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:Subject:From; bh=2y346OCLfa/1TpAG2Ws84OZAxMTWva9dfvvjkkYYmI8=;
        b=OqtyAP0YGuZyT+6OF7XL74/xhrYc2fwNdUibYhU6wF1NhmIJ93YlIduNApawj894taZfuf4P7hH2+6JaxtZdcLolFvuZle+Wf0iM4yQhrNo8aA/3RVnZIffE+T4xQ2hhykOrKKDGlK9rBfGMdrW15hfmsrqZMV0l3bfSiLu2nGQ=;
In-Reply-To: <20210309210606.GA6016@salvia>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>
Cc: Stefan Hartmann <stefanh@hafenthal.de>, "netfilter.org" <netfilter@vger.kernel.org>

> On Tue, Mar 09, 2021 at 06:24:28PM +0100, Florian Westphal wrote:
>> The explicit helper objects were done this way to allow defining
>> multiple helpers wuth different settings.
>>
>> There are helpers that can be tuned by options and users might want to
>> use different settings in each.

So a helper definition

ct helper sip-udp {
     type "sip" protocol udp;
}

can configure options sip_timeout, sip_direct_signalling, 
sip_direct_media, sip_external_media? How?

Thanks,
Frank
