From: ravin goyal <ravirocks1021@gmail.com>
Subject: Re: Ulogd2 messages stopped [Cent OS 6.8]
Date: Tue, 14 Mar 2017 14:14:41 +0530
Message-ID: <CANU0Mn3iuXiV7xmjzgJzZvHHeCUzG9EUQRrxgsHFZE4O6X57mA@mail.gmail.com>
References: <CAAzdDtPv0SC=8i3Zn5k4qCNZB7pLBC_4Yf7THAmBU5UAhvnoPA@mail.gmail.com>
 <CAAzdDtOzRi2digE+3uUbeOj50sOWpAGjxxznP69jDN=2NJu5pQ@mail.gmail.com> <1489478521.15907.4.camel@regit.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=uO73BBq5xel3XVjf6Mf2Er4NkJU5jnjW7zCxOnbwXAk=;
        b=mqx/JhfmvJL1qs7WON+LD96AOPWeO/olfJw1UTzc0Z9bzLcdyEG6wfnSxJobly1TcQ
         t5zDaHWslFmzKzSfTEifIemGVHbKJGTA9kmTZZ/0IJkIHv85vtu/KbtUFx07ZVNE/Rbw
         sNamJ23PigrQlhNM8pHHGy/N/VW/J+Vfh8yOpW3fLbOPWrwk3v13F+GaBmwplXJHPG6t
         zFckyrjnfsJVsCcCMiUp7Gv28AcGPTZFP26843rjqr6dIixNVNU8KSrlu58nZVpSxpSc
         8C9C6YZzpS0OzHRsH39vNjzvbku2wqH/dzbqTm8DiNmhbxY0jkcVTrOU3VAsDwkwI9nL
         Kw6A==
In-Reply-To: <1489478521.15907.4.camel@regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Leblond <eric@regit.org>
Cc: Muhammad Faisal <faisalusuf@gmail.com>, netfilter@vger.kernel.org

I have observed this on x86 machines only.
No problem on armv7l machined(banana pi boards)

I am collecting destroy events from conntrack by running conntrack -E
-eDESTROY -o ktimestamp on terminal.
I too ran conntrack -L when there was no flow as you have mentioned.
To overcome this I decided to run conntrack -L on daily basis via cron
once a day.

Working good so far.

Regards
Ravin

