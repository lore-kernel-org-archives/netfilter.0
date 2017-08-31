From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: NFCT writing localhost conntrack entries too
Date: Fri, 1 Sep 2017 00:09:00 +0530
Message-ID: <CAA5aLPiBfn3FHLfLTML7ASwuYM8YpYiDJ3k7Uz3BKUnivXxF_A@mail.gmail.com>
References: <CAA5aLPg0PnUuiNFq=pvcOXerJJugcLF1bFgwxSC3KV4yEsv0DQ@mail.gmail.com>
 <CAA5aLPh6g2w2wfhWfo8==0J7Pa=8tMNp8VXKsBEWfkSKQUR0=g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=W5sybhjpOSBJm0gsX9+nDEoiSYNZY2f6PXSJ18I0e8o=;
        b=sVczwFxhE2WOlJmof8dagrUzJ0Im7uzD4kErcubGlwU26fUDhSdWpiB9jNOzbnICxg
         BZm2VaMXUi9M6zB1hVQsEwpatuFBCCfyIhyvSOPfS+m+UAsEm2M+uau01MhYTrlIQrgV
         ubqQ2Zxdsd27nOTvLDU3HVbst2lVgGLJXvpi3mW3gwS6tDbAmFv1Jei6Nroe/q7zVVhW
         kFaQfYwwj/Ic3j3wOoPKlPw2mdvX3w90dBZK2h84SH1MHr3ZITm/ZRGKmCFmEpUV3Cfx
         ayh4IH5qDo3hb6s0xTo23MJmEBxMB7a8eAbODr1umBrjCxHiQ0i2u3Q6aDi5cYBDttLX
         UGbw==
In-Reply-To: <CAA5aLPh6g2w2wfhWfo8==0J7Pa=8tMNp8VXKsBEWfkSKQUR0=g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Please guide .... Anybody, somebody !!!

On 8/30/17, Akshat Kakkar <akshat.1984@gmail.com> wrote:
> Anybody? Please help ...
>
> On 8/24/17, Akshat Kakkar <akshat.1984@gmail.com> wrote:
>> With ulog, NFCT plugin, is it possible to not log entries with src ip
>> as 127.0.0.1
>>
>> I can see following options in ulogd.conf
>> #accept_src_filter=192.168.1.0/24,1:2::/64 # source ip of connection
>> must belong to these networks
>> #accept_dst_filter=192.168.1.0/24 # destination ip of connection must
>> belong to these networks
>> #accept_proto_filter=tcp,sctp # layer 4 proto of connections
>>
>>
>> ... but what I am looking for is like deny_src_filter.
>>
>> Is it possible?
>>
>
