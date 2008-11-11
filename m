From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd + mark problems
Date: Tue, 11 Nov 2008 11:23:10 +0100
Message-ID: <49195D0E.2050906@netfilter.org>
References: <491879DD.2060608@3gnt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <491879DD.2060608@3gnt.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Igor Neves <igor@3gnt.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Igor Neves wrote:
> Hi,
> 
> First of all, i would like to thanks you, for your great your.
> 
> I have setup two firewalls with conntrackd in Centos 5, and everything
> it's ok and working as it should. By the way I have used heartbeat as HA
> manager, for that I have to develop conntrackd init script, and one ocf
> script for heartbeat. There are any interest in adding them to tree?

If they are generic enough to help others to set up hearbeat +
conntrackd, I'll be fine with it. Please, send them to me so I can check
them and don't forget to add the corresponding credits.

> I just have found one problem, in this 2 firewalls I need to setup
> "Policy Routing" and "Policy Shaper", but our solutions are based on
> mark's.
> 
> I noticed that when the the backup firewall takes over the service(go to
> primary), and the primary goes to state backup, the connmark connections
> move from one to the other without any problem but it does not take the
> mark with it, it always insert the rule in the new primary with "mark=0".
> 
> Is this a configuration problem? A todo item? A bug?

Looking at the archives, conntrack-tools >= 0.9.5 and Linux kernel >=
2.6.20 supports connmarking. Please, try to guess where the connmark is
getting lost:

(in the primary) # conntrack -L                # shows kernel table
(in the primary) # conntrackd -i               # shows userspace cache
(in the backup)# conntrackd -e                 # shows external cache

They all should show the connmark. And also try:

# conntrack -I -s 1.1.1.1 -d 2.2.2.2 -p tcp --sport 1111 --dport 2222 -t
10 -u SEEN_REPLY --state SYN_SENT -m 1

This lines creates an entry manually with the command line tool - line
above. Please, check that the mark is set.

> Thanks for your help,
> PS: I know I should send this to the list, but I'm not subscribed, sorry.

I'm Cc'ing netfilter users mailing list, just to keep this for the record.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
