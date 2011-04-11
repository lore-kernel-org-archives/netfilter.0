From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Howto get ulog-prefix with ulogd-1.24 + sqlite3 backend?
Date: Mon, 11 Apr 2011 16:57:39 +0200
Message-ID: <4DA316E3.5050309@netfilter.org>
References: <BANLkTingf+1nKHejX9XHcyep0DOHA__ghw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTingf+1nKHejX9XHcyep0DOHA__ghw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: netfilter@vger.kernel.org

On 09/04/11 14:13, Clemens Eisserer wrote:
> Hi,
> 
> We try to use ulog for traffic accounting in an university project.
> 
> First we tried ulogd-2.0beta4 + pgsql backend, but even under moderate
> load the database couldn't keep pace with the amount of requests.
> I thought about using ulog2 with sqlite, however in TODO theres an
> entry about making ulogd2 compatible with squlite, so I guessed sqlite
> is not yet supported with ulogd2?

The support for sqlite3 was recently added in the git tree. Get a git
snapshot. I have tested it here. I'd appreciate if you let me know how
it goes.

> Then we switched back to ulog-1.24 + squlite3, which works perfectly.
> It can handle 100mbit/s torrent traffic at about ~50% CPU load.
> However in sqlite's ulog table, the ulog-prefix is not stored. Is
> there any way to get it stored - to be able to track which rule caused
> the log enrty?

You mean the log prefix? The ulogd2 version includes it for sqlite3.

> Also, conntrack is supported in ulogd2. Is this also true for
> ulogd1.2? I couldn't find specific docs about that.

No ulogd1.2 does not support conntrack, only packet-based logging.
