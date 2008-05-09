From: "Andrea Ranieri" <andreran@uno.it>
Subject: Re: DNAT routing problem
Date: Fri, 9 May 2008 15:30:11 +0200
Message-ID: <3598a5460805090630m2676a18dp9f25e7ca9efb9ca9@mail.gmail.com>
References: <3598a5460805081117i7f519321y9ad85f084ba0f484@mail.gmail.com>
	 <3598a5460805090348w526f46c9v3f1fd0f0874c84db@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
        bh=lPDRtCp2dprfbmfPn6PXoADHcM5FrpcGddD6tK4TlRc=;
        b=gd95+SPbX6gwZHgaADl2tQhhRg3ciw+FsZ9EChliC0OQQKo8sc+vXuyP03DqOUsoq1yuj3kyNxjsRS7Qle2sA34TLyxgMSEqKHSNL+A5gKLTQ01rdXNsx2kPkkE2LFvtQBidzqKmolhmrfNTGl6cALQEFFKuceQ1NVjQ4IYIm+4=
In-Reply-To: <3598a5460805090348w526f46c9v3f1fd0f0874c84db@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Fri, May 9, 2008 at 12:48 PM, Andrea Ranieri <andreran@uno.it> wrote:
> On 5/8/08, Grant Taylor wrote:
>
>> NAT rules are applied to the first packet in a connection and then the
>> same action is auto-magically applied to all other packets in the
>> connection with out passing them through the NAT table.
>>
>> So what you are seeing is probably very likely based on existing verses
>> new connections.
>
> Thanks for your reply, but it seems I didn't explain my problem clearly.
> I have a connectionless flow of ipv4 packets. No TCP, UDP or any L4
> payload at all.
> So my question now is: does netfilter (with D/SNAT or NETMAP target)
> provide basic natting features without having a L4 payload, or a
> connection oriented flow is required for natting?

After a couple of other tests, I have some relevant news.

My previous tests involved a ipv4 flow going always from 10.0.5.2 to
10.0.6.2, and the results remains those I wrote in my first mail.
Now I tried to change the source IP, and finally, the natting process
begins. But obiviously with a strange behavior...

In this test I always have the 10.0.5.2->10.0.6.2 flow running, and a
10.0.5.[2 to 5]->10.0.6.2 flow. Every IP except the .2 get natted. The
.2 remains unchanged. Moreover, when i flush the nat table, the rule
disappear but .3, .4 and .5 IPs continue to get natted. I think that's
a cache problem.

It's time to put feet in the mouth, isn't it? ^___^

Cheers
Andrea
