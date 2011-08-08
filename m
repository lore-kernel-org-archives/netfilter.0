From: Mark Ruth <mrkrth90@gmail.com>
Subject: Re: Trying to achieve fail over to multiple DNATed destinations
Date: Tue, 9 Aug 2011 04:15:43 +0500
Message-ID: <CADCwhZm7CHd47D-Hp2d2=BRusYPCqFL4dMT93YWxop0Yc21H=g@mail.gmail.com>
References: <CADCwhZk8VdOCKQ5QA_aEG_Z9naqfJvbjdd=MAR4Pk5R_L4-xHg@mail.gmail.com>
	<CADCwhZm3JXpb=YMpsjWdd+tpwDtdUzOyKSwatpEzEX681=2tWA@mail.gmail.com>
	<alpine.LNX.2.01.1108090039470.15809@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=nsmuSbWxBf2vS2k/sS/l7L73PSfI6qdA5K3upaA4jAo=;
        b=B6Vr5zp9MwbVzFpxyn3PCQHuUjJalKAd3VlaYJcyWyvqmklUX+tvzMcKmSj/arUnKs
         R84bfY2iUvzvEpDHtLnGm2uruBA5ed+FcdoDc8n2DUW4ic8KfVyBbtOS4gsS28SR+s8T
         FXFOAxL6SU1i0ae1vhSrkgMF4o3BoDX/yXs10=
In-Reply-To: <alpine.LNX.2.01.1108090039470.15809@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Thanks for your response Jan, I was just reading your PDF of
Netfilter_modules :)

Yeah I do understand that Its not a replacement but I was wondering if
its possible in someway like using any existing extension/modules to
iptables or something. Something in iptables that can track that the
request which was forwarded via X rule did not return any response and
timeout to another rule or some other strategy you may think of.

Redarding browser resolving to another IP, for this lets assume that
users on my network are accessing www.example.com via IP address i.e.
10.10.10.20 (internal one) and not via domain name. They are accessing
it from code and not browser where they need to specify IP and not
domain name etc.

Regards,
Mark

On Tue, Aug 9, 2011 at 3:46 AM, Jan Engelhardt <jengelh@medozas.de> wrote:
>
> On Tuesday 2011-08-09 00:36, Mark Ruth wrote:
>>[DNAT]
>>
>>The problem is that the target webserver (i.e. www.example.com ) is
>>loadbalanced between like 10 servers having 10 public IPs (which are
>>NOT in series), [...]
>>my users can not connect to www.example.com any
>>more untill i debug this and change the destination ip address in my
>>iptables rules.
>>[...]
>>I read that multiple --to-destinations were supported in previous
>>versions of iptables but not anymore. Hence to summarize, I want to
>>achieve some sort of failover with loadbalancing in above mention
>>scenario. Failover is more important.
>
> NAT is not a substitute for a proper layer-7 proxy and/or loadbalancer.
>
>
>>Now i want to handle this situation with some sort of failover rule
>>that can forward users to next ip in list if 1st DOES NOT RESPOND for
>>some reason.
>
> Even without NAT, a user can't do anything if his browser resolved
> a hostname to an address out of a round-robing pool and that
> one server happens to be down.
>
