From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_conntrack-0.0.95 compile error
Date: Tue, 08 Jul 2008 12:23:18 +0200
Message-ID: <48734016.8010702@netfilter.org>
References: <935fab200806300948y65018956ud5513d16cd93c9cd@mail.gmail.com>	 <486DD54B.9040902@netfilter.org> <935fab200807071522q586aa452x54b4b3df13f62d48@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <935fab200807071522q586aa452x54b4b3df13f62d48@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave <finalglide@gmail.com>
Cc: netfilter@vger.kernel.org

Dave wrote:
> Drats, still have the issue.
> 
> 1) Downloaded off main Netfilter site again and tried = same error
> ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-0.0.95.tar.bz2
> = make error
> 
> 2) Downloaded the most recent snapshots but all snapshots appear to be
> missing their configure.
>   2a) Latest one error on configure script
> ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/snapshot/libnetfilter_conntrack-20080521.tar.bz2
> = configure error
> 
>   2b) Other two snapshots were missing their configure programs.
> ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/snapshot/libnetfilter_conntrack-20080520.tar.bz2
> = no configure included
> ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/snapshot/libnetfilter_conntrack-20080519.tar.bz2
> = no configure included

Type `sh autogen.sh' to generate the configure file.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
