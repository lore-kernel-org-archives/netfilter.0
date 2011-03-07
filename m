From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: connlimit
Date: Mon, 7 Mar 2011 13:04:14 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1103071257540.32524@obet.zrqbmnf.qr>
References: <AANLkTimvu4CSZqsrbMgJHLXB5L8asRpZ+Aq7UM18MWhg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimvu4CSZqsrbMgJHLXB5L8asRpZ+Aq7UM18MWhg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benjamin fernandis <benjo11111@gmail.com>
Cc: netfilter@vger.kernel.org

On Monday 2011-03-07 12:53, benjamin fernandis wrote:

>Hi,
>
>I have a mail server with web server which have 500 customers site and
>mail account.Since couple of days i m suffering with so many
>connections.
>
>So please guide me to configure ratelimit for that.I need to confiugre
>connlimit for http , imap , imaps, pop, smtp.
>
>and also suggest me connlimit value which is ideal for my setup.
>
>	OS REDHAT 5.5

The OS value is suboptimal, since the 5.x series's kernel and iptables 
is old and ships a broken connlimit.
