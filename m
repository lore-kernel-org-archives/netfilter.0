From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: ulog dropping packets when rate is 4000 packets/sec or more
Date: Wed, 9 Sep 2015 13:09:04 +0530
Message-ID: <CAA5aLPhAydV2-pdg38qyPcpWDzgzdsUmdS+rTkgDUYuOhKFWbg@mail.gmail.com>
References: <CAA5aLPijmeBmgU_AznRJfRK3OHfgwFY-T8XiWz-1r19QFOALnQ@mail.gmail.com>
	<5cd26acb-e50d-4312-93a2-01fb3b964c51@email.android.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=TdmsUNsZdnH6Vux7Y/vc1yUIKy4YSfnVc6X2jvHsr3E=;
        b=iPghyPdMP89vUSK0C+jOJzSMWIRUxJ2dAchypHjySB9va7Dxp+8vF3qKLsw4XkKF3C
         algbvyxcC8NPAPM6m2zKAnKIqqbps0759M4Sgs1+FMHdRosLiCucyJ6vERvNVskOxVsw
         OyJ/Q/NSg9onijfHjJRwSrEl4z5kqCK+pfPfNB0alD7uRt+ouGbZHRcmonspXk+DJ9dl
         SwEw7hbuyxdpXhv0Ixgu2XIEO/SGhSgGKk2j9tQ3/x5deXQTZA6EKhlYuWFc5BtTQfSp
         paX7h0nTpiwAMHWcXmfVGtiqe25uAUjpYb/KDDDf6362aZ/XI0fSIOPKC7w8iLGxn4w+
         6R7Q==
In-Reply-To: <5cd26acb-e50d-4312-93a2-01fb3b964c51@email.android.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@regit.org>
Cc: Netfilter Users ML <netfilter@vger.kernel.org>

On Wed, Sep 9, 2015 at 12:21 PM, Eric Leblond <eric@regit.org> wrote:
> Hello,
>
> Le 9 sept. 2015 8:27 AM, Akshat Kakkar <akshat.1984@gmail.com> a =C3=A9=
crit :
>>
>> On Mon, Sep 7, 2015 at 5:45 PM, Akshat Kakkar <akshat.1984@gmail.com=
> wrote:
>> > Hi!
>> >
>> > I am using JSON plugin of ULOG to log iptables traffic. When the i=
nput
>> > rate  is arond 4000 packets/sec, ulog is not logging all the packe=
ts.
>
> Please use nflog instead. Ulog has been removed from recent kernel.
>
>> > At 4000 pkts/sec, it drops around 0.1 % of pkts.
>> > At 5000 pkts/sec, it drops around 2.4% of pkts.
>> > At 6000 pkts/sec, it drops around 3.67% of pkts.
>> > At 15000 pkts/sec, it drops around 16.7% of pkts.
>> >
>> > Is this expected? or am I missing something.
>
> This is expected, there is a performance cost in logging.
>
> Some ways to try to improve this:
>  - use nflog batch feature (iptables/nftables option)

I am currently batching at maximum value of 50.
But one thing, Why 50 is the limit?

>  - increase nfnetlink buffer size (ulogd conf)

This increased the delay at times.

>  - write json file to a faster disk (I doubt this is the key point he=
re)

Presently I am having 15K sas.
Putting json file on ramfs (ram: DDR3 1600MHz) makes that 4000 to 7000
but not more that.

With o/p in PCAP on ramfs, this increases to 16000 pkts/sec.

I want to use kibana (+logsash and elastic-search) for viewing and
analyzing this log. Logstash dont understand pcap directly. So I cant
use PCAP.
Is there a format which is understood by logstash and is better (in
performance) than JSON for ulog/nflog.
