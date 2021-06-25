From: slow_speed@att.net
Subject: Re: Reload IPtables
Date: Fri, 25 Jun 2021 17:30:55 -0400
Message-ID: <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1624656660; bh=TQoxaQNUNVr+Lj1cEXvUO5/lEGbdhyVCHVUCc5Y7kjc=; h=Subject:To:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=nJyu2+6cNMp8VqCiAX5A03V+WLMQC8pOANWO7MBiwgU6pDV39ohYTRLsNm6Uh3t4S0/nV+5gC8YptoUOq68q4asoDyIQNzibRh8+OAZ4lraHu0N/0hnRdzM+/3VQcn13Djzr5KrQXK2pNZV6pagPxft6XnVezufIf/boivPaEO4=
In-Reply-To: <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Hajes <david@hajes.org>, netfilter@vger.kernel.org

Thank you.

I do not believe it is something one would use a script for. Rather, 
there should be a way to reload the information into memory without 
having to reboot.


On 6/25/21 4:51 PM, David Hajes wrote:
> on Debian I flushed all tables including custom tables and used to run 
> iptables bash script before I moved to nftables. OpenBSD same strategy 
> - flush and reload pf.conf
>
> if that is what you mean by reload.
>
> On 25/06/2021 21:24, slow_speed@att.net wrote:
>> What is the preferred command to reload the current rules for 
>> iptables? (Please include Debian environment, if distro-specific.)
>>

