From: Dave <finalglide@gmail.com>
Subject: Re: libnetfilter_conntrack-0.0.95 compile error
Date: Wed, 9 Jul 2008 11:32:35 -0700
Message-ID: <935fab200807091132x5df06ab3nf00deb9f1c84cde9@mail.gmail.com>
References: <935fab200806300948y65018956ud5513d16cd93c9cd@mail.gmail.com>
	 <486DD54B.9040902@netfilter.org>
	 <935fab200807071522q586aa452x54b4b3df13f62d48@mail.gmail.com>
	 <487341AE.50501@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=1GNAu7hmc6/KOHhrcm+VveKsUPsmgio6QgQ9XSO+Cc0=;
        b=oWaaLf3EZVtYbu+nAWuY4PX4Xqlpf7iJ46hrmH7OZeAzDdJMLLSSZw5DPlvVA177BZ
         zCcBKZYy9L/2mRXYzN71biI1EmB7nxx8lC7NcKG8ukvTl8K7PjB4AuAMNpnNH4QDrhrr
         icP6sZczFeXmIs6Cbknz5YRcW9CvvP/11jpQs=
In-Reply-To: <487341AE.50501@netfilter.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Thanks Pablo, the newest version compiled just fine.

http://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-0.0.96.tar.bz2



On Tue, Jul 8, 2008 at 3:30 AM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> Dave wrote:
>> Drats, still have the issue.
>>
>> 1) Downloaded off main Netfilter site again and tried = same error
>> ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-0.0.95.tar.bz2
>> = make error
>>
>> 2) Downloaded the most recent snapshots but all snapshots appear to be
>> missing their configure.
>>   2a) Latest one error on configure script
>> ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/snapshot/libnetfilter_conntrack-20080521.tar.bz2
>> = configure error
>>
>>   2b) Other two snapshots were missing their configure programs.
>> ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/snapshot/libnetfilter_conntrack-20080520.tar.bz2
>> = no configure included
>> ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/snapshot/libnetfilter_conntrack-20080519.tar.bz2
>> = no configure included
>
> Sorry, there was some problems with the snapshots, could you try latest?
>
> --
> "Los honestos son inadaptados sociales" -- Les Luthiers
>
