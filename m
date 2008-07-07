From: Dave <finalglide@gmail.com>
Subject: Re: libnetfilter_conntrack-0.0.95 compile error
Date: Mon, 7 Jul 2008 15:22:04 -0700
Message-ID: <935fab200807071522q586aa452x54b4b3df13f62d48@mail.gmail.com>
References: <935fab200806300948y65018956ud5513d16cd93c9cd@mail.gmail.com>
	 <486DD54B.9040902@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=AFJCH8tA1ItLa/uUlyv9071i+bh1z1/bG3z4t9Xp2hc=;
        b=AmJA+KZb2q/V99NIRS+WvslyvYVmAwdtQrpVRBX9uE+CC/DF31qiM3O8NuAxxebfHh
         ocHCvz1nkOEKw5dz8DuuX8T8AbZ+ZXxIipjpMipJDAin9WgnEoCK9w/HZCB6jiwXEEXH
         9ysRGgTBWTW1JwJUn9MSCtrpKEtBz7Ai1JWyQ=
In-Reply-To: <486DD54B.9040902@netfilter.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Drats, still have the issue.

1) Downloaded off main Netfilter site again and tried = same error
ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-0.0.95.tar.bz2
= make error

2) Downloaded the most recent snapshots but all snapshots appear to be
missing their configure.
  2a) Latest one error on configure script
ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/snapshot/libnetfilter_conntrack-20080521.tar.bz2
= configure error

  2b) Other two snapshots were missing their configure programs.
ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/snapshot/libnetfilter_conntrack-20080520.tar.bz2
= no configure included
ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/snapshot/libnetfilter_conntrack-20080519.tar.bz2
= no configure included


Cheers
-Dave

On Fri, Jul 4, 2008 at 12:46 AM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> Dave wrote:
>> Just tried to update conntrack librarys to new version but error out.
>> 0.94 compiles just fine though.
>>
>> gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\"
>> -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
>> -DPACKAGE=\"libnetfilter_conntrack\" -DVERSION=\"0.0.95\"
>> -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1
>> -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1
>> -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1
>> -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DHAVE_ARPA_INET_H=1
>> -DHAVE_INET_NTOP=1 -DHAVE_INET_NTOP_IPV6=1 -I.  -I../include    -g -O2
>> -DLIBNETFILTER_CONNTRACK_DIR=\"/usr/local/lib/libnetfilter_conntrack/\"
>> -I/usr/local/include   -MT conntrack_events.o -MD -MP -MF
>> .deps/conntrack_events.Tpo -c -o conntrack_events.o conntrack_events.c
>> conntrack_events.c: In function 'sk_set_filter':
>> conntrack_events.c:44: error: invalid application of 'sizeof' to
>> incomplete type 'struct nlattr'
>> conntrack_events.c:66: error: invalid application of 'sizeof' to
>> incomplete type 'struct nlattr'
>> conntrack_events.c:92: error: invalid application of 'sizeof' to
>> incomplete type 'struct nlattr'
>> conntrack_events.c: At top level:
>> conntrack_events.c:149: error: invalid application of 'sizeof' to
>> incomplete type 'struct nlattr'
>> conntrack_events.c:170: error: invalid application of 'sizeof' to
>> incomplete type 'struct nlattr'
>> conntrack_events.c:195: error: invalid application of 'sizeof' to
>> incomplete type 'struct nlattr'
>> make[1]: *** [conntrack_events.o] Error 1
>>
>>
>> Any ideas?
>
> You seem to have compiled a SVN snapshot. Please, try lastest svn
> snapshot - the previous were broken as you have noticed - or the
> official release 0.0.95.
>
> --
> "Los honestos son inadaptados sociales" -- Les Luthiers
>
