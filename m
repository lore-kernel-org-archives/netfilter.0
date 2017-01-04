From: Petteri Matilainen <pmatil@gmail.com>
Subject: Re: [ULOGD2] Timestamp without year in logemu
Date: Wed, 4 Jan 2017 07:37:37 +0200
Message-ID: <CAPcn7Q+=UGSrie+h7kOa5n+zF7aF5sdpF_BokzgFGNJ+LKsv2w@mail.gmail.com>
References: <8f188faf-3890-c157-74ed-22808f915b05@gmail.com> <1483477124.14368.7.camel@regit.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=b3hfEvTkUTz8kWJnI1UJ6tOIcTmOQv+ZNlJweUr6KuE=;
        b=jeQzLYQ2dEYyCMiwiQ6CFJqQEGtxy7jym5mZpPQw2zQUSKr7NS56oBU4DKHJkb4vqC
         /3K83/Oo/o1tCejZS2SsNR/C1KZf29G0n6q/6Qd8r12ebqlBPExXIaNP5biZXiclfeaU
         /BW7OlI8sQ5XeY1J7rh7iDlbKpo7X74PbCu2a2x1WvSUDvMtjGJHLSMjOmreTamF+tVf
         kIHRHoiSI+K08hvkkkxnUFUDhm0qkec3I3CmaT4gwa+ZMzugUAPGa/XMHLVYM9TNkLhG
         Ti4hBywgP1ihgsTppYCXmJfZ2bSMAU+x7yhWaGNsn+4/ZL0RUBpR14XvlTD3ygguUBsu
         clRg==
In-Reply-To: <1483477124.14368.7.camel@regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello Eric,

Thanks for the reply. Would it be possible to modify the code to
include year in logemu output? I mean, is it something that is easily
modified locally just for me? Can you explain the LOCAL filter, why is
it not there anymore? It's description says that it may print more
accurate timestamp.

Also, if anyone else has tips on how to get the year included in the
log lines, maybe do a search and replace afterwards or something
(although it would be very heavy on large logs), please share.

regards

Petteri Matilainen


On Tue, Jan 3, 2017 at 10:58 PM, Eric Leblond <eric@regit.org> wrote:
> Hello,
>
> On Tue, 2017-01-03 at 21:28 +0200, Petteri Matilainen wrote:
>> Hello list,
>>
>> I'm using iptables firewall and I'm logging blocked packets with
>> NFLOG
>> target and ULOGD2. I have the following configuration in ulogd.conf:
>>
>> # this is a stack for logging packets to firewall.log after a
>> collect
>> via NFLOG
>> stack=firewall6:NFLOG,base6:BASE,ifi6:IFINDEX,ip2str6:IP2STR,print6:P
>> RINTPKT,logemu6:LOGEMU
>>
>> [logemu6]
>> file="/var/log/firewall.log"
>> sync=1
>>
>> The logging itself works just fine, but I noticed the timestamps are
>> missing the year, like so:
>>
>> Apr 23 10:38:04 Router In_New_TCP IN=eth0 OUT=...
>>
>> Any ideas why? This causes problems with the system I'm using to
>> graph
>> the logs and make statistics. My system is Debian with kernel
>> 3.16.7.
>> Ulogd version is 2.0.4. I found an online manual for ulogd2 which
>> mentioned a LOCAL filter but my ulogd does not recognize it.
>
> I've just checked the code and it is using (since 2006) ctime which
> does not return the year.
>
> It may not work for you but if you use the JSON output, you will get
> something nicely formated and will get the year.
>
> BR,
> --
> Eric Leblond <eric@regit.org>
