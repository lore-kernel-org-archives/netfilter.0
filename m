From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: [libnftnl] documentation?
Date: Thu, 26 Mar 2020 05:32:01 -0400
Message-ID: <d29b4165-34cc-ab98-e2cd-d83b2cc7f815@fhmtech.com>
References: <2b42de23-1291-58b1-48d4-1863bc9772a6@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=7nUDA0j8Bghl7ahwKIiwXJkVlO2mhKv1HQIzlW0bc7M=;
        b=hVAjDRUGtg8BZPGDvytGP6nBIKbR3GVMObV1SULFypSnCZmKwgPkead1BJ9CYrNpadoJBt9sQQqAk7QZlqSvLaJD1WyBbqJ9KXZNRFcIFj5HqZe/YEOJZrdOUK6ALHQ7jP+EjdAoWDRmd9MJNgfWEI18fv1DVxuCXyivSQ+nmYk=;
In-Reply-To: <2b42de23-1291-58b1-48d4-1863bc9772a6@gmx.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: vtol@gmx.net, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 2020/03/26 04:38, ѽ҉ᶬḳ℠ wrote:
> Been trying to find some documentation in these places:
> 
> * https://netfilter.org/projects/libnftnl/
> * https://www.netfilter.org/documentation/
> * https://git.netfilter.org/libnftnl/tree/
> *
> https://wiki.nftables.org/wiki-nftables/index.php/Portal:DeveloperDocs/nftables_internals 
> 
> 
> but either I missed it - and thus appreciate a pointer - or there is none?
> 
> The aim/goal is to utilise libnftnl with json.

Do these help you?:
https://git.netfilter.org/nftables/tree/doc/libnftables.adoc
https://git.netfilter.org/nftables/tree/doc/libnftables-json.adoc

AFAIK libnftnl=libnftables, the older name just persists (confusingly) 
in many places.

Best regards,
Frank
