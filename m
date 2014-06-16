From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd  crash after few seconds
Date: Mon, 16 Jun 2014 14:08:11 +0200
Message-ID: <20140616120811.GA17711@localhost>
References: <53908A7E.4020802@yahoo.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53908A7E.4020802@yahoo.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas RENAULT <nicolas_renault@yahoo.fr>
Cc: netfilter@vger.kernel.org

On Thu, Jun 05, 2014 at 05:19:26PM +0200, Nicolas RENAULT wrote:
> General {
>     Nice -20
>     Scheduler {
>         Type FIFO
>         Priority 99
>     }
>     HashSize 32768
>     HashLimit 131072
>     LogFile on
>     Syslog off
>     LockFile /var/lock/conntrack.lock
>     UNIX {
>         Path /var/run/conntrackd.ctl
>         Backlog 20
>     }
>     NetlinkBufferSize 2097152
>     NetlinkBufferSizeMaxGrowth 8388608
>     NetlinkOverrunResync On
>     NetlinkEventsReliable Off
>     PollSecs 15

I guess the assertion happens after 15 seconds.

conntrack-tools 1.2 includes expectation support which is broken with
PollSecs. The code for polling expectations is missing. Thus, the
assertion problem that you're reporting.

The problem is still there in 1.4.x, this needs a patch.
