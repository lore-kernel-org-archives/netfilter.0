From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd: failover problems
Date: Tue, 28 Dec 2010 17:59:24 +0100
Message-ID: <4D1A176C.5000105@netfilter.org>
References: <AANLkTi=7BfQS07kPJyN_NO45apW-UsMZj-PUgnfboCpb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=7BfQS07kPJyN_NO45apW-UsMZj-PUgnfboCpb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simone Zaffalon <zaffa@zaffa.it>
Cc: netfilter@vger.kernel.org

Hi,

On 27/12/10 15:50, Simone Zaffalon wrote:
> Hi.
> I'm trying to set-up an HA firewall with Debian, ucarp and conntrackd
> in a testbed.
> Debian is version 5.0.7 (stock kernel 2.6.26).
> 
> I have two hosts in active/passive configuration. At the moment i
> don't have any particular firewall rule in place, only a couple of
> iptables statements to nat clients ips and let them connect to
> internet:
> iptables -t nat -A POSTROUTING -s state --state
> NEW,ESTABLISHED,RELATED -p TCP -s $internal_lan -d 0/0 -j SNAT --to
> source $ext_fw_ip
> iptables -t nat -A POSTROUTING -s state --state
> NEW,ESTABLISHED,RELATED -p UDP -s $internal_lan -d 0/0 -j SNAT --to
> source $ext_fw_ip
> 
> Conntrackd is installed and conntrackd -s report no error in multicast traffic.
> Anyway i'm not able to keep the sessions active between failovers.
> I can see connections in cache external, but it seems that such
> connections are not committed.
> [Mon Dec 27 02:01:19 2010] (pid=2032) [notice] initialization completed
> [Mon Dec 27 02:01:19 2010] (pid=2041) [notice] -- starting in daemon mode --
> [Mon Dec 27 02:08:39 2010] (pid=2481) [notice] committing external cache
> [Mon Dec 27 02:08:39 2010] (pid=2481) [notice] Committed 1 new entries
> [Mon Dec 27 02:08:39 2010] (pid=2483) [notice] committing external cache
> [Mon Dec 27 02:08:39 2010] (pid=2483) [notice] Committed 0 new entries
> [Mon Dec 27 02:08:39 2010] (pid=2483) [notice] 1 entries can't be committed
> [Mon Dec 27 02:08:39 2010] (pid=2041) [notice] flushing caches
> [Mon Dec 27 02:08:39 2010] (pid=2041) [notice] resync with master table
> [Mon Dec 27 02:08:39 2010] (pid=2041) [notice] flushing caches
> [Mon Dec 27 02:08:39 2010] (pid=2041) [notice] resync with master table
> 
> As far as i understood, with this sequence of commands:
> in master
> conntrackd -n
> 
> in backup
> conntrackd -c
> conntrackd -f
> conntrackd -R

Better use the primary-backup.sh script that is included in the
conntrack-tools package. You can find it under doc/sync. That script
should be called by your HA manager during the failover.

> i should have the same sessions in master and backup (listed with
> conntrack -L) or am i totally wrong?

After the failover, you should see the flow-entries in the new primary
with conntrack -L.

> Is there any way to increment log verbosity to understand what's going on?
> I really don't know well the internals of conntrackd: am i missing
> something? Kernel parameters? sysctl settings?

Reading this helps:
http://conntrack-tools.netfilter.org/manual.html
http://conntrack-tools.netfilter.org/testcase.html

It can help you to get some more background on it and to spot what
you're doing wrong.

Please, have a look at them and let me know if your problems persist.
Include also your software versions in your reports.
