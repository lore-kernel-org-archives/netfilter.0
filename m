From: Muhammad Faisal <faisalusuf@gmail.com>
Subject: Re: Ulogd2 messages stopped [Cent OS 6.8]
Date: Thu, 16 Mar 2017 00:01:25 +0500
Message-ID: <CAAzdDtPzy9q_6v6P9JA9qrJO8q=gtqzPevibDQ6xAuP6Hdc8HA@mail.gmail.com>
References: <CAAzdDtPv0SC=8i3Zn5k4qCNZB7pLBC_4Yf7THAmBU5UAhvnoPA@mail.gmail.com>
 <CAAzdDtOzRi2digE+3uUbeOj50sOWpAGjxxznP69jDN=2NJu5pQ@mail.gmail.com>
 <1489478521.15907.4.camel@regit.org> <CAAzdDtNtRaGSbMvTEuZOsGUVO3ZedfHxSX=X-0rm3Fyqju3wMw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=VPYZmurkwi1qJ32boWzYd0AMzDfnNrku/AiCDQ4bVM8=;
        b=pEmMEfDnAvqkGIajuusQIW3vfPQNJEOs/LpyV1k5Ewv4wKjFjxml64Zkp3uv7GSWmd
         6+RmleooammxRkzQCdo9+dVghOFCKWOPNKV4Nv1nEW0VB/DCguu9X3H0V0tpjSCCRTEs
         p2XQvtx+n3zhnPV77NNWRmxOITH3Vqst6uL0wKH4NskzwSjS1Pq5fY0IMZrA2986MgAZ
         6LAXMr1op/m796exVF0H6WYj4wkWUJEG5oZJo1lVmfQTS9rHAFZ3Tignv/hIu4THoJB6
         Gh6/dmMgWZkF2eQ8kg7sXERtAqyaX9wDwcWH6ulrYJIyQYfdF7sg6fIVkgXwVcfdMZV9
         VFyA==
In-Reply-To: <CAAzdDtNtRaGSbMvTEuZOsGUVO3ZedfHxSX=X-0rm3Fyqju3wMw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Leblond <eric@regit.org>
Cc: netfilter@vger.kernel.org

Hello,
Im able to reproduce the problem. The messages stopped upon system
reboot. The logs starts when conntrack -L command is executed. The
interesting fact is the following message appeared when I ran the
conntrack -L command. This mean NETLINK things is not getting started
unless conntrack command is ran by the user.

Mar 16 00:51:53 wc01 kernel: Netfilter messages via NETLINK v0.30.

What is the solution ?
Best Regards,
Muhammad Faisal

Disclaimer:
Information in this e-mail and attachments is confidential and may be
legally privileged. Only intended recipients are authorized to use it.
If you have received this message in error, please delete it and all
copies of the message from your system and notify the sender
immediately by return e-mail. I'm neither liable for incomplete
transmission of the information in this communication nor for damage
caused by any virus transmitted through this e-mail.



