From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: What is so special about 172.31.254.254
Date: Wed, 04 Apr 2012 08:55:26 -0700
Message-ID: <4F7C6EEE.4090305@mailinator.com>
References: <4F7C6804.8090702@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F7C6804.8090702@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter list <netfilter@vger.kernel.org>

On 04/04/2012 08:25 AM, G=E1sp=E1r Lajos wrote:
> Hi list,
>
> I have a strange scenario.
> For test reasons I had setup two PC-s.
>
> 1. 172.31.254.1
> 2. 172.31.254.254
>
> Netmask 255.255.255.0
>
> They do not see each other...
> But if I change the second IP (for example to 172.31.254.253) then it
> all good...
>
> What am I missing?

Hi Swifty.

Could it be that x.x.x.254 is somewhere defined as a default gateway?
