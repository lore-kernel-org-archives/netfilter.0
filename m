From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [MAINTENANCE] Shutting down FTP services at netfilter.org
Date: Wed, 3 Jun 2020 20:10:35 +0200 (CEST)
Message-ID: <nycvar.YFH.7.77.849.2006032004220.24581@n3.vanv.qr>
References: <20200603113712.GA24918@salvia> <20200603171621.GC717800@nataraja>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <20200603171621.GC717800@nataraja>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harald Welte <laforge@gnumonks.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


On Wednesday 2020-06-03 19:16, Harald Welte wrote:
>
>On Wed, Jun 03, 2020 at 01:37:12PM +0200, Pablo Neira Ayuso wrote:
>> So netfilter.org will also be shutting down FTP services by
>> June 12th 2020.
>
>I always find that somewhat sad, as with HTTP there is no real convenient
>way to get directory listings in a standardized / parseable format.

There was convention, but no standard.
Which is just like what the default directory index modules of the httpd
implementations are.

>I think the important part would be some way to conveniently obtain a
>full clone, e.g. by rsync.  This way both public and private mirrors
>can exist in an efficient way, without having to resort to 'wget -r'
>or related hacks, which then only use file size as an indication if a
>file might have changed, ...

For completeness though, there is the "Last-Modified" HTTP header (similar to
what rsync bases its heuristic on). rsync is of course always preferable..
