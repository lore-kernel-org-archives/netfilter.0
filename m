From: Nick Taylor <nickt@lightlink.com>
Subject: Re: how to remove rules
Date: Tue, 23 Nov 2004 12:11:57 -0500 (EST)
Message-ID: <Pine.GSU.4.58.0411231207570.24170@adore.lightlink.com>
References: <a0f69e5041123012925d5cfaf@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e5041123012925d5cfaf@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Askar <askarali@gmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Tue, 23 Nov 2004, Askar wrote:

> Date: Tue, 23 Nov 2004 14:29:35 +0500
> From: Askar <askarali@gmail.com>
> To: netfilter <netfilter@lists.netfilter.org>
> Subject: how to remove rules
>
> hi
> I have trying to remove the extra rules from my routing tables,
> however with no luck
> Also I want to know these duplicate entries have an effect on packets
> going routed?
> I have this overwhelming rules lists from my predessor who added the
> "ip rule add fwmark" entries in firewall script, and on each run of
> firewall script its creates an extra entry in routing table.
> Now I want to get rid of  an extras "from all fwmark 0x2 lookup
> squid.out" leaving only one that what's I needs.
>
>
> here is the output of "ip rule ls"
>
> 0:      from all lookup local
> 32742:  from all fwmark 0x2 lookup squid.out
> ...........
> 32764:  from all fwmark 0x2 lookup squid.out
> 32765:  from all fwmark 0x2 lookup squid.out
> 32766:  from all lookup main
> 32767:  from all lookup 253
>
>
Well, I had this same problem, and I didn't find an official solution, so
the following shell script does what I need.  It's exactly the opposite of
elegant, but at least it's not nonfunctional.

#!/bin/sh

FWMARKS=`ip rule list | grep fwmark | wc -l`

if [ $FWMARKS != "0" ]; then
  echo $FWMARKS fwmarks exist, flushing...
  ip rule list | grep fwmark | cut -d " " -f 6 | \
    xargs --max-args=1 ip rule del fwmark
else
  echo $FWMARKS fwmarks exist, la dee da...
fi


