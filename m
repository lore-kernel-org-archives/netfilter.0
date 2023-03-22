From: Tim Mooney <Tim.Mooney@ndsu.edu>
Subject: Re: rate-limit ssh for both IPv4 and IPv6
Date: Wed, 22 Mar 2023 14:44:54 -0500 (CDT)
Message-ID: <ea51ee39-44b8-d7e0-a88e-4f16ebb8f3__25356.8767964438$1679514328$gmane$org@ndsu.edu>
References: <783937f-4c3b-4520-eb7f-3334ffcdfa0@ndsu.edu> <77af66b9-38bd-4f5b-b0b1-f0c063a171e5@app.fastmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <77af66b9-38bd-4f5b-b0b1-f0c063a171e5@app.fastmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
Cc: netfilter@vger.kernel.org

In regard to: Re: rate-limit ssh for both IPv4 and IPv6, Kevin P. Fleming...:

> On Wed, Mar 22, 2023, at 14:28, Tim Mooney wrote:
>> With my current experience level with nft, it's not clear to me how to
>> adjust a single rule that handles only IPv4 with a set to do what I need
>> for both IPv4 and IPv6 connections to ssh.
>
> Do you need to use a single rule? Since the rate-limiting is
> per-source-address, there's no need to have them mixed together. Two
> rules, one each for IPv4 and IPv6, with their own sets, should work
> fine.

For my purposes, two rules would be fine!  Two separate rules are probably
going to be easier to understand for my coworkers anyway.

Thank you!

Tim
-- 
Tim Mooney                                             Tim.Mooney@ndsu.edu
Enterprise Computing & Infrastructure /
Division of Information Technology    /                701-231-1076 (Voice)
North Dakota State University, Fargo, ND 58105-5164
