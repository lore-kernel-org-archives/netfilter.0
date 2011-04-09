From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Howto get ulog-prefix with ulogd-1.24 + sqlite3 backend?
Date: Sat, 9 Apr 2011 14:17:42 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104091417270.9457@obet.zrqbmnf.qr>
References: <BANLkTingf+1nKHejX9XHcyep0DOHA__ghw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTingf+1nKHejX9XHcyep0DOHA__ghw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: netfilter@vger.kernel.org

On Saturday 2011-04-09 14:13, Clemens Eisserer wrote:

>Hi,
>
>We try to use ulog for traffic accounting in an university project.
>
>First we tried ulogd-2.0beta4 + pgsql backend, but even under moderate
>load the database couldn't keep pace with the amount of requests.
>I thought about using ulog2 with sqlite, however in TODO theres an
>entry about making ulogd2 compatible with squlite, so I guessed sqlite
>is not yet supported with ulogd2?

ulogd2 does have a sqlite backend already.
