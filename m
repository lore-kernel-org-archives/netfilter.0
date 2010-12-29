From: Simone Zaffalon <zaffa@zaffa.it>
Subject: Re: conntrackd: failover problems
Date: Wed, 29 Dec 2010 12:40:03 +0100
Message-ID: <AANLkTimcTzk29z_9CqY9a6jNfoQrSs+V4Qx7vKRisMJh@mail.gmail.com>
References: <AANLkTi=7BfQS07kPJyN_NO45apW-UsMZj-PUgnfboCpb@mail.gmail.com>
	<4D1A176C.5000105@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type;
        bh=Qgjydown1Y41rjSoCH0TsJMmUkcqbGfXMdJhhl5t0Y8=;
        b=pzBGhkYsLoOL5o9bjA5TcLH21IjbfPf51I60mtFCRch5Cu8zuAt6mOyegGOhId9YHA
         ++umpXiRqjMR94DtD4XyqGhMaJKhOdBQvRnSzCWjwcac4UaLpK8hA3xXvYGX825pORyI
         rv7I2j3ci1WqeDzfNjEPO6OKsrO0oL+tNp+W0=
In-Reply-To: <4D1A176C.5000105@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo.
Thank you for the answer.
>
> Better use the primary-backup.sh script that is included in the
> conntrack-tools package. You can find it under doc/sync. That script
> should be called by your HA manager during the failover.

Already done. I've included
/usr/share/doc/conntrackd/examples/sync/ftfw/script_master.sh in
vip-up.sh (the ucarp script called when failover occours):
-----------vip-up.sh--------------------------
#! /bin/sh
exec 2> /dev/null

/sbin/ip addr add "$2"/24 dev "$1"

# or alternatively:
# /sbin/ifconfig "$1":254 "$2" netmask 255.255.255.0
#!/bin/sh

/usr/sbin/conntrackd -c # commit the cache
/usr/sbin/conntrackd -f # flush the caches
/usr/sbin/conntrackd -R # resync with kernel conntrack table
-----------------------------------------------

and of course i did the same with script_backup.sh in vip-down.sh

Now I'm switching to keepalived (to stick more with provided examples)
and i am doing some other experiment and i let you know how far i'll
go with that.
In the meantime, as i asked before, is there any way to increment log
verbosity to understand what's going on (in /var/log/conntrackd.log)?

Thanks again
Regards
Simone Zaffalon
