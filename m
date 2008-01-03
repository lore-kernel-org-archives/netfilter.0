From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack accounting
Date: Thu, 03 Jan 2008 16:54:59 +0100
Message-ID: <477D0553.4010906@netfilter.org>
References: <477704CB.8030809@channing-bete.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <477704CB.8030809@channing-bete.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ben Lentz <BLentz@channing-bete.com>
Cc: netfilter@vger.kernel.org

Hi,

Ben Lentz wrote:
> I am considering using the conntrack-tools userspace package to perform
> byte level accounting for iptables by reading events from the connection
> tracking table for completed connections and logging the statistics for
> the stateful connection to syslog. It appears that conntrack was really
> designed to keep redundant firewalls' state tables in sync, but I'm
> intrigued by it's ability to use the new connection tracking and state
> notification features in netfilter without having to parse or poll
> /proc/net/ip_conntrack.
> 
> The goal I'm trying to accomplish is similar to that of:
> conntrack -E conntrack -e DESTROY | logger -t conntrack &

I just committed a patch to SVN which implements this for the statistics
mode. Have a look at the doc/stats/conntrackd.conf example file and
enable logging to give it a try. This will be available in the upcoming
conntrack-tool 0.9.6 release. Don't forget to run conntrackd with the -S
option.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
