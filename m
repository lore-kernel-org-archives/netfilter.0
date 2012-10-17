From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: Ipset kernel panic
Date: Wed, 17 Oct 2012 20:39:37 -0300
Message-ID: <CADuigkX4ZsMidhC5Bkfs3XQAX9xYPs3zCyZvDv4_v58xbX2ODw@mail.gmail.com>
References: <CADuigkXeFM+N89kwzr8pUPKN5A-qccK5-4juYmutYCcq8XHC4g@mail.gmail.com>
	<alpine.DEB.2.00.1210150927390.4945@blackhole.kfki.hu>
	<CADuigkW5n0vxVm3eKykw-pV7WH6xe7YP0cAEQcS5EF5BnNaTkw@mail.gmail.com>
	<CADuigkWtZzuWRavME_YOx5wfn+dtge=iuXF+HhO540J--D8a7A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=GOwA5fJYBUu4VvzTlX/T/zGxhxRWgTHrntIIf5HG8Nk=;
        b=0rfA/SUopm259dik644GYPYlLTkjB/aFS599EMc0MV6kbiMebgiH2gGFBcGzi5760Z
         Z5lfDWFsIMqPcw66EZcvxSQ+wCuH3vQL4fKsdH5TtkEWjmXsT8kIsBhIz098NuI4FHxY
         yC2IrPn+xdER9Zs9yUQLT03q3KB2Jp5CX8zSU49LJK8A5kDuLLZnjW/kYMhMkutNw2wB
         dhpnlphUo/IhWfg5Ze8P0/6gKTReBhtD/uEMae58+U+bCfMNvHvdlUSJ8j5jpC+tolSn
         faSW0YMnlkixhQRaCOy9vl9f8f6KwzkPY92gpcS0GBvrD2s8fThiVdVOhWLAx0zh81g4
         +cpg==
In-Reply-To: <CADuigkWtZzuWRavME_YOx5wfn+dtge=iuXF+HhO540J--D8a7A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Jozsef,

it still explode with kernel panic when I try:
[root@fwbalance bin]# ipset create allowed_macs bitmap:ip,mac range 0.0.0.0/0
[root@fwbalance bin]# ipset list


CentOS 6.3 64bits
ipset 6.14 (compiled right now only with --prefix=/usr --libdir=/usr/lib64)

--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Wed, Oct 17, 2012 at 8:39 PM, Ricardo Klein <klein.rfk@gmail.com> wrote:
>
> Jozsef,
>
> it still explode with kernel panic when I try:
> [root@fwbalance bin]# ipset create allowed_macs bitmap:ip,mac range
> 0.0.0.0/0
> [root@fwbalance bin]# ipset list
>
>
> CentOS 6.3 64bits
> ipset 6.14 (compiled right now only with --prefix=/usr
> --libdir=/usr/lib64)
>
>
> --
> Att...
>
> Ricardo Felipe Klein
> klein.rfk@gmail.com
>
>
> On Mon, Oct 15, 2012 at 9:41 AM, Ricardo Klein <klein.rfk@gmail.com>
> wrote:
>>
>> ouch, sorry, I didnt saw nothing about in the changelogs.
>> Thanks for the advice.
>>
>> --
>> Att...
>>
>> Ricardo Felipe Klein
>> klein.rfk@gmail.com
>>
>>
>> On Mon, Oct 15, 2012 at 4:28 AM, Jozsef Kadlecsik
>> <kadlec@blackhole.kfki.hu> wrote:
>> > On Mon, 15 Oct 2012, Ricardo Klein wrote:
>> >
>> >> When I create a set like this "ipset create test bitmap:ip,mac range
>> >> 0.0.0.0/0" and try to list with "ipset list" I got a kernel panic.
>> >> ipset v 6.11 CentOS 6.3
>> >
>> > That's a bug which is fixed in ipset 6.14.
>> >
>> > Best regards,
>> > Jozsef
>> > -
>> > E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
>> > PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
>> > Address : Wigner Research Centre for Physics, Hungarian Academy of
>> > Sciences
>> >           H-1525 Budapest 114, POB. 49, Hungary
>
>
