From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables equivalent of "ipset test"?
Date: Mon, 9 Mar 2020 15:48:22 -0400
Message-ID: <8d41046e-a0fe-897c-b720-dbdac1f53fc9@fhmtech.com>
References: <633ac5cf-a8db-4142-6ed2-ae335c7e12f1@fhmtech.com>
 <20200309191435.GT979@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=JpwnSxU201dWRhfykMUy68Ki9Q8vtigQTEX5fM8NSLY=;
        b=Xw0BBr8MvqIRYzrN4/jK0dBdr6RIs7enztIDhnqpIiGuNLo4XTRJZCco4/2qSerI1MmGw49An+8ls6OeunURZLfj4w+vSifFFSD0XpCg+7k5BZp9/oD6ZigSYmRwEOtiEuXJSA0XELI5MgjipDRFpOuCGYfpq1ln1jS2NIxcmds=;
In-Reply-To: <20200309191435.GT979@breakpoint.cc>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

On 2020/03/09 15:14, Florian Westphal wrote:
> Frank Myhr <fmyhr@fhmtech.com> wrote:
>> Is there a recommended way to test whether an element is a member of an
>> nftables set?
> 
> nft get element inet filter foo "{ 1.2.3.4 }"

Florian,

Fantastic! Just what I was looking for but didn't find in the man page. 
Just searched wiki, found a reference to it here:
https://wiki.nftables.org/wiki-nftables/index.php/List_of_updates_since_Linux_kernel_3.13

So kernel >= 4.15 is needed. Debian buster or stretch-backports will do. 
I tested, and it works properly for interval sets (at least with type 
ipv4_addr, don't see why others would be different).

Thanks!
Frank
