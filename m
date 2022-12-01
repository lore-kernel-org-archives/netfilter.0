From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Which of these 2 rules will consume more CPU? Please guide.
Date: Thu, 1 Dec 2022 13:11:28 +0100
Message-ID: <95a50c26-07d7-3da3-f36c-1cf98a8219b6@thelounge.net>
References: <c8a98a59-7ff1-6a2f-f579-d604848074d3@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <c8a98a59-7ff1-6a2f-f579-d604848074d3@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Amish <anon.amish@gmail.com>, netfilter <netfilter@vger.kernel.org>



Am 01.12.22 um 12:32 schrieb Amish:
> But conntrack table itself can have 5000-10000 entries at its peak. 
> (assumption)

irrelevant because ctstate rules don't iterate the conntrack tables on 
their own - ctstate is known implicit because conntrack runs anyways 
unless you mark packets in the RAW table
