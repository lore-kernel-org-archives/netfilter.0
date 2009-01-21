From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Wed, 21 Jan 2009 21:52:04 +0100
Message-ID: <49778AF4.7000201@netfilter.org>
References: <497760CB.6090008@univ-nantes.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <497760CB.6090008@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: yoann.juet@univ-nantes.fr
Cc: netfilter@vger.kernel.org

Hi Yoann,

Yoann Juet wrote:
> I have a testbed cluster with two firewall nodes and conntrack sync.
> Initially, node1 is the primary and node2 the backup.
> 
> 1) I open a jabber connection. node1 replicates the conntrack session to
> node2 (conntrackd in synchronization mode FT-FW).
> 2) First failover : node2 becomes the new primary, node1 the backup.
> node2 recovers the TCP session. Everything seems to work fine at this
> moment.
> 3) Second failover : just 1 to 2 minutes after the first failove, node1
> becomes the primary, node2 the backup. The jabber TCP session is still
> into the conntrack table but the session is broken. I see many packets
> denied due to the INVALID state.
> 
> "nf_ct_tcp: ACK is over the upper bound (ACKed data not seen yet) IN=
> OUT=xxxxxx"
> 
> The TCP window tracking rejects packets after the second failober. I
> just have to activate "nf_conntrack_tcp_be_liberal" to make it work
> again, but that's not, for me, a good solution:
> 
> echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal
> 
> Why conntrackd cannot recover the TCP session in the second failover ?
> Is it a known issue, possibly due to a misconfiguration ? I'm using
> debian/lenny (kernel 2.6.26-1-amd64) with heartbeat2, conntrack 0.9.6
> and a shell script that executes :
> 
> ** on the new primary :
>                conntrackd -c -C /etc/conntrackd.conf
>                conntrackd -f -C /etc/conntrackd.conf
>                conntrackd -R -C /etc/conntrackd.conf
> 
> ** on the new backup :
>                conntrackd -n -C /etc/conntrackd.conf

Please, have a look at the conntrackd log file (/var/log/conntrackd.log
or syslog depending on your configuration). I think that it must be
reporting EINVAL while trying to update the entries during the second
fail-over.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
