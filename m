From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: how to use hash:ip,mark in iptables ?
Date: Wed, 26 Aug 2015 16:51:25 +0530
Message-ID: <CAA5aLPjHNBgoEJ5Pbhph_hD=aOuma5Q6R+CKnDLUBsBjx7h5vA@mail.gmail.com>
References: <CAA5aLPif6jVbzvaLNWStY-Y_6uqva+cS4Wi8sXTNkJ5GG55CBg@mail.gmail.com>
	<CAA5aLPg9drxRGrhfGzg1TqcGKn9guKP9N80cdS0uYUfaTbhPdg@mail.gmail.com>
	<CACUMwTk-53UpicP0yTzTwxe91ZcdWd474giReca98_4Gi8+Ebg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=llbGKoyvPNsKVZYd51jD6t19/LAB88SbrL2Urcq0cqY=;
        b=e+jMhwn0wK7gMIgtWmC6Aq+Sy4ebRePlJVorE6EkV72qGd8aThRtOSdeZrlVP13F3U
         2NE/JP8XYOE0vjrBlRm1tL3/26YNQPWb+Zg43Yexy4BhSelGQT7jtx319gvwPyonUHhm
         w6VHwbFuPlMxEzUaxU7Wn7C+ytXWF33moHvlLIbbpvgxoMWlOfBbgNiWyAWU6aV6AihB
         r0vhIuF3PzepVfR110/rBgKK3fvYlgcHxdme33mYepCfuszNdTd/0VXAliFnMmZpnthw
         Cp56qSHZvzbHNGzjE5QzB6p/kLxlHAQnofXw5Ck5XZ5InTyXhB3H9He2ifuQtN1CE8Xd
         Gl/A==
In-Reply-To: <CACUMwTk-53UpicP0yTzTwxe91ZcdWd474giReca98_4Gi8+Ebg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vytas Dauksa <vytas.dauksa@smoothwall.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

That worked fine.

so one most important thing in this is

-m set --match-set foo src,src

OR

-m set --match-set foo src,dst

where src or dst after comma(,) is actually meaning mark.

Normally it confuses as there is always like src ip, dst ipl src port,
dst port; src iface, dst iface ...but there is nothing like src mark,
dst mark

Thanks for the help.

Should we update man pages on this or am I dumb enough to ignore the obvious?

On Wed, Aug 26, 2015 at 3:59 PM, Vytas Dauksa
<vytas.dauksa@smoothwall.net> wrote:
> Hi,
>
> please take a look at my test script:
> https://github.com/vytas-dauksa/ipset-mark-test-script/blob/master/test-ipset-nfmark.pl
> that might help you.
>
> Though, take into account before running it that it starts fresh each
> time, hence might remove other iptables/ipsets..
>
>
> On 26 August 2015 at 10:23, Akshat Kakkar <akshat.1984@gmail.com> wrote:
>> I have tried using what I mentioned and I get error
>>
>> iptables -A FORWARD -m set --match-set foo src,mark -j ACEEPT
>>
>> iptables v1.4.21: You must spefify (the comma separated list of) 'src' or 'dst'.
>> Try `iptables -h' or 'iptables --help' for more information.
>>
>> On Wed, Aug 26, 2015 at 2:39 PM, Akshat Kakkar <akshat.1984@gmail.com> wrote:
>>> how to use hash:ip,mark in iptables ?
>>>
>>> I can create ipset, but how to match it in iptables?
>>>
>>> something like -m SET --match-set src,mark
>>>
>>> or something else altogether?
>
>
>
> --
> Vytas Dauksa
> Developer
>
> smoothwall
> vytas.dauksa@smoothwall.com
> www.smoothwall.com
>
> Head Office : 1 John Charles Way, Leeds, LS12 6QA, United Kingdom
> Tech Office : Eagle Point, Little Park Farm Road, Fareham, PO15 5TD,
> United Kingdom
> US Office : 8008 Corporate Center Dr #410, Charlotte, NC 28226, United States
>
> Telephone: UK: +44 870-199-9500 US: +1 800-959-3760
>
>
>
> Smoothwall Limited is registered in England, Company Number: 4298247
> and whose registered address is 1 John Charles Way, Leeds, LS12 6QA
> United Kingdom.
> This email and any attachments transmitted with it are confidential to
> the intended recipient(s) and may not be communicated to any other
> person or published by any means without the permission of Smoothwall
> Ltd. Any opinions stated in this message are solely those of the
> author.
