From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: bftables and scripts question
Date: Sat, 24 Dec 2022 18:30:30 +0100
Message-ID: <eaebbb56-1f8a-dd51-a15b-06ec3ba21f89@thelounge.net>
References: <b928e785-3108-088f-905f-3228e742b165@zoho.com>
 <e3b5ff3f-b6f2-4b13-08ec-a26b94ff2d38@thelounge.net>
 <fd6e2afc-f1e3-21cf-b124-944a248ead33@zoho.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <fd6e2afc-f1e3-21cf-b124-944a248ead33@zoho.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: ToddAndMargo <ToddAndMargo@zoho.com>, netfilter@vger.kernel.org



Am 24.12.22 um 05:35 schrieb ToddAndMargo:
> On 12/23/22 19:40, Reindl Harald wrote:
>> not a single line above is iptables specific at all
> 
>  >>  <lots of iptables>
> 
> I removed them as they were not part of the question.
> There were about eight of them

and everything you left has nothing to do with iptables or nftables - 
come on: how you you imagine a converter would rewrite your odd bash 
scripts?

you wrote your bash script for iptables
you write yours for nftables

and with some luck it ends with way less redundant rules as your current 
ruleset which is simply unmaintainable and unauditable
