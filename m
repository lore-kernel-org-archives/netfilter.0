From: Born Without <blackhole@airpost.net>
Subject: Re: [SOLVED] Re: Native support of counting rules?
Date: Fri, 04 Jan 2013 06:39:43 +0100
Message-ID: <50E66B1F.3050805@airpost.net>
References: <20130102134421.GA17997@devnull> <50E43D07.50009@ngtech.co.il> <CAJZVxRkyDyZyWUBbhP+H5gv2Dk1_Jj=v4QRAheHKWEnSKTdrhg@mail.gmail.com> <50E6626B.8040705@ngtech.co.il>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=p5n09qL4nzKJjnVl/uzkDjdRQ9k=; b=NFB7pyaWlMbuRZvl7d
	J8T6ODO3vgWpvx07xVbIx3mUcxvuplLXbjZ/nnk4p/hrtH5Fre+B546ot0I+RkeI
	3chToz62hMtreM8IFvkVQj0RrXW1rWNXTjDZhaWHr6bcQao/RTTTYlmX/n9AWCgK
	jiG4ZlEL1mTyM1Qu1e+Quz8cM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=p5n09qL4nzKJjnVl/uzkDj
	dRQ9k=; b=Q3dtMqDIf2FaWoiEyAe9ZNjEd2yMSj40bf1fhw/IQXJJfXhb3obzPD
	Tti2i5QMsML+dAzcMwLV3s+7vcnFpUQBllqGUDcGS5Ck3y0+Ms0MT4dI2FU9QH9a
	OeYm907aYRyh03onQw3SSnEc69OkMfAmQps1dnY7jXCKE1phNpe/c=
In-Reply-To: <50E6626B.8040705@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: Aaron Lewis <the.warl0ck.1989@gmail.com>, netfilter mailing list <netfilter@vger.kernel.org>

On 04.01.2013 06:02, Eliezer Croitoru wrote:
> Since iptables are kind of static I think a simple script should be good
> enough.
>
> A one liner should do the trick:
> tables="filter nat raw mangle";counter="0"; for i in $tables; do
> add=`iptables -t $i -L -n --line-numbers |egrep "^[0-9]+\ " |wc -l`;
> counter=`expr $counter + $add`;done ;echo $counter
>
> You dont need to read the proc file system to know that there are only
> four tables exits in iptables.

That is not true.
There also is the security table.
And if you have xtables-addons installed, there might also be the 
rawpost table.
But any of those might not be loaded, if compiled in as loadable module.
So you might need to read /proc/net/ip_tables_names to work only on 
existing tables, without loading unwanted/needed ones.

[...]
