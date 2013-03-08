From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Netfilter applied to specific interfaces only
Date: Fri, 8 Mar 2013 20:52:37 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1303082046110.28399@nerf07.vanv.qr>
References: <CADju=b7RdboFOXvPRSn=Ax-+pihecm_Txf-JCHLYum_gjSC9dw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADju=b7RdboFOXvPRSn=Ax-+pihecm_Txf-JCHLYum_gjSC9dw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Mellander <jmellander@lbl.gov>
Cc: netfilter@vger.kernel.org


On Friday 2013-03-08 20:14, Jim Mellander wrote:
>
>In the HPC world, and in network intrusion detection, network
>performance is paramount.  We've found that just having the iptables
>kernel module loaded without any ruleset substantially reduces
>performance at high traffic rates.

This one is a known issue with ip_tables/x_tables, and solved in 
xtables2 where you can deallocate the base chains when empty -- (more 
accurately, they do not exist by default and need to be created first) 
-- given finer control over what is being executed.


>Disabling IPTables (and unloading the associated kernel modules)
>seemed to significantly improve performance, but running with IPTables
>disabled in production is undesirable.
>
>Typically, we have interfaces that are external facing that we would
>like to run IPtables on, but the internal interfaces which are just
>for internal cluster communications must run as fast as possible.

Netfilter hooks only run on selected protocols, so at least
the special protocols InfiniBand and what-have-you are unaffected.

Assuming though that you are talking about plain Ethernet protocols:
testing for an interface will be the one costly operation
that all packets have to muster. I suppose the only way to get
around this are network namespaces, as hooks are per netns.
But netns itself probably brings you some new caveats.


Jan