On 14 March 2017 at 13:32, Eric Leblond <eric@regit.org> wrote:
> Hi,
>
> On Tue, 2017-03-14 at 10:05 +0500, Muhammad Faisal wrote:
>> Hello,
>> Anyone experienced this behavior with ulogd2?
>>
>> We have setup nat server with src-nat event logging using ulogd2.
>> After running for couple of day all of sudden the ulogd2 messages
>> stopped. There was nothing related to connection events.
>>
>> When i run conntrack -L command and then conntrack -E command the
>> logs
>> starts appearing.
>>
>> Please help me out i did not find any clue why this is happening.
>
> This looks rather strange. Could you have a task running in background
> and removing conntrack related kernel module ?
>
> BR,
>
>>
>> Thanks
>> Best Regards,
>> Muhammad Faisal
>>
>> Disclaimer:
>> Information in this e-mail and attachments is confidential and may be
>> legally privileged. Only intended recipients are authorized to use
>> it.
>> If you have received this message in error, please delete it and all
>> copies of the message from your system and notify the sender
>> immediately by return e-mail. I'm neither liable for incomplete
>> transmission of the information in this communication nor for damage
>> caused by any virus transmitted through this e-mail.
>>
>>
>>
>> On Mon, Mar 13, 2017 at 8:38 PM, Muhammad Faisal <faisalusuf@gmail.co
>> m> wrote:
>> > Hello,
>> > We have setup nat server with src-nat event logging using ulogd2.
>> > After running for couple of day all of sudden the ulogd2 messages
>> > stopped. There was nothing related to connection events.
>> >
>> > When i run conntrack -L command and then conntrack -E command the
>> > logs
>> > starts appearing.
>> >
>> > Please help me out i did not find any clue why this is happening.
>> >
>> > Cent OS 6
>> > Conntrack v1.4
>> >
>> > [root@wc01 ~]# ulogd -V
>> > ulogd Version 2.0.5
>> >
>> > Installed Packages
>> > Name        : libnet
>> > Arch        : x86_64
>> > Version     : 1.1.6
>> > Release     : 7.el6
>> > Size        : 141 k
>> > Repo        : installed
>> > From repo   : epel
>> >
>> > Available Packages
>> > Name        : libnet
>> > Arch        : i686
>> > Version     : 1.1.6
>> > Release     : 7.el6
>> > Size        : 59 k
>> > Repo        : epel
>> >
>> > Name        : libnet-devel
>> > Arch        : i686
>> > Version     : 1.1.6
>> > Release     : 7.el6
>> > Size        : 181 k
>> > Repo        : epel
>> >
>> > Name        : libnet-devel
>> > Arch        : x86_64
>> > Version     : 1.1.6
>> > Release     : 7.el6
>> > Size        : 181 k
>> > Repo        : epel
>> >
>> > Name        : libnet10
>> > Arch        : i686
>> > Version     : 1.0.2a
>> > Release     : 18.el6
>> > Size        : 39 k
>> > Repo        : epel
>> >
>> > Name        : libnet10
>> > Arch        : x86_64
>> > Version     : 1.0.2a
>> > Release     : 18.el6
>> > Size        : 37 k
>> > Repo        : epel
>> >
>> > Name        : libnet10-devel
>> > Arch        : i686
>> > Version     : 1.0.2a
>> > Release     : 18.el6
>> > Size        : 21 k
>> > Repo        : epel
>> >
>> > Name        : libnet10-devel
>> > Arch        : x86_64
>> > Version     : 1.0.2a
>> > Release     : 18.el6
>> > Size        : 21 k
>> > Repo        : epel
>> >
>> > Name        : libnetfilter_acct
>> > Arch        : i686
>> > Version     : 1.0.2
>> > Release     : 1.el6
>> > Size        : 18 k
>> > Repo        : epel
>> >
>> > Name        : libnetfilter_acct
>> > Arch        : x86_64
>> > Version     : 1.0.2
>> > Release     : 1.el6
>> > Size        : 18 k
>> > Repo        : epel
>> >
>> > Name        : libnetfilter_acct-devel
>> > Arch        : i686
>> > Version     : 1.0.2
>> > Release     : 1.el6
>> > Size        : 22 k
>> > Repo        : epel
>> >
>> > Name        : libnetfilter_acct-devel
>> > Arch        : x86_64
>> > Version     : 1.0.2
>> > Release     : 1.el6
>> > Size        : 22 k
>> > Repo        : epel
>> >
>> > Name        : libnetfilter_conntrack
>> > Arch        : i686
>> > Version     : 0.0.100
>> > Release     : 2.el6
>> > Size        : 39 k
>> > Repo        : base
>> >
>> > Name        : libnetfilter_conntrack
>> > Arch        : x86_64
>> > Version     : 0.0.100
>> > Release     : 2.el6
>> > Size        : 38 k
>> > Repo        : base
>> >
>> > Name        : libnetfilter_conntrack-devel
>> > Arch        : i686
>> > Version     : 0.0.100
>> > Release     : 2.el6
>> > Size        : 14 k
>> > Repo        : base
>> >
>> >
>> > Name        : libnetfilter_conntrack-devel
>> > Arch        : x86_64
>> > Version     : 0.0.100
>> > Release     : 2.el6
>> > Size        : 14 k
>> > Repo        : base
>> >
>> >
>> > Name        : libnetfilter_cthelper
>> > Arch        : i686
>> > Version     : 1.0.0
>> > Release     : 3.el6
>> > Size        : 17 k
>> > Repo        : epel
>> >
>> > Name        : libnetfilter_cthelper
>> > Arch        : x86_64
>> > Version     : 1.0.0
>> > Release     : 3.el6
>> > Size        : 16 k
>> > Repo        : epel
>> >
>> >
>> > Name        : libnetfilter_cthelper-devel
>> > Arch        : i686
>> > Version     : 1.0.0
>> > Release     : 3.el6
>> > Size        : 14 k
>> > Repo        : epel
>> >
>> > Name        : libnetfilter_cthelper-devel
>> > Arch        : x86_64
>> > Version     : 1.0.0
>> > Release     : 3.el6
>> > Size        : 14 k
>> > Repo        : epel
>> >
>> >
>> > Name        : libnetfilter_log
>> > Arch        : i686
>> > Version     : 1.0.1
>> > Release     : 7.el6
>> > Size        : 21 k
>> > Repo        : epel
>> >
>> > Name        : libnetfilter_log
>> > Arch        : x86_64
>> > Version     : 1.0.1
>> > Release     : 7.el6
>> > Size        : 21 k
>> > Repo        : epel
>> >
>> > Name        : libnetfilter_log-devel
>> > Arch        : i686
>> > Version     : 1.0.1
>> > Release     : 7.el6
>> > Size        : 8.9 k
>> > Repo        : epel
>> >
>> > Name        : libnetfilter_log-devel
>> > Arch        : x86_64
>> > Version     : 1.0.1
>> > Release     : 7.el6
>> > Size        : 8.9 k
>> > Repo        : epel
>> >
>> >
>> > Name        : libnetfilter_queue
>> > Arch        : i686
>> > Version     : 1.0.1
>> > Release     : 3.el6
>> > Size        : 18 k
>> > Repo        : base
>> >
>> > Name        : libnetfilter_queue
>> > Arch        : x86_64
>> > Version     : 1.0.1
>> > Release     : 3.el6
>> > Size        : 18 k
>> > Repo        : base
>> >
>> > Name        : libnetfilter_queue-devel
>> > Arch        : i686
>> > Version     : 1.0.1
>> > Release     : 3.el6
>> > Size        : 8.4 k
>> > Repo        : base
>> >
>> > Name        : libnetfilter_queue-devel
>> > Arch        : x86_64
>> > Version     : 1.0.1
>> > Release     : 3.el6
>> > Size        : 8.4 k
>> > Repo        : base
>> > Best Regards,
>> > Muhammad Faisal
>> >
>> > Disclaimer:
>> > Information in this e-mail and attachments is confidential and may
>> > be
>> > legally privileged. Only intended recipients are authorized to use
>> > it.
>> > If you have received this message in error, please delete it and
>> > all
>> > copies of the message from your system and notify the sender
>> > immediately by return e-mail. I'm neither liable for incomplete
>> > transmission of the information in this communication nor for
>> > damage
>> > caused by any virus transmitted through this e-mail.
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> Eric Leblond <eric@regit.org>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
