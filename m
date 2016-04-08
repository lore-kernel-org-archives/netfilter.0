From: Stephan Arndt <arndt.stephan@gmail.com>
Subject: Re: Writing nftables extension / modifying packets via nftables and netfilter
Date: Fri, 8 Apr 2016 15:19:53 +0200
Message-ID: <CADe663uqyZXSC-HkCvsYH_JLzdfuuF0n0UrVoNB4JHJfQGtuWQ@mail.gmail.com>
References: <CADe663unBJZxLKgvbHh7rhZGOjmrYo8O_n4os8Boex0VcwBSvw@mail.gmail.com>
	<20160408121042.GA7121@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=XpGrIvBoVWH0sHG1ov/EnFnbM7tMB1IqLUntWSgWAtE=;
        b=Thpxr1Q309+ApGrri/LE2H9r4Cjx9xKwPjpxx6hbb++Q8lydhQI7ibL1XcBE+1/fPU
         iKwBCwdWfCJElzdVQAwqLY1tusZl8nrrU11m9CA+ux4tVJyT4ScAktr6JC/t4czIh2pD
         vNPYBBCOOvb5cvmrNklrZYVdQLyXeqT4AHvvTvJ6Yf6IkPGkC+p/A45oXrBjd/HmB6TG
         dM0+t0YPimFkuVbGbK1GI+l55A6a7btcdObXeXUdDa1X6iRK8WLP5eGIC2WRnuLpLw7C
         wDj26jbZDjgLya2OwRa6YE6RgFZdtnPitNsgqOZ9vbhRfNoue8Oph1tU6LcMRqtfMxIu
         /BWw==
In-Reply-To: <20160408121042.GA7121@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

2016-04-08 14:10 GMT+02:00 Pablo Neira Ayuso <pablo@netfilter.org>:
> So the question is, in case you need some extension, what kind of
> generic expression we could introduce so you can build what you need
> following a lego-like thinking, plugging expressions one after
> another.

I've done some more reading, and it seems that everything that I need
is probably already there. My imagined flow of work takes packets that
match specific criteria and sends them to a netfilter module to
process.
These criteria and what to do with the packets would have been
specified by custom iptable matches/targets. But after reading some
more of the nftables HOWTO pages, it seems that the equivalent of
custom matches is creating a custom chain and then jumping into that
chain when a packet matches my criterias, have I got that right? (Can
I register a netfilter module on a custom chain?)
What I still haven't found though, is how I can configure a netfilter
module via nftables. For a silly example, let's say I write a
netfilter module to change the MSS of each outgoing packet. How can I
tell this module what to change the MSS to for different connections?

I've only done a basic netfilter module so far (Inspect every packet,
then drop if some requirements are met), so maybe this is easy and I
just overlooked it?

Regards,

Stephan
