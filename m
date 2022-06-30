From: Kiernan George <kbg98@vt.edu>
Subject: Re: Creating a map with libnftnl
Date: Thu, 30 Jun 2022 15:59:12 +0000
Message-ID: <cc75919c-63ad-7255-1c60-63f266ba244c@vt.edu>
References: <fbaccc73-c98c-4a21-bc12-0c89b041ae32@vt.edu>
 <20220630160303.ed722cd8c3a70facdf133f14@plushkava.net>
 <20220630160628.f7bd5dd1f234d834be19aed6@plushkava.net>
 <a751cf13-8ca9-7d9d-e1d7-6f4242ae8860@vt.edu>
 <20220630165409.7c3d0d1920ba9163ab057386@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=u7rJdPaHmaJ5mINvqzO4xiDG2B524O336Xow7wnOVkI=;
        b=BPg3D6NeHMDyikVJXDVQSHCF00X7HiZakg2BQFpgMS47X6zXdAZ3VtAgkjGVXMYrQR
         XJtfYv96POUmOak2gdsM/CcyMP4CxQg0JimOXLgq5gPa+uIIUd361wGZdZrWl7qLbhFY
         AeQumc95TLJy6RIDXQS1s5VI9+wR9UtWNjSfW0D2vYW4InqmrcuLCKYMJ50BKZY5X2RV
         LSEI9Psgosh1bxjvn3u7i5eX30nSUtGR24blcu1FFY+ow7bICsIdu4mkNahIqW+ZdJfa
         J1nHmK0Pn9DOyRDDUqfG5ObxbLgevYTGhwv0pPSRrKY3GRZ3bdpvTv76lbGwS5XRZrET
         tZzw==
Content-Language: en-US
In-Reply-To: <20220630165409.7c3d0d1920ba9163ab057386@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

That's actually what I had, I got screwed up when copying it over. 
Regardless, do you know how to set that up correctly with libnftnl?

On 6/30/22 15:54, Kerin Millar wrote:
> On Thu, 30 Jun 2022 15:18:54 +0000
> Kiernan George <kbg98@vt.edu> wrote:
>
>> Hi Kerin,
>>
>> My current ruleset is:
>>
>> table netdev testtable {
>>           map testmap {
>>                   type ipv4_addr . inet_service : inet_service
>>           }
>>
>> }
>>
>> I created this through libnftnl. I tested it out by adding an element
>> with the following command through the cmd line:
>>
>> nft add element netdev testtable testmap {1.1.1.1 . 20 : 2.2.2.2}
> The type declaration should be as follows.
>
> type ipv4_addr . inet_service : ipv4_addr
>
