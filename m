From: Alessandro Vesely <vesely@tana.it>
Subject: Re: One more application available for nftables
Date: Tue, 19 Nov 2019 09:36:02 +0100
Message-ID: <87cd20de-a6d0-19ad-4111-6e81b63abed0@tana.it>
References: <b99d882d69f5e152919339c65ac26163@mailtower.de>
 <b5512a97bad28c14e57ebf2f92c12f27@mailtower.de> <87v9rhdhuz.fsf@goll.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1574152563; bh=3B9YxlET09uYCQ6MX88p+5u1VfL6j1wo2aBY85Cld3k=;
        l=1172; h=To:References:From:Date:In-Reply-To;
        b=CnKrQXNY+Y56q3cEDB2O8AUdXKPoTWEnuTal9LuudxkCPb4q8vBGfgEpQZgnfGRhI
         F7QdMKJLIAradsloTMOSt2AGk8ajTU0q50vTk3hvEgDDlairZwDJp8NmAHNRpG9pOt
         1OLSrlUYwGBzWyHuUKaFUXNib6Dtkexo5drOgBT5X0aWgJ+0vl+uPYS9gVsQk
In-Reply-To: <87v9rhdhuz.fsf@goll.lan>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon 18/Nov/2019 03:43:32 +0100 Trent W. Buck wrote:
> That page needs a section "why choose fail2nft over existing products?" :-)
> 
>  * sshguard is lex/yacc (C) that reads logs journal/syslog/NCSA
>    and runs a helper script to add/remove block rules.
>    Adding new match rules requires a recompile.
>    It blocks everything by default (on Debian, via nftables).
> 
>    https://bitbucket.org/sshguard/sshguard/src/master/src/fw/sshg-fw-nft-sets.sh
> 
>    It's about 2KLOC (slightly bigger than fail2nft).
> 
>  * fail2ban is python and uses regular expressions to look for attacks.
>    It's configured via a huge mess of .ini files.
>    It blocks nothing (except SSH?) by default (on Debian, via xtables).
> 
>    https://github.com/fail2ban/fail2ban/blob/0.11/config/action.d/nftables.conf
> 
>    It's about 17KLOC (much bigger than fail2nft).

* ipqbdb is C with PCRE to read a piped log file,
  requires custom setup of regexes and iptables -j NFQUEUE --queue-num N,
  the queue filtering daemon(s) can mark or drop based on Berkeley DB.

  https://savannah.nongnu.org/projects/ipqbdb/

  Less than 10KLOC, including utilities to manage the database.


Best
Ale