On Tue, Mar 14, 2017 at 11:48 PM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
> Hi Eric,
>
>> This looks rather strange. Could you have a task running in background
>> and removing conntrack related kernel module ?
>
> Pardon, I couldnt get what you mean? Please elaborate
>
> Also the Ravin response is also witnessing there is some problem for
> which conntrack -L command is requried to run periodically. Strange
> though!
>
>
>
> On Tue, Mar 14, 2017 at 1:02 PM, Eric Leblond <eric@regit.org> wrote:
>> Hi,
>>
>> On Tue, 2017-03-14 at 10:05 +0500, Muhammad Faisal wrote:
>>> Hello,
>>> Anyone experienced this behavior with ulogd2?
>>>
>>> We have setup nat server with src-nat event logging using ulogd2.
>>> After running for couple of day all of sudden the ulogd2 messages
>>> stopped. There was nothing related to connection events.
>>>
>>> When i run conntrack -L command and then conntrack -E command the
>>> logs
>>> starts appearing.
>>>
>>> Please help me out i did not find any clue why this is happening.
>>
>> This looks rather strange. Could you have a task running in background
>> and removing conntrack related kernel module ?
>>
>> BR,
>>
>>>
>>> Thanks
>>> Best Regards,
>>> Muhammad Faisal
>>>
>>> Disclaimer:
>>> Information in this e-mail and attachments is confidential and may be
>>> legally privileged. Only intended recipients are authorized to use
>>> it.
>>> If you have received this message in error, please delete it and all
>>> copies of the message from your system and notify the sender
>>> immediately by return e-mail. I'm neither liable for incomplete
>>> transmission of the information in this communication nor for damage
>>> caused by any virus transmitted through this e-mail.
>>>
>>>
>>>
>>> On Mon, Mar 13, 2017 at 8:38 PM, Muhammad Faisal <faisalusuf@gmail.co
>>> m> wrote:
>>> > Hello,
>>> > We have setup nat server with src-nat event logging using ulogd2.
>>> > After running for couple of day all of sudden the ulogd2 messages
>>> > stopped. There was nothing related to connection events.
>>> >
>>> > When i run conntrack -L command and then conntrack -E command the
>>> > logs
>>> > starts appearing.
>>> >
>>> > Please help me out i did not find any clue why this is happening.
>>> >
>>> > Cent OS 6
>>> > Conntrack v1.4
>>> >
>>> > [root@wc01 ~]# ulogd -V
>>> > ulogd Version 2.0.5
>>> >
>>> > Installed Packages
>>> > Name        : libnet
>>> > Arch        : x86_64
>>> > Version     : 1.1.6
>>> > Release     : 7.el6
>>> > Size        : 141 k
>>> > Repo        : installed
>>> > From repo   : epel
>>> >
>>> > Available Packages
>>> > Name        : libnet
>>> > Arch        : i686
>>> > Version     : 1.1.6
>>> > Release     : 7.el6
>>> > Size        : 59 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnet-devel
>>> > Arch        : i686
>>> > Version     : 1.1.6
>>> > Release     : 7.el6
>>> > Size        : 181 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnet-devel
>>> > Arch        : x86_64
>>> > Version     : 1.1.6
>>> > Release     : 7.el6
>>> > Size        : 181 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnet10
>>> > Arch        : i686
>>> > Version     : 1.0.2a
>>> > Release     : 18.el6
>>> > Size        : 39 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnet10
>>> > Arch        : x86_64
>>> > Version     : 1.0.2a
>>> > Release     : 18.el6
>>> > Size        : 37 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnet10-devel
>>> > Arch        : i686
>>> > Version     : 1.0.2a
>>> > Release     : 18.el6
>>> > Size        : 21 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnet10-devel
>>> > Arch        : x86_64
>>> > Version     : 1.0.2a
>>> > Release     : 18.el6
>>> > Size        : 21 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnetfilter_acct
>>> > Arch        : i686
>>> > Version     : 1.0.2
>>> > Release     : 1.el6
>>> > Size        : 18 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnetfilter_acct
>>> > Arch        : x86_64
>>> > Version     : 1.0.2
>>> > Release     : 1.el6
>>> > Size        : 18 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnetfilter_acct-devel
>>> > Arch        : i686
>>> > Version     : 1.0.2
>>> > Release     : 1.el6
>>> > Size        : 22 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnetfilter_acct-devel
>>> > Arch        : x86_64
>>> > Version     : 1.0.2
>>> > Release     : 1.el6
>>> > Size        : 22 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnetfilter_conntrack
>>> > Arch        : i686
>>> > Version     : 0.0.100
>>> > Release     : 2.el6
>>> > Size        : 39 k
>>> > Repo        : base
>>> >
>>> > Name        : libnetfilter_conntrack
>>> > Arch        : x86_64
>>> > Version     : 0.0.100
>>> > Release     : 2.el6
>>> > Size        : 38 k
>>> > Repo        : base
>>> >
>>> > Name        : libnetfilter_conntrack-devel
>>> > Arch        : i686
>>> > Version     : 0.0.100
>>> > Release     : 2.el6
>>> > Size        : 14 k
>>> > Repo        : base
>>> >
>>> >
>>> > Name        : libnetfilter_conntrack-devel
>>> > Arch        : x86_64
>>> > Version     : 0.0.100
>>> > Release     : 2.el6
>>> > Size        : 14 k
>>> > Repo        : base
>>> >
>>> >
>>> > Name        : libnetfilter_cthelper
>>> > Arch        : i686
>>> > Version     : 1.0.0
>>> > Release     : 3.el6
>>> > Size        : 17 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnetfilter_cthelper
>>> > Arch        : x86_64
>>> > Version     : 1.0.0
>>> > Release     : 3.el6
>>> > Size        : 16 k
>>> > Repo        : epel
>>> >
>>> >
>>> > Name        : libnetfilter_cthelper-devel
>>> > Arch        : i686
>>> > Version     : 1.0.0
>>> > Release     : 3.el6
>>> > Size        : 14 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnetfilter_cthelper-devel
>>> > Arch        : x86_64
>>> > Version     : 1.0.0
>>> > Release     : 3.el6
>>> > Size        : 14 k
>>> > Repo        : epel
>>> >
>>> >
>>> > Name        : libnetfilter_log
>>> > Arch        : i686
>>> > Version     : 1.0.1
>>> > Release     : 7.el6
>>> > Size        : 21 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnetfilter_log
>>> > Arch        : x86_64
>>> > Version     : 1.0.1
>>> > Release     : 7.el6
>>> > Size        : 21 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnetfilter_log-devel
>>> > Arch        : i686
>>> > Version     : 1.0.1
>>> > Release     : 7.el6
>>> > Size        : 8.9 k
>>> > Repo        : epel
>>> >
>>> > Name        : libnetfilter_log-devel
>>> > Arch        : x86_64
>>> > Version     : 1.0.1
>>> > Release     : 7.el6
>>> > Size        : 8.9 k
>>> > Repo        : epel
>>> >
>>> >
>>> > Name        : libnetfilter_queue
>>> > Arch        : i686
>>> > Version     : 1.0.1
>>> > Release     : 3.el6
>>> > Size        : 18 k
>>> > Repo        : base
>>> >
>>> > Name        : libnetfilter_queue
>>> > Arch        : x86_64
>>> > Version     : 1.0.1
>>> > Release     : 3.el6
>>> > Size        : 18 k
>>> > Repo        : base
>>> >
>>> > Name        : libnetfilter_queue-devel
>>> > Arch        : i686
>>> > Version     : 1.0.1
>>> > Release     : 3.el6
>>> > Size        : 8.4 k
>>> > Repo        : base
>>> >
>>> > Name        : libnetfilter_queue-devel
>>> > Arch        : x86_64
>>> > Version     : 1.0.1
>>> > Release     : 3.el6
>>> > Size        : 8.4 k
>>> > Repo        : base
>>> > Best Regards,
>>> > Muhammad Faisal
>>> >
>>> > Disclaimer:
>>> > Information in this e-mail and attachments is confidential and may
>>> > be
>>> > legally privileged. Only intended recipients are authorized to use
>>> > it.
>>> > If you have received this message in error, please delete it and
>>> > all
>>> > copies of the message from your system and notify the sender
>>> > immediately by return e-mail. I'm neither liable for incomplete
>>> > transmission of the information in this communication nor for
>>> > damage
>>> > caused by any virus transmitted through this e-mail.
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter"
>>> in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> --
>> Eric Leblond <eric@regit.org>
