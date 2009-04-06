From: Patrick McHardy <kaber@trash.net>
Subject: Re: esp mark not working
Date: Mon, 06 Apr 2009 17:16:45 +0200
Message-ID: <49DA1CDD.3070006@trash.net>
References: <23930137.5021238461161128.JavaMail.root@mail.redgrid.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <23930137.5021238461161128.JavaMail.root@mail.redgrid.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lewis Shobbrook <lew@redgrid.net>
Cc: netfilter@vger.kernel.org

Lewis Shobbrook wrote:
> Hi all,
> 
> Much to my surprise, I've not been able to mark esp packets in the mangle table.
> Although esp packets are traversing as they should, the iptables counters are unmoved from zero and as you'd expect rules applied against the mark fail also.

That indicates a problem in the matching rules, the counters are
unaffected by the target. I'd suggest to use the TRACE target to
figure out what is happening.

