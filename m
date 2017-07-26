From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: conntrackd exits during failover when there are around 30000 connections
Date: Wed, 26 Jul 2017 09:04:45 +0200
Message-ID: <CAOkSjBh+sXpNo2ezv35E+py_d76aWSJ7qZo=wHAs=UgG+_pvMw@mail.gmail.com>
References: <733DB87B7669B346B4428487F4A99461230594E8@USMLVA0EM23MSX.ww017.siemens.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <733DB87B7669B346B4428487F4A99461230594E8@USMLVA0EM23MSX.ww017.siemens.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "PATEL, SAMEER" <sameer.patel@siemens.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 25 July 2017 at 16:32, PATEL, SAMEER <sameer.patel@siemens.com> wrote:
> Hi,
>
> I'm having some problems with the following configuration:
>
> - Two firewalls in a master-backup configuration managed by keepalived
> - A single dedicated link between the two firewalls managed by conntrackd
>
> Now, if I make around 30000 connections between a computer and a server behind the firewall, and the master firewall fails, then conntrackd exits (or perhaps crashes). I don't think this is an out-of-memory issue because conntrackd didn't have the highest OOM score before it failed. Also, I watched memory usage while this was going on and there seemed to be plenty.
>
> Is there some tweak or configuration parameter that enables support for large numbers of connections? Any insights into this issue would be greatly appreciated.
>

Could you share which version are you running? both of the kernel,
conntrackd (and libnetfilter-conntrackd).
Did you look at the logs? usually /var/log/conntrackd.log.

If conntrackd is hitting some errors, for example, failed to commit
some entries, then some log lines should be there.
