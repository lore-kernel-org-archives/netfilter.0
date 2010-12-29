From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd: failover problems
Date: Wed, 29 Dec 2010 15:46:21 +0100
Message-ID: <4D1B49BD.3030202@netfilter.org>
References: <AANLkTi=7BfQS07kPJyN_NO45apW-UsMZj-PUgnfboCpb@mail.gmail.com>	<4D1A176C.5000105@netfilter.org> <AANLkTimcTzk29z_9CqY9a6jNfoQrSs+V4Qx7vKRisMJh@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimcTzk29z_9CqY9a6jNfoQrSs+V4Qx7vKRisMJh@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simone Zaffalon <zaffa@zaffa.it>
Cc: netfilter@vger.kernel.org

On 29/12/10 12:40, Simone Zaffalon wrote:
> Hi Pablo.
> Thank you for the answer.
>>
>> Better use the primary-backup.sh script that is included in the
>> conntrack-tools package. You can find it under doc/sync. That script
>> should be called by your HA manager during the failover.
> 
> Already done. I've included
> /usr/share/doc/conntrackd/examples/sync/ftfw/script_master.sh in
> vip-up.sh (the ucarp script called when failover occours):
> -----------vip-up.sh--------------------------
> #! /bin/sh
> exec 2> /dev/null
> 
> /sbin/ip addr add "$2"/24 dev "$1"
> 
> # or alternatively:
> # /sbin/ifconfig "$1":254 "$2" netmask 255.255.255.0
> #!/bin/sh
> 
> /usr/sbin/conntrackd -c # commit the cache
> /usr/sbin/conntrackd -f # flush the caches
> /usr/sbin/conntrackd -R # resync with kernel conntrack table
> -----------------------------------------------
> 
> and of course i did the same with script_backup.sh in vip-down.sh

This seems to be an old script version. What conntrack-tools version are
you using?

> Now I'm switching to keepalived (to stick more with provided examples)
> and i am doing some other experiment and i let you know how far i'll
> go with that.
> In the meantime, as i asked before, is there any way to increment log
> verbosity to understand what's going on (in /var/log/conntrackd.log)?

You cannot increase verbosity but you have plenty of conntrackd -s
information to know what is going on (see manpage for -s option parameters).

I still don't know what is your problem, please provide a more detailed
procedure of what you're testing and I'll be happy to help you.

To test conntrackd, it's a good idea to start with something simple:

1) create a TCP connection between two peers that are firewalled.
2) check in the primary firewall that `conntrackd -i' shows the flow
(this is to display the internal cache).
3) check in the backup firewall that `conntrackd -e' show the foreign
flow, that means it has been correctly propagated (-e shows the external
cache).
4) for a simple failover scenario, set a link down in the primary to
trigger the failover.
5) the new primary must contain the entry with `conntrack -L' (to
display the kernel conntrack table).
6) check the logs, they must contain that one flow was injected (committed).
