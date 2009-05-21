From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: tc and priority
Date: Thu, 21 May 2009 15:42:01 +0200
Message-ID: <4A155A29.1020602@duet.it>
References: <4A142FF7.1050700@duet.it>	 <38db14850905202353r3c494d15se7f53f4b508f1ba0@mail.gmail.com>	 <4A150D46.6090806@duet.it> <1242896445.4763.1.camel@casper.meteor.dp.ua>	 <4A15376F.4080401@duet.it> <1242906643.4763.9.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1242906643.4763.9.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi!
> If you mean why connB get traffic - then it's probably connA doesn't
> *always* fill its bandwide which makes it possible for connB to send.
>
> Try to fullfil connA with several mass downloading connections
How I can fullfil connection A queue?
I run 4 connections A and 1 connection B, and this one continue to send 
packets... at about the same rate than the others.

Fabio



