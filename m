From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: failing fail-over - commit still in progress
Date: Fri, 1 Sep 2023 10:37:47 +0200
Message-ID: <ZPGi28IJ1v1fMAzL@calendula>
References: <910b44e4-06e8-19d6-45f0-06f886a2e812@nethence.com>
 <ZNYTF+uCod++Htl9@calendula>
 <df659821-cee6-9702-e259-9db8cf290316@nethence.com>
 <ZNf013cGy81TcxoN@calendula>
 <18a0e2b8-dc7c-b9c6-77a7-8cfbe5fddb68@nethence.com>
 <ZOMtqtvQLZE38sfm@calendula>
 <0865d2fb-8720-efd8-39a1-61e22ae9acca@nethence.com>
 <ZOxUoB6Qze1dtWYh@calendula>
 <f1291caf-2103-3fcb-7e60-e5a3218624ad@nethence.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f1291caf-2103-3fcb-7e60-e5a3218624ad@nethence.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre-Philipp Braun <pbraun@nethence.com>
Cc: netfilter@vger.kernel.org

Hi,

[ Restoring Cc to netfilter@vger.kernel.org ]

On Fri, Sep 01, 2023 at 05:03:47AM +0300, Pierre-Philipp Braun wrote:
> > Did you enable CONFIG_NF_CONNTRACK_EVENTS in your kernel?
> > 
> > CONFIG_NF_CONNTRACK_EVENTS=y
> > 
> > `conntrack -E' should show events regardless your conntrackd
> > configuration when you create new flows.
> 
> I enabled NF_CONNTRACK_EVENTS and it works much better now.

This is described as a requirement in the documentation:

http://conntrack-tools.netfilter.org/manual.html

> The state shows up right away in the internal vs. external cache,
> and the fail-over works in both directions.  The MWE nftables sample
> I showed lately seems "valid", finally, as I am not catching the
> states in the middle anymore.  We can now rule-out the firewall
> issue right?
> 
> However, during a fail-over, I always see this anyhow on a receiving node:
> 
> [Fri Sep  1 00:44:21 2023] (pid=1069) [notice] committing all external caches
> [Fri Sep  1 00:44:21 2023] (pid=1069) [notice] Committed 1 new entries
> [Fri Sep  1 00:44:21 2023] (pid=1069) [notice] commit has taken 0.000059 seconds
> [Fri Sep  1 00:44:21 2023] (pid=1069) [ERROR] ignoring flush command, commit still in progress
> [Fri Sep  1 00:44:21 2023] (pid=1069) [notice] resync with master conntrack table
> [Fri Sep  1 00:44:21 2023] (pid=1069) [notice] sending bulk update
> [Fri Sep  1 00:44:29 2023] (pid=1069) [notice] resync requested by other node
> [Fri Sep  1 00:44:29 2023] (pid=1069) [notice] sending bulk update
> 
> and after that, the state is sometimes seen internal + external on
> the receiving node, otherwise everywhere internal + external +
> conntrack -L on both nodes.
> 
> In the worst and latter case, things settle down when I restart
> conntrackd on both nodes.

How are you integrating conntrackd with keepalived? Are you using
the doc/sync/primary-backup.sh script?

The error above means that the flush command was sent to conntrackd
while there was a pending commit in progress.

> > You should see UDP traffic in port 3780, unless you have changed your
> > Port in your conntrackd.conf configuration file.
> 
> Yes, I see the traffic in both directions.
> 
> I don't know what else could be wrong.  So I dig into the states
> tracker daemon config a little more.

This filtering option you are exploring below has nothing to do with
the problem you are reporting above.

> About this additional stanza in conntrackd.conf is "lazy replicas"
> equivalent of catching the states "in the middle"?  The sync error
> happens either case but I would like to make sure I can keep that
> disabled.
> 
>                 # Uncomment this line below if you want to filter by flow state.
>                 # This option introduces a trade-off in the replication: it
>                 # reduces CPU consumption at the cost of having lazy backup
>                 # firewall replicas. The existing TCP states are: SYN_SENT,
>                 # SYN_RECV, ESTABLISHED, FIN_WAIT, CLOSE_WAIT, LAST_ACK,
>                 # TIME_WAIT, CLOSED, LISTEN.
>                 #
>                 # State Accept {
>                 #       ESTABLISHED CLOSED TIME_WAIT CLOSE_WAIT for TCP
>                 # }

These are filtering option to reduce the number of synchronization
messages, see documentation.

> About the Address ignore list, I tried following the FTFW sample by
> ignoring local IPs and VIPs.  Also the other way around for testing,
> tracking --only-- the target systems behind DNAT:
> 
>                 Address Accept {
>                         IPv4_address 10.1.0.0/16
>                 }

This is again a filtering option to reduce synchronization messages.

> ==> gives the same result, exact same symptoms (commit error and states are all around)
> 
> 
> What could be causing the commit error...

Please, provide more information on how you integrate keepalived with
conntrackd. Revisit documentation to make sure things are done
according to what it described.

> ... and the states to show up on both nodes even with conntrack -L?

See doc/sync/primary-backup.sh script does not flushes the kernel
table after failover, instead it shortens the timeout of the old
entries in the backup to let them expire sooner:

        $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -t

> This is how the PoC 2 setup looks like now:
> 
> linux 6.1.49.domU (defconfig+xen+few more things built-in, no modules)
> and debian 12.1 packages
>   conntrack-tools v1.4.7
>   libnfnetlink 1.0.2
>   keepalived 2.2.7
> 
> Thanks
