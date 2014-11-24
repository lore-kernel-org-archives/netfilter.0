From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: iptables logging using ulog : which can handle high traffic,
 writing in db or json or xml?
Date: Mon, 24 Nov 2014 13:52:38 +0530
Message-ID: <CAA5aLPgHbodxDKnk0WwPXS3fKf-5HrJmv=ZyJmO3ztrh3U6Crg@mail.gmail.com>
References: <CAA5aLPimjDRd4X5uJYEtFp=j8miNBiy7r=HoqGwanNZQM2hFEA@mail.gmail.com>
	<405CDB4498600447A16CCC4ED3BFCAD301B832C2C7@SCOOBY.corp.eastlink.ca>
	<201411211151.18885.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=EJXdfmnbT4rL8zbJNXcnBMQgd/ZG2fA103QhFdIDM/Y=;
        b=ozBgfkhd7WRSJ2n65O2XGp+I7SnB8nmRYB5x6MjyHVSp/vlLxALkZsgUhcnD30boiK
         5jogE9G2YxllRva1v2T+wYKQyeJf2yK0XEYjmXQ/dXTal12RWn0mTxbYMyGjxKePi69L
         dC0ehb6XC/aU+rnNn1BJ7jrJNsPGAgc1iJZU1OmT6aTUhfw/qVW0cFZhFz3eI+t3xgca
         86YytYCDfH3SyLzwOwsTSH7M5v9ZRUrWh2kGukMJM2BhKjUNvTa843oTai4Fb4yZV+qA
         CkNubMdUROe4fKquz5g7CBB1eSZxXZLMIXZDlYdeQ6fhX+dAbCqAxQEgQ4+nPJXEXsjB
         dgEQ==
In-Reply-To: <201411211151.18885.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: neal.p.murphy@alum.wpi.edu
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Joel Gerber <joel.gerber@corp.eastlink.ca>

I made a ramfs partition and try to write in pcap file, so to avoid
much processing otherwise required in json,etc.

I am getting performance benefit but I am able to go upto 15K -
16K/sec and at times following error comes:

 <7> ulogd_inppkt_ULOG.c:253 ipulog_read =3D -1! ipulog_errno =3D 6 (Er=
ror
during netlink receive), errno =3D 105 (No buffer space available)

This leads to loss of certain packets in log file.

So, how to enhance performace ?

I want to test if we can handle 100,000 pkts/sec some how but I have
run out of options .

I am having 64GB DDR3 1600-ECC ram and 16 core CPU @2.3GHz.

Please help ...

On Fri, Nov 21, 2014 at 10:21 PM, Neal Murphy
<neal.p.murphy@alum.wpi.edu> wrote:
> 10 000 PPS is, at worst, around 15 000 000 bytes/s. Even today's lame=
st SATA
> drives should be able to handle that data rate; USB thumb drives can =
be a
> different story.
>
> Turn off O_SYNC. Let Linux do its job; it handles disk I/O very well.=
 Write to
> the file cache and let Linux handle flushing the data to disk. Be sur=
e you
> have plenty of RAM to cache plenty of data. And if you expect to read=
 the data
> simultaneously, you'll want even *more* RAM to give the system half a=
 chance
> of keeping some of the data cached. If you're worried about power
> inerruptions, use a UPS. If you're worried about FS corruption, use a
> journalled FS.
>
> N
>
>
> On Friday, November 21, 2014 07:43:09 AM Joel Gerber wrote:
>> What type of storage are you writing to? The slow-down might be disk
>> access.
>>
>> If you really want to log traffic in the 10,000 pkt/sec range, I wou=
ld
>> start by writing to memory storage, and then have a process in the
>> background sync to disk. Hopefully the sync will be able to keep up
>> relatively well.
>>
>> You'll also want a writing system with very little overhead. Writing
>> directly to a file with no abstraction layer, using binary output, m=
ight
>> be the fastest thing possible, short of writing to a raw partition t=
able.
>>
>> The other thing to consider, is even with all of the data written, h=
ow will
>> you read it? Having a file constantly open for writing, precludes be=
ing
>> able to reliably read from it.
>>
>> Joel Gerber
>> Network Specialist
>> Network Operations
>> Eastlink
>> E: Joel.Gerber@corp.eastlink.ca T: 519.786.1241
>>
>>
>> -----Original Message-----
>> From: netfilter-owner@vger.kernel.org
>> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Akshat Kakkar =
Sent:
>> November-21-14 7:36 AM
>> To: netfilter@vger.kernel.org
>> Subject: iptables logging using ulog : which can handle high traffic=
,
>> writing in db or json or xml?
>>
>> i want to do logging of traffic iptables rules.
>> Traffic can go upto 10000pkts/sec.
>>
>> While using ulog and writing in mysql db, I could not get good resul=
ts. Max
>> around 300 pkts/sec were able to handle. Further traffic was delayed=
 in
>> db.
>>
>> Then I used json, it was able to handle around 1700 pkts/sec, beyond=
 that
>> there is traffic loss in json file.
>>
>> Is there any other mode which can be faster than json without losing=
 any
>> traffic? --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in the
>> body of a message to majordomo@vger.kernel.org More majordomo info a=
t
>> http://vger.kernel.org/majordomo-info.html
>> N=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDr=EF=BF=BD=EF=BF=BDy=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDb=EF=BF=BDX=EF=BF=BD=EF=BF=BD=C7=A7v=EF=
=BF=BD^=EF=BF=BD)=DE=BA{.n=EF=BF=BD+=EF=BF=BD=EF=BF=BD=EF=BF=BDz=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=D7=AB=EF=BF=BD{ay=EF=BF=BD =CA=87=DA=99=EF=BF=BD,j =EF=
=BF=BD=EF=BF=BDf=EF=BF=BD=EF=BF=BD=EF=BF=BDh=EF=BF=BD=EF=BF=BD=EF=BF=BD=
z=EF=BF=BD =EF=BF=BDw=EF=BF=BD=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=
=BDj
>> :+v=EF=BF=BD=EF=BF=BD=EF=BF=BDw=EF=BF=BDj=EF=BF=BDm=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDzZ+=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=DD=A2j"=EF=BF=BD=EF=BF=BD!=EF=BF=BDi
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
