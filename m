From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: What is so special about 172.31.254.254
Date: Wed, 04 Apr 2012 20:52:02 +0200
Message-ID: <4F7C9852.70206@freemail.hu>
References: <4F7C6804.8090702@freemail.hu> <4F7C6EEE.4090305@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F7C6EEE.4090305@mailinator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Wright <mike.wright@mailinator.com>
Cc: netfilter list <netfilter@vger.kernel.org>

Hi Mike,

>> 1. 172.31.254.1
>> 2. 172.31.254.254
>>
>> Netmask 255.255.255.0
>>
>> They do not see each other...
>> But if I change the second IP (for example to 172.31.254.253) then it
>> all good...
>>
>> What am I missing?
>
> Hi Swifty.
>
> Could it be that x.x.x.254 is somewhere defined as a default gateway?
The default gateway for the first PC (172.31.254.1) is 172.31.254.254...

Swifty

