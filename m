From: Karl Heiss <kheiss@gmail.com>
Subject: Re: Adding features to xt_recent and xt_cluster
Date: Thu, 9 Jun 2011 08:29:20 -0400
Message-ID: <BANLkTimRA6Vae7NW_37CApTP2Z0kGn09xg@mail.gmail.com>
References: <BANLkTi=os6R7oUa6B_snwKPtNAfQA=i4GQ@mail.gmail.com>
	<alpine.LNX.2.01.1106082205360.13030@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=PAkRc8eh7o8nQ9vFpb1bJP1T7ierhohhwTKLsbWHB5A=;
        b=SOhMWqCrtYyBzCnl/35STvNqYm1P9fLa+hyp8izhLZ0n20eZ1KdG7tJYAkU75NDoJQ
         x+Ozqc71Qyk9GQu0YG+NyIzY/fhjsbVQcK6iIwmmjGHuns6I2NvKwAxqA3IZIT+Ct0b1
         Q35SIF2oamnLSLwvoMvDzd1H/jCFt8sVFOT7w=
In-Reply-To: <alpine.LNX.2.01.1106082205360.13030@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Wed, Jun 8, 2011 at 4:08 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
>
> On Wednesday 2011-06-08 16:57, Karl Heiss wrote:
>>
>>For the xt_recent module, I will be updating the module to support
>>matching by destination IP, source-port and destination port. Port
>>matching would be supported via the '--rsport' and '--rdport' flags,
>>and would default to the current behavior of matching IP only if
>>neither is specified.
>>
>>Many might be wondering why I choose to include matching by
>>destination IP since it appears that xt_recent matches destinations
>>using --rdest. However, xt_recent does not appear to differentiate
>>between source and destination addresses within it's entry tables.
>
> You could use two separate tables, which has the same effect as
> storing entries with a unique key of <saddr-or-daddr-bit, addr>
> in a single table, unless I missed something.
>

I assume you mean something like this:

iptables -A INPUT -p tcp --dport 23 -m recent --rcheck --seconds 30 -j DROP
iptables -A INPUT -p tcp --dport 23 -m recent --set -j DROP

The problem is, unless you have a deterministic (from the view of
iptables) rule to match when you '--set', you cannot accurately match
a recent entry.  For instance, the rules below would not allow you to
deterministically know which sourceip-sourceport combination would
match which recent table name (clust1 or clust2).


iptables -A FORWARD -m recent --name clust1 --update -j clust1-chain
iptables -A FORWARD -m recent --name clust2 --update -j clust2-chain

iptables -A clust1-chain -m recent --name clust1 --set -j CLUSTERIP
--new --clustermac 01:00:5e:00:00:20 --total-nodes 2 --local-node 1
--hashmode sourceip-sourceport
iptables -A clust2-chain -m recent --name clust2 --set -j CLUSTERIP
--new --clustermac 01:00:5e:00:00:20 --total-nodes 2 --local-node 2
--hashmode sourceip-sourceport


In this case, I see no other way around this issue other than to store
the source port within the recent table.

PS.  After taking a second look at the code, I realized I stuck my
foot in my mouth about xt_recent not differentiating between saddr and
daddr.  It does indeed differentiate by choosing the correct address
from the incoming packet to match against the entry IPs.
