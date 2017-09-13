From: "Thomas Rosenstein" <thomas.rosenstein@creamfinance.com>
Subject: Re: Change source or destination for packets arriving locally (for
 Direct Server Return)
Date: Wed, 13 Sep 2017 11:36:56 +0200
Message-ID: <E2AE9F76-4DD3-4DB2-8AB9-BA179BB1A046@creamfinance.com>
References: <3B3CC463-CF1E-4020-83E0-5C10C065DD1A@creamfinance.com>
 <CAOkSjBh4nkZ25_oxmkK6W5uFQnMUc7_nCdC+LVA90jbqhdALPA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=creamfinance.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version;
        bh=CjpFs2dZbeQJxib1LaIWFpFnqhVSRr3Kr6Q1coBkzvI=;
        b=gMKkryUiHyOXJiJ7YiEZ4zcYuvL473zQn/YS+JLHn7emrTvgdD4A8ihkmnnlhgbspW
         AWpD5PbFPde8lLN/xcBiDy6jaTu0p1jftijukQHCpP9ijoIMHc8u4wz+XlM3fulab9Hb
         AztsP6SJzwx6rswXyN5C+8YEtiZq7ceA1SUi0=
In-Reply-To: <CAOkSjBh4nkZ25_oxmkK6W5uFQnMUc7_nCdC+LVA90jbqhdALPA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format=flowed; markup=markdown; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero Gonzalez <arturo@netfilter.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hi,

I have to check it out, but in the mean time I already wrote my small 
iptables plugin to rewrite the dst-addr.

let's call it pre-alpha:

https://github.com/creamfinance/dstwrite

BR
Thomas

On 13 Sep 2017, at 11:34, Arturo Borrero Gonzalez wrote:

> On 12 September 2017 at 08:00, Thomas Rosenstein
> <thomas.rosenstein@creamfinance.com> wrote:
>> Hello,
>>
>> I'm trying to setup L3 load balancing (with direct server return) 
>> which
>> requires me to send back or receive packets with a certain src/dst 
>> address,
>> but for these packets the dst address is replaced on the load 
>> balancer, then
>> routed and are arriving on my linux container.
>>
>
>
> I guess you could do this with nftables. You can perform this kind of
> load balancing with nftables out of the box [0].
> Note that nftables should be able to work with DSCP, so you can
> combine both things (matching, load-balancing) with the same
> technology.
>
> Please, read the docs in our wiki and do some tests.  After that, it
> would be great if you come back here and report your experience :-)
> Perhaps we can generate a concrete example and put it in the wiki for
> future references.
>
> [0] https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing
