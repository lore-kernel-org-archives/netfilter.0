From: Bernhard Bock <mailinglists@bock.nu>
Subject: Re: conntrackd failover works partially
Date: Mon, 21 Jul 2008 16:22:54 +0200
Message-ID: <48849BBE.5060403@bock.nu>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu> <4883DA4D.4080906@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4883DA4D.4080906@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Pablo,

Pablo Neira Ayuso wrote:
> As you're using the Alarm mode, the time required to resynchronize the
> backup and the master is RefreshTime (which is 15 seconds in your config
> files). Are you probably triggering the fail-over before that amount of
> time?

No, I always waited longer. My keepalived has a pre-emption delay of 
30sec before becoming master, and I always did wait at least a minute or 
so before triggering a failback.


> Basically, you must to find the same
> set of flows in the master's internal-cache and the backup's
> external-cache if everything goes fine.

That's exactly what I can observe. They are consistent when the failover 
goes fine, and they're not when I have INVALID packets.

I also see 'conntrack -E' working with 100 parallel TCP connections, and 
dying with "Operation failed: No buffer space available" with 1000 
connections. Maybe this is related?
As written in my last mail, I increased the SocketBufferSize to 256M and 
the SocketBufferSizemaxGrown to 1024M in conntrackd.conf.


> Until we reach conntrack-tools-1.0, which I expect to reach soon since
> most of the pending work is already done, I suggest you to upgrade to
> lastest (as for now, it is 0.9.7). This release includes important
> improvements, fixes and features. The alarm mode is a bit spamming, I
> also suggest you to give a try to the ft-fw and the notrack approaches.

Let me give you a short update after upgrading:

I upgraded to conntrack-tools 0.9.7, libnflink 0.0.39 and 
libnetfilter_conntrack 0.0.96. Basically, I took already available 
Fedora 10 source RPMs and compiled them for Fedora 9.

Without failover, it seems to work at the first glance. In 'conntrackd 
-s' I see plausible numbers of entries in internal and external caches. 
Unfortunately, it still breaks on many failovers with 1000 parallel TCP 
connections.

Now I get a lot of the following entries in syslog in addition to the 
INVALID packets:
conntrack-tools[21319]: cache_wt crt-upd: Invalid argument
conntrack-tools[21319]: cache_wt update:Invalid argument

After a failed failover, I have to flush the connection table and 
stop/restart both conntrackd processes in order to make it work again.


In FT-FW mode, the failover always fails, and it produces log entries like:

conntrack-tools[25448]: The other node says HELLO
conntrack-tools[25448]: sending bulk update
--- failover here ---
conntrack-tools[25515]: committing external cache
conntrack-tools[25515]: commit: Invalid or incomplete multibyte or wide 
character
conntrack-tools[25448]: cache_wt update:Invalid or incomplete multibyte 
or wide character
conntrack-tools[25515]: Committed 28224 new entries
conntrack-tools[25515]: 8 entries can't be committed
conntrack-tools[25448]: resync with master table
conntrack-tools[25448]: cache_wt update:Timer expired
conntrack-tools[25448]: cache_wt update:Timer expired

I haven't tried the notrack mode yet.

best regards
Bernhard

