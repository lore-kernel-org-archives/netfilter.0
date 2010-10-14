From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: event-driven connection tracking
Date: Thu, 14 Oct 2010 14:14:21 +0100
Message-ID: <4CB7022D.3010209@googlemail.com>
References: <4CB5CF17.3090302@googlemail.com> <4CB6F11B.6000103@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=l6Q8VWMWkN3zkkIvVL3CiNf61BBn7oAOd11ZOrtRVQM=;
        b=ROUYLw9GhWSxonQ9KG6f4w6sOky8vcEkRarzxtvJdG6bbtyH0PUxptZNnf8tSayeBg
         66c20hwwbfdSuQ1cpj+8MXnNCPxKJZIqjXR+D2MGC6psKVAUdTAP76iB8S90TbJcRG83
         vScchTt0FoQAIW081FMYcugdfqN4OZG/hNC2A=
In-Reply-To: <4CB6F11B.6000103@netfilter.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>, netfilter@vger.kernel.org


>> Is it possible to use event-driven connection tracking - with
>> conntrack-utils or by other means?
>>
>> Ideally, what I would like to do is 'register' a handler for particular
>> connection events (when new connection is established and then closed
>> for example) based on particular pre-defined filter (say, by protocol,
>> source/destination ip etc) and execute a program code/function (if done
>> programmatically) or a script (if done outside the connection-tracking
>> domain) to do what I want?
>> Currently, the only way to track such 'events' is if I include a
>> separate chain in iptables tracking a particular connection (and logging
>> the event via a normal log jump), but that is not enough for me as I
>> also need to trigger a full dump based on that particular 'filter' and
>> end this dump when the connection is closed. Any ideas?
>>     
>
> You can use libnetfilter_conntrack for that:
> http://www.netfilter.org/projects/libnetfilter_conntrack/index.html
>   
THAT is exactly what I was after - program interface through which I can 
register the events I am interested in and handle them in my own way.

> There are several examples under utils/ in the tarballs that are
> distributed.
>   
Yep, conntrack_events.c and expect_events.c seem to be a good match and 
provide me with a decent skeleton on which to base my own code. Thanks 
for your input, much appreciated.
